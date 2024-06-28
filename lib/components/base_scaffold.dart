import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/arrow_navigation_container.dart';

class BaseScaffold extends StatefulWidget {
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
  // ignore: library_private_types_in_public_api
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  double _navigationContainerHeight = 0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: <Widget>[
          if (widget.showOrangeBar)
            MeasureSize(
              onChange: (size) {
                if (_navigationContainerHeight != size.height) {
                  setState(() {
                    _navigationContainerHeight = size.height;
                  });
                }
              },
              child: ArrowNavigationContainer(
                text: widget.title,
                showBackButton: true,
              ),
            ),
          Padding(
            padding: EdgeInsets.only(
              top: widget.showOrangeBar ? _navigationContainerHeight : 0,
            ),
            child: InteractiveViewer(
              panEnabled: true, // Enables panning
              minScale: 0.5, // Minimum scale factor for zoom-out
              maxScale: 4.0, // Maximum scale factor for zoom-in
              child: widget.body,
            ),
          ),
        ],
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}

class MeasureSize extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onChange;

  const MeasureSize({super.key, 
    required this.onChange,
    required this.child,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MeasureSizeState createState() => _MeasureSizeState();
}

class _MeasureSizeState extends State<MeasureSize> {
  Size? _previousSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = context.size;
      if (size != null && size != _previousSize) {
        _previousSize = size;
        widget.onChange(size);
      }
    });

    return widget.child;
  }
}
