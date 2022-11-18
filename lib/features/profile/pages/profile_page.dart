import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/colors.dart';
import 'package:learning_online/core/const.dart';
import 'package:learning_online/core/styles.dart';
import 'package:learning_online/core/widgets/widget_core_app_bar.dart';
import 'package:learning_online/core/widgets/widget_core_date_picker.dart';
import 'package:learning_online/core/widgets/widget_dropdown_with_title.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field_with_title.dart';
import 'package:learning_online/model/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel _userModel = UserModel.mock;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  XFile? image;

  @override
  void initState() {
    nameController.text = _userModel.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetCoreAppBar(title: 'Hồ sơ', context: context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _widgetAvatar(),
              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(border: InputBorder.none, hintText: 'Nhập tên'),
                controller: nameController,
                textAlign: TextAlign.center,
                style: kFontSemiboldBlack_16,
              ),
              const SizedBox(height: 10),
              Text(
                _userModel.email,
                style: kFontSemiboldBlack_14,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _widgetDateOfBirth(),
                    const SizedBox(height: 16),
                    WidgetRoundedTextFieldWithTitle(
                      title: 'Số điện thoại',
                      hint: 'Cập nhật số điện thoại',
                      radius: 8,
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        if (value?.isNotEmpty == true) {
                          if (!GetUtils.isPhoneNumber(value!)) {
                            return 'Vui lòng nhập đúng định dạng số điện thoại';
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    const WidgetDropdownWithTitle(title: 'Quốc gia', hint: 'Chọn quốc gia', data: kNations),
                    const SizedBox(height: 8),
                    const WidgetDropdownWithTitle(title: 'Trình độ', hint: 'Chọn trình độ', data: kLevels),
                    const SizedBox(height: 8),
                    const WidgetDropdownWithTitle(
                      title: 'Muốn học',
                      hint: 'Chọn môn muốn học',
                      data: kSubjects,
                    ),
                    const SizedBox(height: 32),
                    WidgetRoundedButton(
                      text: 'Lưu',
                      onPressed: () {
                        String message = 'Lưu thành công';
                        if (nameController.text.isEmpty) {
                          message = 'Vui lòng nhập tên';
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(message),
                          duration: const Duration(milliseconds: 1000),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetDateOfBirth() {
    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime(2000, 1, 1),
          firstDate: DateTime(1900, 1, 1),
          lastDate: DateTime.now(),
        );
        print('nguyentp ==> $date');
        if (date != null) {
          setState(() {
            DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
            _userModel = _userModel.copyWith(dateOfBirth: _dateFormat.format(date));
          });
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ngày sinh', style: kFontRegularDefault_14),
          const SizedBox(height: 8),
          WidgetCoreDatePicker(
            date: _userModel.dateOfBirth,
          ),
        ],
      ),
    );
  }

  Widget _widgetAvatar() {
    ImageProvider imageProvider = NetworkImage(_userModel.avatar ?? '');
    if (image != null) {
      imageProvider = FileImage(File(image!.path));
    }
    return GestureDetector(
      onTap: () async {
        final ImagePicker _picker = ImagePicker();
        // Pick an image
        final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
        setState(() {
          image = pickedImage;
        });
      },
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: imageProvider,
            radius: 36,
          ),
          const Positioned(
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
      ),
    );
  }
}
