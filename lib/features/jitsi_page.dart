import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

class JitsiPage extends StatefulWidget {
  const JitsiPage({Key? key}) : super(key: key);

  @override
  State<JitsiPage> createState() => _JitsiPageState();
}

class _JitsiPageState extends State<JitsiPage> {
  bool isWaiting = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueColor,
      body: GestureDetector(
        onTap: () {
          setState(() {
            isWaiting = !isWaiting;
          });
        },
        child: isWaiting
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Còn 11 phút 30 giây cho đến khi bắt đầu',
                      style: kFontMediumWhite_16,
                    ),
                    Text(
                      '(CN, ngày 23, tháng 10, 2022)',
                      style: kFontMediumWhite_14,
                    )
                  ],
                ),
              )
            : SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Giá viên Andy',
                      style: kFontMediumWhite_14,
                    ),
                    Text(
                      '01:12',
                      style: kFontRegularWhite_12_80,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.white,
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.mic_none, color: Colors.black54,),
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.call_end, color: Colors.white,),
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.videocam_outlined, color: Colors.black54,),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
