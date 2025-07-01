import 'package:app/screens/task/widgets/image_screen.dart';
import 'package:app/screens/task/widgets/pdf_screen.dart';
import 'package:shared/models/attachment/attachment_model.dart';
import 'package:shared/shared.dart';

class AttachmentBubble extends StatelessWidget {
  final Object file;
  final Color? color;

  const AttachmentBubble({super.key, required this.file, this.color});

  String get _getName {
    if (file is XFile) {
      return (file as XFile).name;
    } else if (file is AttachmentModel) {
      return (file as AttachmentModel).name;
    } else {
      return '';
    }
  }

  String get _getPath {
    if (file is XFile) {
      return (file as XFile).path;
    } else if (file is AttachmentModel) {
      return (file as AttachmentModel).url;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final isPdf = _getName.contains(".pdf");
        final path = _getPath;
        if (isPdf) {
          if (file is XFile) {
            OpenFile.open(path);
          } else {
            context.navigate((context) {
              return PdfScreen(url: (file as AttachmentModel).url);
            });
          }
        } else {
          context.navigate((context) {
            return ImageScreen(file: file);
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        height: 40,
        constraints: const BoxConstraints(maxWidth: 150),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? context.colorPalette.greyF5F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Text(
          _getName,
          style: TextStyle(
            color: context.colorPalette.grey8B8,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
