import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/custom_app_bar.dart';
import 'package:mhgap_urdu/components/custom_bottom_bar.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/utils/home_screen_list.dart';
import 'package:mhgap_urdu/components/arrow_navigation_container.dart';
import 'package:mhgap_urdu/utils/texts.dart';



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
            padding: const EdgeInsets.only(top: 50.0),
            child: body,
          ),
          if (showOrangeBar)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ArrowNavigationContainer(
                  text: title, showBackButton: true),
            ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class HomeScreenScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final String title;

  const HomeScreenScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
          onLeadingPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.close, color: Colors.red),
                title: const Text('Close', style: TextStyle(color: Colors.red)),
                onTap: () => scaffoldKey.currentState?.closeDrawer(),
              ),
              const Divider(color: Colors.white),
              ...cardList.map((card) {
                return ListTile(
                  trailing: Image.asset(card['image'] as String,
                      width: 30, height: 30),
                  title: Text(
                    card['title'] as String,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    navigateWithSlideTransition(
                      context,
                      BaseScaffold(
                        title: card['title'] as String,
                        body: card['screen'] as Widget,
                      ),
                    );
                    scaffoldKey.currentState?.closeDrawer();
                  },
                );
              })
            ],
          ),
        ),
        body: Navigator(onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => BaseScaffold(
              title: HomeScreenTexts.navigationText,
              body: body,
              bottomNavigationBar: bottomNavigationBar,
              showOrangeBar: false,
            ),
          );
        })
        );
  }
}


