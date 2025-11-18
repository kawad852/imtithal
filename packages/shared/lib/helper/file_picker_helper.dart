import 'package:app/screens/task/widgets/attachment_bubble.dart';

import '../shared.dart';

class FilePickerHelper {
  final void Function(List<XFile> files) onChanged;

  FilePickerHelper({required this.onChanged});

  List<Object> _files = [];

  Future<void> _pickMedia(BuildContext context, {required VoidCallback? onSuccess}) async {
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(requestType: RequestType.image),
    );
    if (assets != null && assets.isNotEmpty) {
      List<XFile> files = [];
      for (var asset in assets) {
        final file = await asset.file;
        if (file != null) {
          final f = XFile(file.path);
          files.add(f);
          _files.add(f);
        }
      }
      onChanged(files);
      if (onSuccess != null) onSuccess();
    }
  }

  Future<void> _pickCamera(BuildContext context, {required VoidCallback? onSuccess}) async {
    final picker = ImagePicker();

    final XFile? file = await picker.pickImage(source: ImageSource.camera);

    if (file != null) {
      _files.add(file);
      onChanged([file]);
      if (onSuccess != null) onSuccess();
    }
  }

  Future<void> _pickPdfOrOther(BuildContext context, {required VoidCallback? onSuccess}) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null && result.files.isNotEmpty) {
      final files = result.files.map((e) => e.xFile).toList();
      _files.addAll(files);
      onChanged(files);
      if (onSuccess != null) onSuccess();
    }
  }

  Future<void> pickSomething(
    BuildContext context, {
    VoidCallback? onSuccess,
    Widget? extraWidget,
  }) async {
    await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      useSafeArea: true,
      builder:
          (ctx) => StatefulBuilder(
            builder: (context, setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (extraWidget != null) extraWidget,
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: Text(context.appLocalization.image),
                    onTap: () {
                      _pickMedia(context, onSuccess: null).then((value) {
                        setState(() {});
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: Text(context.appLocalization.camera),
                    onTap: () {
                      _pickCamera(context, onSuccess: null).then((value) {
                        setState(() {});
                      });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.folder_copy),
                    title: Text(context.appLocalization.file),
                    onTap: () {
                      _pickPdfOrOther(context, onSuccess: null).then((value) {
                        setState(() {});
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: List.generate(_files.length, (index) {
                        final file = _files[index];
                        return AttachmentBubble(file: file);
                      }),
                    ),
                  ),
                  StretchedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (onSuccess != null) {
                        onSuccess();
                      }
                    },
                    margin: const EdgeInsets.symmetric(horizontal: kScreenMargin, vertical: 30),
                    child: Text(context.appLocalization.save),
                  ),
                ],
              );
            },
          ),
    );
  }
}
