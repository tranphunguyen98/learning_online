import 'package:flutter/material.dart';
import 'package:learning_online/core/colors.dart';
import 'package:learning_online/core/const.dart';
import 'package:learning_online/core/styles.dart';
import 'package:learning_online/core/widgets/widget_core_app_bar.dart';
import 'package:learning_online/core/widgets/widget_core_date_picker.dart';
import 'package:learning_online/core/widgets/widget_dropdown_with_title.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field_with_title.dart';
import 'package:learning_online/model/user.dart';

class ProfilePage extends StatelessWidget {
  final UserModel _userModel = UserModel.mock;
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetCoreAppBar(title: 'Hồ sơ'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _widgetAvatar(),
            SizedBox(height: 8),
            Text(
              _userModel.name,
              style: kFontSemiboldBlack_16,
            ),
            SizedBox(height: 10),
            Text(
              _userModel.email,
              style: kFontSemiboldBlack_14,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _widgetDateOfBirth(),
                  SizedBox(height: 16),
                  WidgetRoundedTextFieldWithTitle(
                    title: 'Số điện thoại',
                    hint: 'Cập nhật số điện thoại',
                    radius: 8,
                  ),
                  SizedBox(height: 8),
                  WidgetDropdownWithTitle(
                      title: 'Quốc gia', hint: 'Chọn quốc gia', data: kNations),
                  SizedBox(height: 8),
                  WidgetDropdownWithTitle(
                      title: 'Trình độ', hint: 'Chọn trình độ', data: kLevels),
                  SizedBox(height: 8),
                  WidgetDropdownWithTitle(
                    title: 'Muốn học',
                    hint: 'Chọn môn muốn học',
                    data: kSubjects,
                  ),
                  SizedBox(height: 32),
                  WidgetRoundedButton(text: 'Lưu'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _widgetDateOfBirth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ngày sinh', style: kFontRegularDefault_14),
        SizedBox(height: 8),
        WidgetCoreDatePicker(
          date: _userModel.dateOfBirth,
        ),
      ],
    );
  }

  Stack _widgetAvatar() {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(_userModel.imageUrl ?? ''),
          radius: 36,
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 12,
            child: Icon(
              Icons.camera_alt,
              color: kWhiteColor,
              size: 12,
            ),
          ),
        )
      ],
    );
  }
}
