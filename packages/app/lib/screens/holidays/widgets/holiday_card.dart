import 'package:shared/shared.dart';

class HolidayCard extends StatelessWidget {
  final HolidayModel holiday;

  const HolidayCard({super.key, required this.holiday});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 87,
      padding: const EdgeInsets.symmetric(horizontal: 11),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF5F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Row(
        children: [
          VerticalLine(height: 67, color: context.colorPalette.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   "${context.appLocalization.leaveNo} 21#",
                //   overflow: TextOverflow.ellipsis,
                //   style: TextStyle(
                //     color: context.colorPalette.grey8B8,
                //     fontSize: 12,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    holiday.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.colorPalette.black252,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  holiday.description,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.grey8B8,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                AutoSizeText(
                  "${context.appLocalization.leaveSetFromDate} ${holiday.startDate!.getDefaultFormattedDate(context)} ${context.appLocalization.toDate} ${holiday.endDate!.getDefaultFormattedDate(context)}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  minFontSize: 8,
                  maxFontSize: 12,
                  style: TextStyle(
                    color: context.colorPalette.grey8B8,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // const Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }
}
