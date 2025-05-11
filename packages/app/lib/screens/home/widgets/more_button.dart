import 'package:shared/shared.dart';

class MoreButton extends StatelessWidget {
  final void Function() onTap;
  const MoreButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            context.appLocalization.more,
            style: TextStyle(
              color: context.colorPalette.grey8B8,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: context.colorPalette.grey8B8,
          ),
        ],
      ),
    );
  }
}
