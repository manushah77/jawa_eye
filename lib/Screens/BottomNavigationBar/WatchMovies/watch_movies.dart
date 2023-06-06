import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constant/color.dart';

class WatchMovies extends StatefulWidget {
  const WatchMovies({Key? key}) : super(key: key);

  @override
  State<WatchMovies> createState() => _WatchMoviesState();
}

class _WatchMoviesState extends State<WatchMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'Watch to Earn',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              for(int  i=0 ;i <5 ; i ++)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                  child: Stack(
                    children: [
                      Container(
                        height: 160.h,
                        width: 330.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://c8.alamy.com/comp/2JG1TE7/emily-blunt-tom-cruise-poster-edge-of-tomorrow-2014-2JG1TE7.jpg'
                              ,),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 120,
                        child: Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child:  Center(
                            child: Icon(Icons.play_arrow_outlined,color: Colors.white,size: 30,) ,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
            ],
          ),
        ),
      ),

    );
  }
}
