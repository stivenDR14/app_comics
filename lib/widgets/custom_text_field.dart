import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String icon;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final Function onIconPressed;
  final bool isMail;
  final bool readOnly;
  final bool isNumber;

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.maxLines = 1,
    required this.onIconPressed,
    required this.icon,
    this.isMail = false,
    this.readOnly=false,
    this.isNumber=false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 15),
      textInputAction: TextInputAction.next,
      onSubmitted: (value) {
        FocusScope.of(context).nextFocus();
      },
      readOnly: readOnly,
      keyboardType: isMail ? TextInputType.emailAddress: isNumber? TextInputType.number:TextInputType.text ,
      maxLines: maxLines,
      controller: controller,
      textCapitalization: TextCapitalization.none,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintStyle: TextStyle().copyWith(fontSize: 15),
        hintText: hintText,
        border: OutlineInputBorder(),
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide( width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide( width: 2.0),
        ),
        contentPadding: EdgeInsets.all(15),
        suffixIcon: GestureDetector(
          child: icon != null
              ? IconButton(
            icon: ImageIcon(
              AssetImage(icon),
              size: 24,
              color: Colors.orangeAccent,
            ),
            onPressed: () {
              this.onIconPressed();
            },
          )
              : SizedBox(),
        ),
      ),
    );
  }
}
