import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field_with_title.dart';
import 'package:learning_online/core/widgets/widget_row_social.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
          'Đăng ký',
          style: kFontSemiboldBlack_16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WidgetRoundedTextFieldWithTitle(
                title: 'Họ và tên',
                hint: 'Name',
                isRequired: true,
              ),
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
              WidgetRoundedTextFieldWithTitle(
                title: 'Xác nhận Mật khẩu',
                isRequired: true,
                hint: '********',
              ),
              SizedBox(height: 32),
              WidgetRoundedButton(text: 'Đăng ký'),
              SizedBox(height: 16),
              WidgetRowWithSocial(title: 'Hoặc đăng ký với'),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bạn đã có tài khoản?',
                    style: kFontRegularDefault_14,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Đăng nhập',
                    style: kFontRegularBlue_14,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
