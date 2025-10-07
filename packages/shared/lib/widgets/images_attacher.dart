import 'package:app/screens/task/widgets/attachment_bubble.dart';
import 'package:shared/shared.dart';

class ImagesAttacher extends StatefulWidget {
  final void Function(List<XFile> files)? onChanged;
  final String? title;
  final List<Object> files;
  final Color? bubbleColor;

  const ImagesAttacher({
    super.key,
    required this.onChanged,
    this.title,
    required this.files,
    this.bubbleColor,
  });

  @override
  State<ImagesAttacher> createState() => _ImagesAttacherState();
}

class _ImagesAttacherState extends State<ImagesAttacher> {
  final List<Object> _files = [];

  // Future<void> _pickImages(BuildContext context) async {
  //   try {
  //     AppOverlayLoader.fakeLoading();
  //     final result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
  //     );
  //     if (result != null && result.files.isNotEmpty) {
  //       final files = result.files.map((e) => e.xFile).toList();
  //       setState(() {
  //         _files.addAll(files);
  //       });
  //       if (widget.onChanged != null) {
  //         widget.onChanged!(files);
  //       }
  //     }
  //   } catch (e) {
  //     print("errrp:: $e");
  //   }
  // }

  Future<void> _pickMedia(BuildContext context) async {
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
        requestType: RequestType.image, // or RequestType.common if video as well
      ),
    );
    if (assets != null && assets.isNotEmpty) {
      List<XFile> imageFiles = [];
      for (var asset in assets) {
        final file = await asset.file;
        if (file != null) {
          imageFiles.add(XFile(file.path));
        }
      }
      setState(() {
        _files.addAll(imageFiles);
      });
      widget.onChanged?.call(imageFiles);
    }
  }

  Future<void> _pickPdfOrOther(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'], // etc
    );
    if (result != null && result.files.isNotEmpty) {
      final files = result.files.map((e) => e.xFile).toList();
      setState(() {
        _files.addAll(files);
      });
      widget.onChanged?.call(files);
    }
  }

  Future<void> _pickSomething(BuildContext context) async {
    final choice = await showModalBottomSheet<String>(
      context: context,
      builder:
          (ctx) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: Text(context.appLocalization.image),
                onTap: () => Navigator.of(ctx).pop('images'),
              ),
              ListTile(
                leading: const Icon(Icons.folder_copy),
                title: Text(context.appLocalization.file),
                onTap: () => Navigator.of(ctx).pop('file'),
              ),
              const SizedBox(height: 30),
            ],
          ),
    );
    if (choice == 'images') {
      await _pickMedia(context);
    } else if (choice == 'file') {
      await _pickPdfOrOther(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _files.addAll(widget.files);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.onChanged != null)
          GestureDetector(
            onTap: () {
              debugPrint("24tr23t23t23t");
              _pickSomething(context);
            },
            child: Row(
              children: [
                const CustomSvg(MyIcons.attachSquare),
                const SizedBox(width: 11),
                Text(
                  widget.title ?? context.appLocalization.attachFiles,
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: List.generate(_files.length, (index) {
              final file = _files[index];
              return AttachmentBubble(file: file, color: widget.bubbleColor);
            }),
          ),
        ),
      ],
    );
  }
}
