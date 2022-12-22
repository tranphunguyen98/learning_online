import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/features/root_controller.dart';
import 'package:learning_online/features/setting/widgets/widget_setting_button.dart';
import 'package:learning_online/model/user.dart';

import '../../../utils/router.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late UserModel? userModel;

  @override
  void initState() {
    userModel = Get.find<RootController>().user;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _widgetHeader(),
            const SizedBox(height: 32),
            const WidgetSettingButton(
              text: 'Xem đánh giá bản thân',
              leading: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            WidgetSettingButton(
              text: 'Danh sách giáo viên ưa thích',
              leading: Icons.favorite_border,
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.kTeacherFavorite);
              },
            ),
            const SizedBox(height: 16),
            // WidgetSettingButton(
            //   text: 'Dánh sach',
            //   leading: Icons.menu,
            // ),
            // SizedBox(height: 16),
            WidgetSettingButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.kHistory);
              },
              text: 'Lịch sử học',
              leading: Icons.history,
            ),
            const SizedBox(height: 16),
            const WidgetSettingButton(
              text: 'Cài đặt nâng cao',
              leading: Icons.settings_outlined,
            ),
            const SizedBox(height: 64),
            const WidgetSettingButton(
              text: 'Đi đến Website',
              leading: Icons.language,
            ),
            const SizedBox(height: 16),
            const WidgetSettingButton(
              text: 'Facebook',
              leading: Icons.facebook_outlined,
            ),
            const SizedBox(height: 64),
            const WidgetRoundedButton(text: 'Đăng xuất'),
          ],
        ),
      ),
    );
  }

  Widget _widgetHeader() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.kUserProfile);
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userModel?.avatar ?? ''),
            radius: 28,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userModel?.name ?? '',
                style: kFontRegularDefault_16,
              ),
              const SizedBox(height: 8),
              Text(
                userModel?.phoneNumber ?? '',
                style: kFontRegularDefault_14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
