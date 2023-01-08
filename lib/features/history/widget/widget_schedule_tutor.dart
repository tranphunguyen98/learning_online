import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/core.dart';

class WidgetScheduleTutor extends StatelessWidget {
  const WidgetScheduleTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                'https://cdn-img.thethao247.vn/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png',
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Keegan',
                      style: kFontSemiboldBlack_14,
                    ),
                    Row(
                      children: [
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/en/thumb/c/c3/Flag_of_France.svg/2560px-Flag_of_France.svg.png',
                          height: 12,
                        ),
                        const SizedBox(width: 6),
                        Text('France', style: kFontRegularDefault_12,)
                      ],
                    ),
                    Row(children: [
                      const Icon(Icons.message_outlined, color: kBlueColor, size: 12,),
                      const SizedBox(width: 6),
                      Text('Nhắn tin'.tr, style: kFontRegularBlue_12,)
                    ],)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
