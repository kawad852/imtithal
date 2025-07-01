import 'package:shared/shared.dart';

class PdfScreen extends StatelessWidget {
  final String url;

  const PdfScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: SfPdfViewer.network(url)));
  }
}
