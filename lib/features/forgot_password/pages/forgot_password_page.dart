import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_logo_text.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field.dart';

import '../../../core/server_failure.dart';
import '../controller/password_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final forgotPasswordController = Get.put(ForgotPasswordController());

  final emailController = TextEditingController();

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
      body: GetBuilder<ForgotPasswordController>(builder: (logic) {
        return Stack(
          children: [
            Padding(
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
                        controller: emailController,
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
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            try {
                              String message = await forgotPasswordController.forgotPassword(emailController.text);
                              _showToast(context, message);
                            } on ServerFailure catch (e) {
                              _showToast(context, e.message);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (logic.isLoading)
              Container(
                color: kBlackColor.withOpacity(0.2),
                child: Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                ),
              )
          ],
        );
      }),
    );
  }

  void _showToast(BuildContext context, String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }
}
