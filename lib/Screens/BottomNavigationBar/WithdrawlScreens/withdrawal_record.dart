import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constant/color.dart';

class WithdrawRecordScreen extends StatefulWidget {
  const WithdrawRecordScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawRecordScreen> createState() => _WithdrawRecordScreenState();
}

class _WithdrawRecordScreenState extends State<WithdrawRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Record',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              tileColor: primaryColor.withOpacity(0.2),
              title: Text(
                'R322Rwe4dA2ssa1FA1',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '2023-02-15',
                style: TextStyle(
                  color: primaryColor.withOpacity(0.5),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '100\$',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Under Review',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              tileColor: primaryColor.withOpacity(0.2),
              title: Text(
                'R322Rwe4dA2ssa1FA1',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '2023-02-17',
                style: TextStyle(
                  color: primaryColor.withOpacity(0.5),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '100\$',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Passed',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              tileColor: primaryColor.withOpacity(0.2),
              title: Text(
                'R322Rwe4dA2ssa1FA1',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '2023-02-15',
                style: TextStyle(
                  color: primaryColor.withOpacity(0.5),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '100\$',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Rejected',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
