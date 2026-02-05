import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shared/shared.dart';

class PdfFileGeneretor {
  static Future<File> generateUserSummaryPdf({
    required UserModel user,
    required DateTime startDate,
    required DateTime endDate,
    required int inCompletedTasksCount,
    required int completedTasksCount,
    required int lateTasksCount,
    required int violationTasksCount,
    String? departmentName,
  }) async {
    final logoData = await rootBundle.load('assets/images/logo.png');
    final arabicFont = await _loadIbmPlexSansArabicFont();
    final logoImage = pw.MemoryImage(logoData.buffer.asUint8List());
    final doc = pw.Document();
    final dateFormat = DateFormat.yMd('ar');
    final rangeText = '${dateFormat.format(startDate)} - ${dateFormat.format(endDate)}';
    final safeDepartmentName = (departmentName ?? '').trim();

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) {
          return pw.Theme(
            data: pw.ThemeData.withFont(base: arabicFont, bold: arabicFont),
            child: pw.Directionality(
              textDirection: pw.TextDirection.rtl,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  _buildHeader(logoImage, rangeText),
                  pw.SizedBox(height: 16),
                  _buildSectionTitle('بيانات الموظف'),
                  pw.SizedBox(height: 8),
                  _buildInfoCard([
                    _buildInfoRow('الاسم', user.displayName),
                    _buildInfoRow('المسمى الوظيفي', user.jobTitle),
                    _buildInfoRow('القسم', safeDepartmentName.isEmpty ? '-' : safeDepartmentName),
                    _buildInfoRow('الرقم الوظيفي', user.rowId ?? '-'),
                    _buildInfoRow('الفترة', rangeText),
                  ]),
                  pw.SizedBox(height: 16),
                  _buildSectionTitle('ملخص الحالات'),
                  pw.SizedBox(height: 8),
                  pw.Row(
                    children: [
                      pw.Expanded(
                        child: _buildStatCard(
                          label: 'غير مكتمل',
                          value: '$inCompletedTasksCount',
                          background: const PdfColor.fromInt(0xFFF5F5F5),
                          accent: const PdfColor.fromInt(0xFF04BF8A),
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Expanded(
                        child: _buildStatCard(
                          label: 'مكتمل',
                          value: '$completedTasksCount',
                          background: const PdfColor.fromInt(0xFF04BF8A),
                          accent: const PdfColor.fromInt(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 10),
                  pw.Row(
                    children: [
                      pw.Expanded(
                        child: _buildStatCard(
                          label: 'متأخر',
                          value: '$lateTasksCount',
                          background: const PdfColor.fromInt(0xFFFFE48A),
                          accent: const PdfColor.fromInt(0xFFC39600),
                        ),
                      ),
                      pw.SizedBox(width: 10),
                      pw.Expanded(
                        child: _buildStatCard(
                          label: 'مخالفة',
                          value: '$violationTasksCount',
                          background: const PdfColor.fromInt(0xFFFFCAC7),
                          accent: const PdfColor.fromInt(0xFFC10C01),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final fileName = _buildFileName(user.displayName, startDate, endDate);
    final file = File(path.join(directory.path, fileName));
    await file.writeAsBytes(await doc.save());
    await OpenFile.open(file.path);
    return file;
  }

  static String _buildFileName(String displayName, DateTime startDate, DateTime endDate) {
    final safeName = displayName.trim().replaceAll(RegExp(r'[^A-Za-z0-9_-]+'), '_');
    final startText = DateFormat('yyyyMMdd').format(startDate);
    final endText = DateFormat('yyyyMMdd').format(endDate);
    return 'user_summary_${safeName}_$startText-$endText.pdf';
  }

  static Future<pw.Font> _loadIbmPlexSansArabicFont() async {
    final fontData = await rootBundle.load('packages/shared/assets/fonts/naksh.ttf');
    return pw.Font.ttf(fontData.buffer.asByteData());
  }

  static pw.Widget _buildHeader(pw.MemoryImage logoImage, String rangeText) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: pw.BoxDecoration(
        color: const PdfColor.fromInt(0xFF252E40),
        borderRadius: pw.BorderRadius.circular(16),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'ملخص الموظف',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: const PdfColor.fromInt(0xFF04BF8A),
                ),
                textAlign: pw.TextAlign.right,
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                rangeText,
                style: pw.TextStyle(fontSize: 11, color: const PdfColor.fromInt(0xFF8B8B8B)),
                textAlign: pw.TextAlign.right,
              ),
            ],
          ),
          pw.Container(
            width: 52,
            height: 52,
            padding: const pw.EdgeInsets.all(8),
            decoration: pw.BoxDecoration(
              color: const PdfColor.fromInt(0xFFFFFFFF),
              borderRadius: pw.BorderRadius.circular(12),
            ),
            child: pw.Image(logoImage, fit: pw.BoxFit.contain),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildSectionTitle(String title) {
    return pw.Align(
      alignment: pw.Alignment.centerRight,
      child: pw.Text(
        title,
        style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
        textAlign: pw.TextAlign.right,
      ),
    );
  }

  static pw.Widget _buildInfoCard(List<pw.Widget> rows) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        color: const PdfColor.fromInt(0xFFF5F5F5),
        borderRadius: pw.BorderRadius.circular(12),
      ),
      child: pw.Column(children: rows),
    );
  }

  static pw.Widget _buildInfoRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 8),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(
            width: 90,
            child: pw.Text(
              label,
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                color: const PdfColor.fromInt(0xFF252E40),
              ),
              textAlign: pw.TextAlign.right,
            ),
          ),
          pw.SizedBox(width: 10),
          pw.Expanded(child: pw.Text(value.isEmpty ? '-' : value, textAlign: pw.TextAlign.right)),
        ],
      ),
    );
  }

  static pw.Widget _buildStatCard({
    required String label,
    required String value,
    required PdfColor background,
    required PdfColor accent,
  }) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(color: background, borderRadius: pw.BorderRadius.circular(12)),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Text(
            label,
            style: pw.TextStyle(fontSize: 11, color: const PdfColor.fromInt(0xFF252E40)),
            textAlign: pw.TextAlign.right,
          ),
          pw.SizedBox(height: 6),
          pw.Text(
            value,
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold, color: accent),
            textAlign: pw.TextAlign.right,
          ),
        ],
      ),
    );
  }
}
