import 'package:get/get.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:learning_online/features/root_controller.dart';
import 'package:jwt_decode/jwt_decode.dart';

class JitsiMeetHelper {
  static void joinMeeting(String tutorName, String link) async {
    try {
      final student = Get.find<RootController>().user!;
      String token = link.split('token=').last;

      Map<String, dynamic> payload = Jwt.parseJwt(token);
      String room = payload['room'];

      var options = JitsiMeetingOptions(room: room)
        ..serverURL = 'https://meet.lettutor.com'
        ..token = token
        ..subject = 'Học với $tutorName'
        ..userDisplayName = student.name
        ..userEmail = student.email
        ..userAvatarURL = student.avatar
        ..audioOnly = true
        ..audioMuted = true
        ..videoMuted = true
        ..featureFlags = {
          FeatureFlagEnum.WELCOME_PAGE_ENABLED: true,
        };

      final response = await JitsiMeet.joinMeeting(options);
    } catch (e) {
      // Log.e('JitsiMeetHelper -> joinMeeting()', '$e');
    }
  }
}