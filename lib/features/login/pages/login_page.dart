import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_core_app_bar.dart';
import 'package:learning_online/core/widgets/widget_logo_text.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field_with_title.dart';
import 'package:learning_online/core/widgets/widget_row_social.dart';
import 'package:learning_online/utils/router.dart';

import '../../../core/server_failure.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  final Map<String, dynamic> arguments;

  LoginPage({Key? key, this.arguments = const {}}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    if (widget.arguments['email'] != null) {
      emailController.text = widget.arguments['email'];
    }

    emailController.text = 'ntranphu4@gmail.com';
    passwordController.text = '123456';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: widgetCoreAppBar(
          title: 'Đăng nhập', context: context, hasBackIcon: widget.arguments['email'] != null ? false : true),
      body: GetBuilder<LoginController>(builder: (logic) {
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
                      WidgetRoundedTextFieldWithTitle(
                        controller: emailController,
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
                      SizedBox(height: 32),
                      WidgetRoundedTextFieldWithTitle(
                        controller: passwordController,
                        title: 'Mật khẩu',
                        isRequired: true,
                        hint: '********',
                        obscureText: true,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Vui lòng nhập mật khẩu';
                          } else if (value!.length < 6) {
                            return 'Vui lòng nhập mật khẩu lớn hơn 6 ký tư';
                          }
                        },
                      ),
                      SizedBox(height: 32),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(AppRouter.kForgotPassword);
                          },
                          child: Text(
                            'Quên mật khẩu',
                            style: kFontRegularPrimary_14,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      WidgetRoundedButton(
                        text: 'Đăng nhập',
                        onPressed: () async {
                          try {
                            if (_formKey.currentState?.validate() ?? false) {
                              await loginController.login(emailController.text, passwordController.text);
                              Navigator.of(context).pushReplacementNamed(AppRouter.kHome);
                            }
                          } on ServerFailure catch (e) {
                            _showToast(context, e.message);
                          }
                        },
                      ),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(AppRouter.kRegister);
                            },
                            child: Text(
                              'Đăng ký',
                              style: kFontRegularBlue_14,
                            ),
                          ),
                        ],
                      )
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
