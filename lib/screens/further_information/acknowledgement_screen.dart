import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';

class AcknowledgementScreen extends StatelessWidget {
  const AcknowledgementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      showSource: false,
      title: "Acknowledgements",
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  text: "اعتراف و تسلیمات (Acknowledgements)",
                  addHorizontalPadding: true,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: BaseTextComponent(
                    text:
                        "نشہ آور اشیاء کے استعمال سے ہونے والے امراض کے علاج کے لیے یہ رہنما کتابچہ (گائیڈ) -mhGAP IG-SUD Module کیپیٹل یونیورسٹی آف سائنس اینڈ ٹیکنالوجی اور پاکستان انسٹی ٹیوٹ آف لیونگ اینڈ لرننگ کے باہمی تعاون سے تیار کیا گیا ہے۔",
                  ),
                ),
                SubTitleText(
                  text: "Funding",
                  center: true,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Text(
                    "The Urdu translation of mhGAP-IG-SUD Module was funded by Higher Education Commission of Pakistan under National Research Program for Universities in 2023.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SubTitleText(
                  text: "Translation",
                  center: true,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Text(
                    "Translation was done by Dr. Ishrat Yousaf (Associate Professor) in the Department of Psychology at Capital University of Science and Technology; and Ms. Muqqaddas Asif (Assistant Director of Ethics and Governance at Pakistan Institute of Living and Learning). Dr. Zainab Zadeh (Consultant Clinical Psychologist) contributed in proof reading of translation and Ms. Muqqadas Saba (Research Assistant) contributed in editing and formatting of this guide.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: BaseTextComponent(
                    text:
                        "نشہ آور اشیاء کے استعمال سے ہونے والے امراض (substance use disorder) کا دنیا بھر میں تیزی سے پھیلاؤ ایک عالمی مسئلہ ہے۔ وسائل اور خدمات کی دستیابی کے خلا کو پر کرنے کے لیے عالمی ادارہ صحت نے منیٹل ہیلتھ گیپ ایکشن پروگرام کا آغاز کیا۔ جس کا بنیادی مقصد شواہد پر مبنی انتظامی اقدامات اور تدابیر کے لائحہ عمل کا استعمال کرتے ہوئے ان امراض کی روک تھام اور خدمات کو بہتر بنانا ہے۔ اس کتابچے گائیڈ کا پہلا شمارہ 2010 میں شائع ہوا اور وسیع پیمانے پر اس کی کامیابی کے بعد، نئی اور اضافی معلومات پر مبنی تازہ ترین شمارہ 2016 میں شائع ہوا۔ جو کم اور درمیانی آمدنی والے ممالک خصوصاً پاکستان کے مقامی حالات اور ثقافت کو مدنظر رکھتے ہوئے اس کتابچے (گائیڈ) کے SUD ماڈیول کا اردو میں ترجمہ تیار کیا گیا۔ مزید معلومات کے لیے رابطہ کریں:",
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: BaseTextComponent(
                    text:
                        "ڈاکٹر عشرت یوسف (ایسوسی ایٹ پروفیسر ڈیپارٹمنٹ آف سائیکالوجی | کیپیٹل یونیورسٹی آف سائنس اینڈ ٹیکنالوجی\n"
                        "ishrat.yousaf@cust.edu.pk\n"
                        "051-111-555-666 Ext: 194",
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: BaseTextComponent(
                    text:
                        "مقدس آصف (اسسٹنٹ ڈائریکٹر ایتھکس اینڈ گورنس) پاکستان انسٹی ٹیوٹ آف لیونگ اینڈ لرننگ\n"
                        "muqaddas.asif@pill.org.pk",
                  ),
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
