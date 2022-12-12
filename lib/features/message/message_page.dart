import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field.dart';
import 'package:learning_online/features/message/widgets/widget_message_item.dart';
import 'package:learning_online/model/message.dart';
import 'package:learning_online/model/teacher.dart';

class MessagePage extends StatelessWidget {
  // final TeacherModel teacherModel = TeacherModel.mock;
  final List<MessageModel> messages = List.generate(3, (index) => MessageModel.mock);
  MessagePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _widgetAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) => WidgetMessageItem(messageModel: messages[index]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16, left: 16, right: 8),
            child: Row(
              children: [
                const Expanded(
                  child: WidgetRoundedTextField(
                    hint: 'Nhắn tin ...',
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  padding: const EdgeInsets.all(4),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: kRedColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _widgetAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 16,
          color: kBlackColor,
        ),
      ),
      title: Row(
        children: [
          // CircleAvatar(
          //   backgroundImage: NetworkImage(teacherModel.avatar),
          //   radius: 16,
          // ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   teacherModel.name,
              //   style: kFontRegularDefault_14,
              // ),
              Text(
                'Tutor',
                style: kFontRegularGray_12,
              )
            ],
          ),
        ],
      ),
    );
  }
}
