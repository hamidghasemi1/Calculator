import '../constants/contstants.dart';
import 'package:flutter/material.dart';

class BoxNeo extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  BoxNeo(
      {required this.darkMode,
      required this.child,
      required this.borderRadius,
      required this.padding,
      Key? key})
      : super(key: key);

  @override
  State<BoxNeo> createState() => _BoxNeoState();
}

class _BoxNeoState extends State<BoxNeo> {
  bool _isPresed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPresed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPresed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: darkMode ? colorDark : colorLight,
          borderRadius: widget.borderRadius,
          boxShadow: _isPresed
              ? [
                  BoxShadow(
                    color: darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: -10,
                  ),
                  BoxShadow(
                    color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: -10,
                  ),
                ]
              : [
                  BoxShadow(
                    color: darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
