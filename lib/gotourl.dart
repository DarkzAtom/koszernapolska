import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void gotourl(Uri url) async{
  if (await canLaunchUrl(url)){
    await launchUrl(url);
  } else {
    ;
  }
}