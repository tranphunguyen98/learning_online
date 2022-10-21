import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_core_app_bar.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/features/setting/widgets/widget_setting_button.dart';
import 'package:learning_online/model/user.dart';

class SettingPage extends StatelessWidget {
  final UserModel userModel = UserModel.mock;
  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetCoreAppBar(title: 'Cài đặt', hasBackIcon: false, context: context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _widgetHeader(),
            SizedBox(height: 32),
            WidgetSettingButton(
              text: 'Xem đánh giá bản thân',
              leading: Icons.person_outline,
            ),
            SizedBox(height: 16),
            WidgetSettingButton(
              text: 'Lịch sử đặt lịch',
              leading: Icons.menu,
            ),
            SizedBox(height: 16),
            WidgetSettingButton(
              text: 'Lịch sử học',
              leading: Icons.history,
            ),
            SizedBox(height: 16),
            WidgetSettingButton(
              text: 'Cài đặt nâng cao',
              leading: Icons.settings_outlined,
            ),
            SizedBox(height: 64),
            WidgetSettingButton(
              text: 'Đi đến Website',
              leading: Icons.language,
            ),
            SizedBox(height: 16),
            WidgetSettingButton(
              text: 'Facebook',
              leading: Icons.facebook_outlined,
            ),
            SizedBox(height: 64),
            WidgetRoundedButton(text: 'Đăng xuất'),
          ],
        ),
      ),
    );
  }

  Row _widgetHeader() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(userModel.imageUrl ?? ''),
          radius: 28,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userModel.name,
              style: kFontRegularDefault_16,
            ),
            SizedBox(height: 8),
            Text(
              userModel.email,
              style: kFontRegularDefault_14,
            ),
          ],
        )
      ],
    );
  }
}
