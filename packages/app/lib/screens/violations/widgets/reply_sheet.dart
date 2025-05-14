import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class ReplySheet extends StatefulWidget {
  const ReplySheet({super.key});

  @override
  State<ReplySheet> createState() => _ReplySheetState();
}

class _ReplySheetState extends State<ReplySheet> {
  int _decisionIndex = 0;
  List<String> decision() {
    return [
      context.appLocalization.cancelPenalty,
      context.appLocalization.confirmPenalty,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.appLocalization.managementDecision,
            style: TextStyle(
              color: context.colorPalette.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            children:
                decision().map((item) {
                  return DayBubble(
                    onTap: () {
                      setState(() {
                        _decisionIndex = decision().indexOf(item);
                      });
                    },
                    title: item,
                    isSelected: _decisionIndex == decision().indexOf(item),
                    backgroundColor:
                        _decisionIndex == decision().indexOf(item)
                            ? context.colorPalette.primary
                            : context.colorPalette.white,
                  );
                }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TitledTextField(
              title: context.appLocalization.yourMessage,
              child: TextEditor(
                onChanged: (value) {},
                maxLines: 4,
                filled: true,
                fillColor: context.colorPalette.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const CustomSvg(MyIcons.attachSquare),
                const SizedBox(width: 11),
                Text(
                  context.appLocalization.attachFilesImages,
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          StretchedButton(
            onPressed: () {},
            child: Text(
              context.appLocalization.send,
              style: TextStyle(
                color: context.colorPalette.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
