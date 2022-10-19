import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_core_app_bar.dart';
import 'package:learning_online/core/widgets/widget_logo_text.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field_with_title.dart';
import 'package:learning_online/core/widgets/widget_row_social.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: widgetCoreAppBar(title: 'Đăng nhập'),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            WidgetLogoText(),
            SizedBox(height: 32),
            WidgetRoundedTextFieldWithTitle(
              title: 'Địa chỉ E-mail',
              hint: 'example@gmail.com',
              isRequired: true,
            ),
            SizedBox(height: 32),
            WidgetRoundedTextFieldWithTitle(
              title: 'Mật khẩu',
              isRequired: true,
              hint: '********',
            ),
            SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Quên mật khẩu',
                style: kFontRegularPrimary_14,
              ),
            ),
            SizedBox(height: 16),
            WidgetRoundedButton(text: 'Log in'),
            SizedBox(height: 16),
            WidgetRowWithSocial(title: 'Hoặc đăng nhập với'),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chưa có tài khoản?',
                  style: kFontRegularDefault_14,
                ),
                SizedBox(width: 4),
                Text(
                  'Đăng ký',
                  style: kFontRegularBlue_14,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
