import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/custom_app_bar.dart';
import 'package:mhgap_urdu/components/sourceInformation.dart';
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
                      fontSize: 14,
                      textAlign: TextAlign.center,
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 80, // set your desired width
                      height: 80, // set your desired height
                      child: Image.asset('assets/images/logo2.png'),
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/logo1.png'),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/logo4.png'),
                    ),
                  ],
                ),
                
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                        child: BaseTextComponent(
                          fontSize: 8,
                          height: 1,
                      text:
                          'Disclaimer: This translation was not created by the World Health Organization (WHO). WHO is not responsible for the content or accuracy of this translation. The original edition “mhGAP Intervention Guide - Version 2.0” shall be the binding and authentic edition',
                      textAlign: TextAlign.center,
                    ))),
                const SizedBox(height: 5), // space between rows
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
    return BaseScaffold(
        showSource: true,
        title: HomeScreenTexts.navigationText,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                for (int i = 0; i < cardList.length; i += 2)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            navigateWithSlideTransition(
                                context, cardList[i]["screen"] as Widget);
                          },
                          child: Container(
                              margin:
                                  const EdgeInsets.only(right: 15, bottom: 20),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(242, 242, 242,
                                    1), // The orange background color
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                        0.3), // Shadow color with opacity
                                    offset: const Offset(
                                        0, 4), // Offset for the shadow (x, y)
                                    blurRadius:
                                        4.0, // Blur radius for the shadow
                                  ),
                                ], // Adjust for rounded corners
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      cardList[i]['image'] as String,
                                      fit: BoxFit.fill,
                                      width:
                                          cardList[i]["image_width"] as double,
                                      height:
                                          cardList[i]["image_height"] as double,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: BaseTextComponent(
                                          text: cardList[i]["title"] as String,
                                          color: navigationBarColor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: EnglishTextComponent(
                                        text: cardList[i]['englishTitle']
                                            as String,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                      if (i + 1 < cardList.length)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              navigateWithSlideTransition(
                                  context, cardList[i + 1]["screen"] as Widget);
                            },
                            child: Container(
                                margin:
                                    const EdgeInsets.only(left: 15, bottom: 20),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(242, 242, 242,
                                      1), // The orange background color
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(
                                          0.3), // Shadow color with opacity
                                      offset: const Offset(
                                          0, 4), // Offset for the shadow (x, y)
                                      blurRadius:
                                          4.0, // Blur radius for the shadow
                                    ),
                                  ], // Adjust for rounded corners
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        cardList[i + 1]['image'] as String,
                                        fit: BoxFit.fill,
                                        width: cardList[i + 1]["image_width"]
                                            as double,
                                        height: cardList[i + 1]["image_height"]
                                            as double,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: BaseTextComponent(
                                            text: cardList[i + 1]["title"]
                                                as String,
                                            color: navigationBarColor),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: EnglishTextComponent(
                                          text: cardList[i + 1]['englishTitle']
                                              as String,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      if (i + 1 >= cardList.length)
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15, bottom: 20),
                          ),
                        ),
                    ],
                  ),
              ],
            )));
  }
}
