import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ViolationInputScreen extends StatefulWidget {
  final TaskModel? task;

  const ViolationInputScreen({super.key, required this.task});

  @override
  State<ViolationInputScreen> createState() => _ViolationInputScreenState();
}

class _ViolationInputScreenState extends State<ViolationInputScreen> {
  int _violationTaskIndex = 0;
  late ViolationModel _violation;

  TaskModel? get _task => widget.task;
  LightUserModel? get _user => widget.task?.user;
  bool get _isGeneralViolation => _task == null;

  @override
  void initState() {
    super.initState();
    _violation = ViolationModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomButton(onPressed: () {}, text: context.appLocalization.create),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        children: [
          Text(
            context.appLocalization.violationDetectedInTask,
            style: TextStyle(
              color: context.colorPalette.redD62,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (!_isGeneralViolation)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                _task!.title,
                style: TextStyle(
                  color: context.colorPalette.black252,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          if (!_isGeneralViolation)
            Row(
              children: [
                UserPhoto(url: _user?.profilePhoto, displayName: _user!.displayName, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _user!.jobTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.grey8B8,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _user!.displayName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.black252,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: context.appLocalization.typeOfViolation,
              child: Wrap(
                direction: Axis.horizontal,
                children:
                    ViolationType.values.map((e) {
                      final selected = _violation.type == e.value;
                      return DayBubble(
                        onTap: () {
                          setState(() {
                            _violation.type = e.value;
                          });
                        },
                        title: ViolationType.getLabel(e.value, context),
                        isSelected: selected,
                        backgroundColor:
                            selected ? context.colorPalette.redD62 : context.colorPalette.greyF5F,
                      );
                    }).toList(),
              ),
            ),
          ),
          TitledTextField(
            title: context.appLocalization.complianceOfficerNotesExplanations,
            child: TextEditor(
              onChanged: (value) => _violation.notes = value!,
              hintText: context.appLocalization.complianceOfficerNotesExplanations,
              maxLines: 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: context.appLocalization.penaltyForNonCompliance,
              child: TextEditor(
                onChanged: (value) => _violation.description = value!,
                hintText: context.appLocalization.descriptionPenaltyForNonCompliance,
              ),
            ),
          ),
          ImagesAttacher(onChanged: (files) {}, title: context.appLocalization.attachFilesImages),
        ],
      ),
    );
  }
}
