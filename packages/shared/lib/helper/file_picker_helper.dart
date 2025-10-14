import '../shared.dart';

class FilePickerHelper {
  final void Function(List<XFile> files) onChanged;

  FilePickerHelper({required this.onChanged});

  Future<void> _pickMedia(BuildContext context, {required VoidCallback? onSuccess}) async {
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
        requestType: RequestType.image, // or RequestType.common if video as well
      ),
    );
    if (assets != null && assets.isNotEmpty) {
      List<XFile> files = [];
      for (var asset in assets) {
        final file = await asset.file;
        if (file != null) {
          files.add(XFile(file.path));
        }
      }
      onChanged(files);
      if (onSuccess != null) {
        onSuccess();
      }
    }
  }

  Future<void> _pickPdfOrOther(BuildContext context, {required VoidCallback? onSuccess}) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'], // etc
    );
    if (result != null && result.files.isNotEmpty) {
      final files = result.files.map((e) => e.xFile).toList();
      onChanged(files);
      if (onSuccess != null) {
        onSuccess();
      }
    }
  }

  Future<void> pickSomething(BuildContext context, {VoidCallback? onSuccess}) async {
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
      await _pickMedia(context, onSuccess: onSuccess);
    } else if (choice == 'file') {
      await _pickPdfOrOther(context, onSuccess: onSuccess);
    }
  }
}
