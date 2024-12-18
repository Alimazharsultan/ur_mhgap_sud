import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final List<String> imageList = [
    'assets/images/tutorial1.png',
    'assets/images/tutorial2.png',
    'assets/images/tutorial3.png',
    'assets/images/tutorial4.png',
    'assets/images/tutorial5.png',
  ];

  final List<String> descriptionList = [
    'یہ تصویر ur-mhGAP ایپلیکیشن کے SUD ماڈیول کے ہوم اسکرین کو دکھاتی ہے، جس میں "Substance Use Disorder (SUD) Module" کا بٹن نمایاں ہے۔ مزید معلومات کے لیے اس بٹن کو دبائیں۔',
    'یہ سائڈ بار مینو ہے. سائڈ بار میں مختلف "SUD ماڈیول ونڈوز" شامل ہیں، جن کے آئیکون اور متن دونوں انگریزی اور ایک دوسری زبان میں ہیں۔ یہ سکرین "Close" بٹن کے ساتھ "Close Sidebar" لکھا ہوا ہے اور "X" بند کرنے کا  آئیکون بھی موجود ہے۔',
    'یہ تصویر "Substance Use Disorder (SUD) Module" پر کلک کرنے کے بعد دکھائی جاتی ہے، جس میں بنیادی کنٹرول بٹن اور 5 مختلف ونڈوز شامل ہیں، جو مزید مختلف سکرینز پر مشتمل ہیں۔',
    'آپ اوپر دکھائے گئے نیلے لنکس پر کلک کرکے معلومات کا مصدر دیکھ سکتے ہیں۔',
    'آپ اب اس ایپلیکیشن کو استعمال کرنے کے لئے تیار ہیں۔ مزید معلومات کے لئے، براہ کرم شکریہ کے حصے میں دی گئی معلومات کے ذریعہ ہم سے رابطہ کریں۔',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: "Tutorial",
        showSource: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 7, // 80% of the screen for images
                child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  itemBuilder: (context, index, realIndex) {
                    return Image.asset(imageList[index], fit: BoxFit.fill);
                  },
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.7,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    initialPage:
                        _currentIndex, // Ensuring carousel starts at the correct page
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex =
                            index; // Update current index when user scrolls manually
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 3, // 20% of the screen for description and navigation
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      child: BaseTextComponent(
                        text: descriptionList[_currentIndex],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: _currentIndex > 0
                              ? () {
                                  setState(() {
                                    _currentIndex--;
                                  });
                                }
                              : null,
                        ),
                        Row(
                          children: imageList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentIndex = entry.key;
                                });
                              },
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == entry.key
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: _currentIndex < imageList.length - 1
                              ? () {
                                  setState(() {
                                    _currentIndex++;
                                  });
                                }
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
