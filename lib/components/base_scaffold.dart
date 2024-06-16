import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/custom_app_bar.dart';
import 'package:mhgap_urdu/components/custom_bottom_bar.dart';
import 'package:mhgap_urdu/components/arrow_navigation_container.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final String titleText;
  final String subtitleText;

  const BaseScreen({
    super.key,
    required this.body,
    this.titleText = 'mhGAP',
    this.subtitleText = 'Intervention Guide (SUD Module)',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: titleText,
        subtitleText: subtitleText,
        onLeadingPressed: () => Scaffold.of(context).openDrawer(),
      ),
      body: body,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final String title;
  final bool showOrangeBar;

  const BaseScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    required this.title,
    this.showOrangeBar = true,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: InteractiveViewer(
                panEnabled: true, // Enables panning
                minScale: 0.5, // Minimum scale factor for zoom-out
                maxScale: 4.0, // Maximum scale factor for zoom-in
                child: body),
          ),
          if (showOrangeBar)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child:
                  ArrowNavigationContainer(text: title, showBackButton: true),
            ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
