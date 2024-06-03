import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/arrow_navigation_container.dart';
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
                trailing: Image.asset(card['image'] as String,
                    width: card["englishTitle"] == "Management" ? 45 : 35,
                    height: card["englishTitle"] == "Management" ? 55 : 35),
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
  _HomeScreenContent createState() => _HomeScreenContent();
}

class _HomeScreenContent extends State<HomeScreenContent> {
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
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  navigateWithSlideTransition(context, const SudHomeScreen());
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 15, bottom: 25.0),
                  decoration: BoxDecoration(
                    color: navigationBarColor, // The orange background color
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.3), // Shadow color with opacity
                        offset:
                            const Offset(0, 4), // Offset for the shadow (x, y)
                        blurRadius: 4.0, // Blur radius for the shadow
                      ),
                    ], // Adjust for rounded corners
                  ),
                  alignment: Alignment
                      .center, // Center the child both vertically and horizontally
                  child: const BaseTextComponent(
                      text: 'Substance Use Disorder (SUD) Module',
                      fontSize: 16,
                      color: sideBarTextColor),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0.0, // Adjusted value to make it visible
          left: 0,
          right: 0,
          child: Container(
            height: 160, // Specify a height to ensure visibility
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 248, 245, 245),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.4), // Shadow color with opacity
                  offset: const Offset(0, 4), // Offset for the shadow (x, y)
                  blurRadius: 4.0, // Blur radius for the shadow
                ),
              ], // Adjust for rounded corners
            ),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 5,
              childAspectRatio: 3,
              children: [
                Image.asset(
                  'assets/images/logo2.png',
                ),
                Image.asset('assets/images/logo1.png'),
                Image.asset('assets/images/logo3.png'),
                Image.asset('assets/images/logo4.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SudHomeScreen extends StatefulWidget {
  final Widget? screen;
  const SudHomeScreen({super.key, this.screen});

  @override
  // ignore: library_private_types_in_public_api
  _SudHomeScreenState createState() => _SudHomeScreenState();
}

class _SudHomeScreenState extends State<SudHomeScreen> {
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
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 1,
            children: cardList.map((card) {
              return GestureDetector(
                onTap: () {
                  navigateWithSlideTransition(
                      context, card["screen"] as Widget);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(
                        242, 242, 242, 1), // The orange background color
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.3), // Shadow color with opacity
                        offset:
                            const Offset(0, 4), // Offset for the shadow (x, y)
                        blurRadius: 4.0, // Blur radius for the shadow
                      ),
                    ], // Adjust for rounded corners
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        card['image'] as String,
                        fit: BoxFit.fill,
                        width: card["image_width"] as double,
                        height: card["image_height"] as double,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
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
