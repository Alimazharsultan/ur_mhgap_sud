import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';

class ExpandableText extends StatefulWidget {
  final String title;
  final List<String> listTexts;

  const ExpandableText({
    super.key,
    required this.title,
    required this.listTexts,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: _toggleExpanded,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                    (_isExpanded)
                        ? Icons.keyboard_arrow_up_outlined
                        : Icons.keyboard_arrow_down_outlined,
                    color: navigationBarColor),
                onPressed: _toggleExpanded,
              ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: BaseTextComponent(
                    text: widget.title,
                    fontSize: navigationRowTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_isExpanded) ListNumberPoints(numberPoints: widget.listTexts),
        const Divider(),
      ],
    );
  }
}
