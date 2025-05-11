import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          // "الصفحة الرئيسية",
          context.appLocalization.login,
          style: TextStyle(
            color: context.colorPalette.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const CustomSvg(MyIcons.notification))],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          const UserInformation(),
          const SizedBox(height: 17),
          Row(
            children: [
              Expanded(
                child: Text(
                  "ملخص إمتثال اليوم",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              MoreButton(onTap: () {}),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 13),
            child: Row(
              children: [
                TaskBubble(taskType: TaskTypeEnum.incomplete, value: "11"),
                SizedBox(width: 10),
                TaskBubble(taskType: TaskTypeEnum.complete, value: "13"),
                SizedBox(width: 10),
                TaskBubble(taskType: TaskTypeEnum.late, value: "15"),
                SizedBox(width: 10),
                TaskBubble(taskType: TaskTypeEnum.infringement, value: "16"),
              ],
            ),
          ),
          TextEditor(
            onChanged: (value) {},
            required: false,
            hintText: "ابحث عن مهمة ، موظف",
            prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "ابرز المهام",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.colorPalette.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                MoreButton(onTap: () {}),
              ],
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return const TaskCard();
            },
          ),
        ],
      ),
    );
  }
}
