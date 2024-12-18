import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';

class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: "Disclaimer",
      showSource: false,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: EnglishTextComponent(
                      text:
                          "Published by World Health Organization in 2016 under the title mhGAP intervention guide for mental, neurological and substance use disorders in non-specialized health settings: mental health Gap Action Program (mhGAP), version 2.0.",
                      fontColor: bodyTextColor,
                      align: TextAlign.left),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: EnglishTextComponent(
                      text: "© World Health Organization 2016",
                      fontColor: bodyTextColor,
                      align: TextAlign.left),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: EnglishTextComponent(
                      text:
                          "The World Health Organization has granted a translation and publication permission for an edition in the Urdu language(s) to the Capital University of Science and Technology, which is solely responsible for the quality and faithfulness of the translation(s). In the event of any inconsistency between the English and the translated edition(s), the original English edition shall be the binding and authentic edition.",
                      fontColor: bodyTextColor,
                      align: TextAlign.left),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: EnglishTextComponent(
                      text:
                          "Funding:\nThe Urdu translation of mhGAP-IG-SUD Module was funded by Higher Education Commission of Pakistan under National Research Program for Universities in 2023.",
                      fontColor: bodyTextColor,
                      align: TextAlign.left),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: BaseTextComponent(
                    text:
                        "یہ کتابچہ (گائیڈ ) کیپیٹل یونیورسٹی آف سائنس اینڈ ٹیکنالوجی کے زیر نگرانی تیار کی گئی ہے اور ہائیر ایجو کیشن کمیشن، پاکستان نے اسے فنڈ کیا۔"
                        " عالمی ادارہ صحت نے کیپیٹل یونیورسٹی آف سائنس اینڈ ٹیکنالوجی، اسلام آباد کو اس رہنما کتا بچے (گائیڈ ) کے اردو ترجمہ کرنے اور چھاپنے کے حقوق دیے ہیں، "
                        "جو مکمل طور پر اس اردو ترجمے کے معیار اور سچائی کے ذمہ دار ہیں۔ اگر کسی موقع پر انگریزی اور اردو ترجمے میں کوئی تضاد ہوا، تو اصلی انگریزی والا شمارہ آخری اور حتمی شمار ہ مانا جائے گا۔",
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: BaseTextComponent(
                    text:
                        "نشہ آور اشیاء کے استعمال سے ہونے والے امراض کے علاج کے لیے رہنما کتابچہ (گائیڈ) ",
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: BaseTextComponent(
                      text: "کیپیٹل یونیورسٹی آف سائنس اینڈ ٹیکنالوجی © 2024"),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
