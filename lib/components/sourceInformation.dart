import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceInformation extends StatelessWidget {
  final String url;

  const SourceInformation({super.key, required this.url});

  void _launchUrl(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '',
            style: const TextStyle(color: Colors.black, fontSize: 12),
            children: [
              TextSpan(
                text: 'Click here to open source',
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchUrl(url);
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
