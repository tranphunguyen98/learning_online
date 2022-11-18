import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field_with_title.dart';
import 'package:learning_online/core/widgets/widget_row_social.dart';
import 'package:learning_online/utils/router.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: kBlackColor,
          ),
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
              _widgetForm(),
              WidgetRoundedButton(
                text: 'Đăng ký',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.of(context).pushNamed(AppRouter.kHome);
                  }
                },
              ),
              const SizedBox(height: 16),
              const WidgetRowWithSocial(title: 'Hoặc đăng ký với'),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bạn đã có tài khoản?',
                    style: kFontRegularDefault_14,
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRouter.kLogin);
                    },
                    child: Text(
                      'Đăng nhập',
                      style: kFontRegularBlue_14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          WidgetRoundedTextFieldWithTitle(
            title: 'Họ và tên',
            hint: 'Tên',
            isRequired: true,
            validator: (value) => (value?.isNotEmpty == true) ? null : 'Vui lòng nhập tên',
          ),
          const SizedBox(height: 32),
          WidgetRoundedTextFieldWithTitle(
            title: 'Địa chỉ E-mail',
            hint: 'example@gmail.com',
            isRequired: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Vui lòng nhập email';
              } else if (!GetUtils.isEmail(value!)) {
                return 'Vui lòng nhập đúng định dạng email';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          WidgetRoundedTextFieldWithTitle(
            title: 'Mật khẩu',
            isRequired: true,
            controller: passwordController,
            hint: '********',
            obscureText: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Vui lòng nhập mật khẩu';
              } else if (value!.length < 6) {
                return 'Vui lòng nhập mật khẩu lớn hơn 6 ký tư';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          WidgetRoundedTextFieldWithTitle(
            title: 'Xác nhận Mật khẩu',
            isRequired: true,
            hint: '********',
            controller: confirmPasswordController,
            obscureText: true,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Vui lòng nhập mật khẩu';
              } else if (value!.length < 6) {
                return 'Vui lòng nhập mật khẩu lớn hơn 6 ký tư';
              } else if (passwordController.text != confirmPasswordController.text) {
                return 'Mật khẩu xác nhận không khớp với mật khẩu';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
