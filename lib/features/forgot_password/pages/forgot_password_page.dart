import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_logo_text.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: kBlackColor,
          ),
        ),
        title: Text(
          'Quên mật khẩu',
          style: kFontSemiboldBlack_16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Vui lòng nhập email';
                    } else if (!GetUtils.isEmail(value!)) {
                      return 'Vui lòng nhập đúng định dạng email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 64),
                WidgetRoundedButton(
                  text: 'Gửi',
                  onPressed: () {
                    _formKey.currentState?.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
