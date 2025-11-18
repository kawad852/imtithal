import 'dart:io';

import 'package:shared/models/attachment/attachment_model.dart';
import 'package:shared/shared.dart';

class ImageScreen extends StatelessWidget {
  final Object file;
  final VoidCallback? onDelete;

  const ImageScreen({super.key, required this.file, required this.onDelete});

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.appLocalization.delete),
          content: Text(context.appLocalization.deleteBody),
          actions: <Widget>[
            TextButton(
              child: Text(context.appLocalization.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FilledButton(
              child: Text(context.appLocalization.confirm),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                if (onDelete != null) {
                  print("aslkfjakljsf");
                  onDelete!();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (file is AttachmentModel)
            IconButton(
              onPressed: () {
                _showMyDialog(context);
              },
              icon: const Icon(Icons.delete),
            ),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            if (file is XFile) {
              return Image.file(File(((file as XFile).path)));
            } else {
              return Image.network(
                (file as AttachmentModel).url,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value:
                          loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
