import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double height;
  final Widget buttonIcon;
  final VoidCallback onPressed;

  const SocialButton(
      {Key key,
      @required this.buttonText,
      this.buttonColor: Colors.purple,
      this.textColor: Colors.white,
      this.radius: 16.0,
      this.height: 40.0,
      this.buttonIcon,
      this.onPressed})
      : assert(buttonText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: height,
        child: RaisedButton(
          onPressed: onPressed,
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (buttonIcon != null) ...[
                buttonIcon,
                Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
                Opacity(opacity: 0, child: buttonIcon),
              ],
              if (buttonIcon == null) ...[
                Container(),
                Text(
                  buttonText,
                  style: TextStyle(color: textColor),
                ),
                Container(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
