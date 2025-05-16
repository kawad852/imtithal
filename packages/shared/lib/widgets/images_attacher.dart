import 'dart:io';

import 'package:shared/shared.dart';

class ImagesAttacher extends StatefulWidget {
  final void Function(List<XFile> files) onChanged;

  const ImagesAttacher({super.key, required this.onChanged});

  @override
  State<ImagesAttacher> createState() => _ImagesAttacherState();
}

class _ImagesAttacherState extends State<ImagesAttacher> {
  final List<XFile> _files = [];

  Future<void> _pickImages(BuildContext context) async {
    AppOverlayLoader.fakeLoading();
    List<XFile> files = await ImagePicker().pickMultiImage(
      // maxWidth: widget.size.width + kImageSizeVariation,
    );
    if (files.isNotEmpty) {
      setState(() {
        _files.addAll(files);
      });
      widget.onChanged(_files);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _pickImages(context);
          },
          child: Row(
            children: [
              const CustomSvg(MyIcons.attachSquare),
              const SizedBox(width: 11),
              Text(
                context.appLocalization.attachFiles,
                style: TextStyle(
                  color: context.colorPalette.black252,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children: List.generate(_files.length, (index) {
            final file = _files[index];
            return Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: FileImage(File(file.path)), fit: BoxFit.cover),
              ),
            );
          }),
        ),
      ],
    );
  }
}
