import 'package:flutter/material.dart';
import 'package:prophetspath/utils/app_style.dart';

class CustomIconButton extends StatefulWidget {
  final Icon icon;
  final double size;
  final VoidCallback onPressed;
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.size,
  }) : super(key: key);

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Material(
        elevation: 0.0,
        color: Colors.transparent,
        child: IconButton(
          icon: widget.icon,
          iconSize: widget.size,
          padding: EdgeInsets.zero,
          splashRadius: 23,
          alignment: Alignment.center,
          splashColor: AppStyle.primaryColor.withOpacity(0.1),
          highlightColor: AppStyle.primaryColor.withOpacity(0.1),
          color: AppStyle.primaryColor,
          onPressed: () {
            widget.onPressed();
          },
        ),
      ),
    );
  }
}
