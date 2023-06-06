import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawa_eye/Screens/BottomNavigationBar/WithdrawlScreens/withdrawal_record.dart';

import '../../../../Constant/color.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Withdraw',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WithdrawRecordScreen(),
                    ),
                  );
                },
                child: Text(
                  'Record',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: Text(
                    'Withdraw Amount',
                    style: TextStyle(fontSize: 16, color: primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: SizedBox(
                width: 280.w,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: primaryColor,
                      width: 1,
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: primaryColor,
                      width: 1,
                    )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: primaryColor,
                      width: 1,
                    )),
                    hintText: 'Enter Amount',
                    hintStyle: TextStyle(
                      color: primaryColor.withOpacity(0.4),
                    ),
                  ),
                  style: TextStyle(
                    color: primaryColor,
                  ),
                  cursorColor: primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 38.0),
                  child: Text(
                    'Withdraw Account Adress',
                    style: TextStyle(fontSize: 16, color: primaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: SizedBox(
                width: 280.w,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                          width: 1,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                          width: 1,
                        )),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                          width: 1,
                        )),
                    hintText: 'Enter Account Adress',
                    hintStyle: TextStyle(
                      color: primaryColor.withOpacity(0.4),
                    ),
                  ),
                  style: TextStyle(
                    color: primaryColor,
                  ),
                  cursorColor: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
