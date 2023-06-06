import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constant/color.dart';

class ContainerWidget extends StatefulWidget {

  final String img;
  final Function ontap;

  const ContainerWidget({Key? key, required this.img, required this.ontap}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.ontap();
      },
      child: Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            '${widget.img}',
            height: 30.h,
            width: 30.w,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
