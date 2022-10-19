import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_logo_text.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          color: kBlackColor,
        ),
        title: Text(
          'Quên mật khẩu',
          style: kFontSemiboldBlack_16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            WidgetLogoText(),
            SizedBox(height: 32),
            Text(
              'Nhập địa chỉ email của bạn. Chúng tôi sẽ gửi cho bạn một đường link để đặt lại mật khẩu',
              style: kFontRegularDefault_14,
            ),
            SizedBox(height: 64),
            WidgetRoundedTextField(
              hint: 'Nhập địa chỉ email',
            ),
            SizedBox(height: 64),
            WidgetRoundedButton(text: 'Gửi'),
          ],
        ),
      ),
    );
  }
}
