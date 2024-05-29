import 'package:mhgap_urdu/screens/administrative/home_administrative.dart';
import 'package:mhgap_urdu/screens/detail_screen.dart';
import 'package:mhgap_urdu/screens/diagnoses/home_diagnosis.dart';
import 'package:mhgap_urdu/screens/followup_screen.dart';

const cardList = [
  {
    'title': 'تشخیص',
    'englishTitle': 'Assessment',
    'image': 'assets/vectors/assignment_turned_in.png',
    'screen': DiagnosisHomeScreen(),
    'screenIndex': 0,
  },
  {
    'title': 'تفصیل',
    'englishTitle': 'Description',
    'image': 'assets/vectors/chat_info.png',
    'screen': DetailScreen(),
    'screenIndex': 1,
  },
  {
    'title': 'فالو اپ',
    'englishTitle': 'Follow Up',
    'image': 'assets/vectors/forward_media.png',
    'screen': FollowupScreen(),
    'screenIndex': 2,
  },
  {
    'title': 'مینجمنٹ ',
    'englishTitle': 'Management',
    'image': 'assets/vectors/prescriptions.png',
    'screen': HomeAdministrativeSreen(),
    'screenIndex': 3,
  },
];