import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/home/home_logic.dart';

import '../../../utils/router.dart';

class WidgetHeaderHome extends StatefulWidget {
  const WidgetHeaderHome({Key? key}) : super(key: key);

  @override
  State<WidgetHeaderHome> createState() => _WidgetHeaderHomeState();
}

class _WidgetHeaderHomeState extends State<WidgetHeaderHome> {
  final HomeLogic logic = Get.put(HomeLogic());

  @override
  void initState() {
    logic.getTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
      init: logic,
      builder: (logic) {
        return Container(
          height: 200,
          color: kPrimaryColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Buổi học sắp diễn ra',
                  style: kFontRegularWhite_18,
                ),
                const SizedBox(height: 8),
                Text(
                  '20:00 - 20:25 (23/10/2022)',
                  style: kFontRegularWhite_14,
                ),
                const SizedBox(height: 4),
                Text(
                  'Còn 10 phút 30 giây',
                  style: kFontRegularWhite_14.copyWith(color: Colors.amberAccent),
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.kJitsi);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.play_circle_outline, color: kBlueColor, size: 16,),
                      const SizedBox(width: 8),
                      Text(
                        'Vào lớp học',
                        style: kFontRegularBlue_14,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(logic.total?.totalText ?? '', style: kFontRegularWhite_14,)
              ],
            ),
          ),
        );
      }
    );
  }
}
