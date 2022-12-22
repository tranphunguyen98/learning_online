import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_online/core/colors.dart';
import 'package:learning_online/core/const.dart';
import 'package:learning_online/core/styles.dart';
import 'package:learning_online/core/widgets/widget_core_app_bar.dart';
import 'package:learning_online/core/widgets/widget_core_date_picker.dart';
import 'package:learning_online/core/widgets/widget_dropdown_with_title.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field_with_title.dart';
import 'package:learning_online/core/widgets/widget_searchable_dropdown_with_title.dart';
import 'package:learning_online/features/profile/data/user.dart';
import 'package:learning_online/features/profile/profile_logic.dart';
import 'package:learning_online/utils/data.dart';

import '../../../core/widgets/widget_learning_topic_dropdown.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User _userModel;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final ProfileLogic logic = Get.put(ProfileLogic());
  XFile? image;

  String subjectsErrorText = '';
  String nationalErrorText = '';
  String birthDayErrorText = '';
  String levelErrorText = '';

  @override
  void initState() {
    logic.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetCoreAppBar(title: 'Hồ sơ', context: context),
      backgroundColor: Colors.white,
      body: GetBuilder<ProfileLogic>(
          init: logic,
          builder: (logic) {
            if (logic.user == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            _userModel = logic.user!;
            nameController.text = _userModel.name ?? '';
            phoneController.text = _userModel.phone ?? '';
            emailController.text = _userModel.email ?? '';

            final selectedIndex = nations.indexWhere((element) {
              if (_userModel.country?.isEmpty ?? true) {
                return false;
              }
              return element['code']?.toLowerCase() == _userModel.country?.toLowerCase();
            });

            Map<String, String>? selected;
            if (selectedIndex >= 0) {
              selected = nations[selectedIndex];
            }
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _widgetAvatar(),
                    const SizedBox(height: 8),
                    Text(
                      _userModel.name ?? '',
                      style: kFontSemiboldBlack_16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WidgetRoundedTextFieldWithTitle(
                            controller: nameController,
                            title: 'Tên',
                            hint: 'Họ và Tên',
                            isRequired: true,
                            radius: 8,
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value?.isEmpty == true) {
                                  return 'Vui lòng nhập tên';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 8),
                          WidgetRoundedTextFieldWithTitle(
                            // isDisable: _userModel.isActivated ?? false,
                            controller: emailController,
                            title: 'Địa chỉ email',
                            hint: 'Địa chỉ email',
                            radius: 8,
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value?.isNotEmpty == true) {
                                if (!GetUtils.isEmail(value!)) {
                                  return 'Vui lòng nhập đúng định dạng email.';
                                }
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8),
                          WidgetSearchableDropdownWithTitle<Map<String, String>>(
                            title: 'Quốc gia',
                            hint: 'Chọn quốc gia',
                            selected: selected,
                            items: nations,
                            onDisplay: (value) => value['name'] ?? '',
                            onSelected: (value) {
                              selected = value;
                              _userModel.copyWith(country: value['code'] ?? '');
                            },
                          ),
                          const SizedBox(height: 16),
                          _widgetDateOfBirth(),
                          const SizedBox(height: 16),
                          WidgetRoundedTextFieldWithTitle(
                            isRequired: true,
                            isDisable: _userModel.isPhoneActivated ?? false,
                            controller: phoneController,
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
                          WidgetDropdownWithTitle(
                            title: 'Trình độ',
                            hint: 'Chọn trình độ',
                            initValue: _userModel.level ?? '',
                            onChanged: (value) {
                              _userModel.copyWith(level: value);
                            },
                            data: levels.keys.toList(),
                            onDisplay: (String value) {
                              return levels[value] ?? '';
                            },
                          ),
                          const SizedBox(height: 8),
                          WidgetLearningTopicDropdown(
                            selectedTopics: _userModel.learnTopics ?? [],
                            selectedTests: _userModel.testPreparations ?? [],
                            onChanged: (topics, tests) {
                              if(topics.isEmpty && tests.isEmpty) {
                                setState(() {
                                  subjectsErrorText = 'Bắt buộc chọn môn muốn học';
                                });
                              } else {
                                if(subjectsErrorText.isNotEmpty) {
                                  setState(() {
                                    subjectsErrorText = '';
                                  });
                                }
                              }
                              _userModel.copyWith(learnTopics: topics, testPreparations: tests);
                            },
                          ),
                          if (subjectsErrorText.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: Text(
                                subjectsErrorText,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          const SizedBox(height: 32),
                          WidgetRoundedButton(
                            text: 'Lưu',
                            onPressed: () {
                              if ((_userModel.learnTopics?.isEmpty ?? true) &&
                                  (_userModel.testPreparations?.isEmpty ?? true)) {
                                setState(() {
                                  subjectsErrorText = 'Bắt buộc chọn môn muốn học';
                                });
                              } else {
                                String message = 'Lưu thành công';
                                if (nameController.text.isEmpty) {
                                  message = 'Vui lòng nhập tên';
                                }
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(message),
                                  duration: const Duration(milliseconds: 1000),
                                ));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _widgetDateOfBirth() {
    return GestureDetector(
      onTap: () async {
        final birthDay = DateTime.parse(_userModel.birthday ?? '');

        final date = await showDatePicker(
          context: context,
          initialDate: birthDay,
          firstDate: DateTime(1900, 1, 1),
          lastDate: DateTime.now(),
        );
        print('nguyentp ==> $date');
        if (date != null) {
          logic.updateBirthDay(date);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ngày sinh', style: kFontRegularDefault_14),
          const SizedBox(height: 8),
          WidgetCoreDatePicker(
            date: _userModel.birthday ?? '',
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
