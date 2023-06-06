import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constant/color.dart';

class CustomButton extends StatefulWidget {
  String? txt;
  Function? onTap;
   CustomButton({this.txt,this.onTap}) ;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, right: 28),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        minWidth: 290.w,
        height: 50.h,
        color: primaryColor,
        onPressed: () {
          widget.onTap!();
        },
        child: Center(
          child: Text(
            '${widget.txt}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
