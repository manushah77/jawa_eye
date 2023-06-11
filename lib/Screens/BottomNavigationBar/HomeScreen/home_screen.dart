import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawa_eye/providers/api_client.dart';
import 'package:jawa_eye/providers/services.dart';
import 'package:jiffy/jiffy.dart';

import '../../../Constant/color.dart';
import '../WithdrawlScreens/withdraw_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imageUrl = [
    'https://e1.pxfuel.com/desktop-wallpaper/231/594/desktop-wallpaper-top-gun-maverick-movie-poster-top-gun-maverick-tom-cruise-movie.jpg',
    'https://i.etsystatic.com/31639397/r/il/7fd232/3382363579/il_570xN.3382363579_ldlu.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM79FqVNcKDDufTjZmfwe4LKfUsuBmo33_-A&usqp=CAU',
    'https://c8.alamy.com/comp/2JG1TE7/emily-blunt-tom-cruise-poster-edge-of-tomorrow-2014-2JG1TE7.jpg',
    'https://i.ebayimg.com/images/g/J6YAAOSwkUxeQepF/s-l500.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'BLUE GROW',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/message.png',
              height: 30.h,
              width: 30.w,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 25.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 22.0,
                right: 22,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'New Arrival',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CarouselSlider(
              items: imageUrl
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                e,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 165.h,
                // aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                // enableInfiniteScroll: true,
                // reverse: false,
                autoPlay: true,
                // autoPlayInterval: Duration(seconds: 4),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                // // onPageChanged: callbackFunction,
                // scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/mobile.png',
                            height: 30.h,
                            width: 30.w,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Recharge\n Balance',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Withdraw(),
                          ),
                        );
                      },
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/withdra.png',
                            height: 30.h,
                            width: 30.w,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Withdraw\n Balance',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/helpdesk.png',
                            height: 40.h,
                            width: 40.w,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Help\n Center',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 22.0,
                right: 22,
              ),
              child: Text(
                'Popular List',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: 130.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: primaryColor,
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://i.ebayimg.com/images/g/J6YAAOSwkUxeQepF/s-l500.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: 60,
                            child: Container(
                              height: 25.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: const Center(
                                child: Text(
                                  'Buy',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 22.0,
                right: 22,
              ),
              child: Text(
                'Showinng Up',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                  stream: locator.get<FirebaseClient>().getSnapshots('tickets'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children: snapshot.data!.docs
                          .map((e) => TicketTile(
                                ticketDetail: e,
                              ))
                          .toList(),
                    );
                  }),
            )),
          ],
        ),
      ),
    );
  }
}

class TicketTile extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> ticketDetail;
  const TicketTile({
    required this.ticketDetail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Color(ticketDetail['color']),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.airplanemode_active_rounded,
                    color: Colors.white,
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Air Ticket',
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 25.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: const Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        ticketDetail['boarding'],
                        style:
                            TextStyle(color: Color(ticketDetail['color']), fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.airplane_ticket_outlined, size: 40),
                      Text(
                        ticketDetail['destination'],
                        style:
                            TextStyle(color: Color(ticketDetail['color']), fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ticket Name',
                            style: TextStyle(color: Color(ticketDetail['color']), fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          Text(ticketDetail['name']),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            'Departure',
                            style: TextStyle(color: Color(ticketDetail['color']), fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          Text(Jiffy.parse(ticketDetail['startTime']).yMMMdjm),
                        ],
                      ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(color: Color(ticketDetail['color']), fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          Text('${ticketDetail['price']} BTC'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
