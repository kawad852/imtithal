import 'dart:io';

import 'package:shared/models/attachment/attachment_model.dart';
import 'package:shared/shared.dart';

class AttachmentsList extends StatelessWidget {
  final List<Object> files;

  const AttachmentsList({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: SingleChildScrollView(
        child: Row(
          children:
              files
                  .map((e) {
                    if (e is XFile) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(File(e.path), height: 90, width: 90, fit: BoxFit.cover),
                      );
                    } else if (e is AttachmentModel) {
                      // if(e.url.contains(".pdf")) {
                      //   return
                      // }
                      return BaseNetworkImage(e.url, height: 90, width: 90);
                    } else {
                      return BaseNetworkImage(e as String, height: 90, width: 90);
                    }
                  })
                  .separator(const SizedBox(width: 10))
                  .toList(),
        ),
      ),
    );
  }
}
