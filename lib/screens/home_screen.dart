import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/arrow_navigation_container.dart';
import 'package:mhgap_urdu/components/custom_bottom_bar.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/custom_app_bar.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';
import 'package:mhgap_urdu/utils/home_screen_list.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget? screen;

  HomeScreen({super.key, this.screen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        onLeadingPressed: () => scaffoldKey.currentState?.openEndDrawer(),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            ListTile(
              leading: null, // Remove leading icon
              trailing: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Close',
                    style: TextStyle(color: sideBarTextColor, fontSize: 16),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.close, color: navigationBarColor),
                ],
              ),
              onTap: () => scaffoldKey.currentState?.closeEndDrawer(),
            ),
            const Divider(color: sideBarTextColor),
            ...cardList.map((card) {
              // ignore: unused_local_variable

              return ListTile(
                trailing:
                    Image.asset(card['image'] as String, width: 35, height: 35),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseTextComponent(
                        text: card["englishTitle"] as String,
                        fontSize: 14,
                        textAlign: TextAlign.left,
                        color: sideBarTextColor),
                    BaseTextComponent(
                        text: card["title"] as String,
                        fontSize: 14,
                        color: sideBarTextColor),
                  ],
                ),
                onTap: () {
                  navigateWithSlideTransition(
                    context,
                    HomeScreen(screen: card["screen"] as Widget),
                  );
                  scaffoldKey.currentState?.closeEndDrawer();
                },
              );
            }),
          ],
        ),
      ),
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: HomeScreenContent(screen: screen),
              bottomNavigationBar: const CustomBottomAppBar(),
            ),
          );
        },
      ),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  final Widget? screen;
  const HomeScreenContent({super.key, this.screen});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  void initState() {
    super.initState();

    // Check if screen is not null, then navigate after 1 second
    if (widget.screen != null) {
      Future.delayed(const Duration(milliseconds: 100), () {
        navigateWithSlideTransition(context, widget.screen!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      const Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: ArrowNavigationContainer(
            text: HomeScreenTexts.navigationText, showBackButton: false),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
            children: cardList.map((card) {
              return GestureDetector(
                onTap: () {
                  navigateWithSlideTransition(
                      context, card["screen"] as Widget);
                },
                child: Card(
                  color: const Color.fromRGBO(242, 242, 242, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        card['image'] as String,
                        fit: BoxFit.fill,
                        width: 65,
                        height: 65,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: BaseTextComponent(
                            text: card["title"] as String,
                            color: navigationBarColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: EnglishTextComponent(
                          text: card['englishTitle'] as String,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ]);
  }
}
