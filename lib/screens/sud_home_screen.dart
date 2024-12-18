
import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/utils/home_screen_list.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';
import 'package:mhgap_urdu/utils/colors.dart';


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
