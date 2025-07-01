import 'dart:io';

import 'package:shared/models/attachment/attachment_model.dart';
import 'package:shared/shared.dart';

class ImageScreen extends StatelessWidget {
  final Object file;

  const ImageScreen({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
