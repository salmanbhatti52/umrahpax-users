import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umrahcar_user/screens/tracking_process/track_screen.dart';
import 'package:umrahcar_user/utils/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:umrahcar_user/widgets/home_list.dart';
import 'package:umrahcar_user/screens/notification_screen.dart';
import 'package:umrahcar_user/screens/tracking_process/tarcking/pickup_screen.dart';
import 'package:umrahcar_user/widgets/ongoing_list.dart';
import 'package:umrahcar_user/widgets/upcoming_list.dart';

import '../models/get_booking_list_model.dart';
import '../service/rest_api_service.dart';


var phoneNmbr;
var guestName;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  getLocalData()async{
    final sharedPref = await SharedPreferences.getInstance();
    var contact=sharedPref.getString('contact');
    var name=sharedPref.getString('name');
    print("contact nmbr: $contact");
    print("name: $name");
    phoneNmbr=contact;
    guestName=name;
    if(phoneNmbr !=null){
      getBookingListOngoing();
      getBookingListUpcoming();
    }

  }
  GetBookingListModel getBookingOngoingResponse=GetBookingListModel();

  getBookingListOngoing()async{
    print("phoneNmbr $phoneNmbr");
    var mapData={
      "contact": phoneNmbr.toString()
    };
    getBookingOngoingResponse= await DioClient().getBookingOngoing(mapData, context);
    print("response id: ${getBookingOngoingResponse.data}");
    setState(() {

    });

  }
  GetBookingListModel getBookingUpcomingResponse=GetBookingListModel();
  getBookingListUpcoming()async{
    print("phoneNmbr $phoneNmbr");
    var mapData={
      "contact": phoneNmbr.toString()
    };
    getBookingUpcomingResponse= await DioClient().getBookingupcoming(mapData, context);
    print("response id: ${getBookingUpcomingResponse.data}");
    setState(() {

    });

  }

  @override
  void initState() {
    getLocalData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: Stack(
        children: [
          Container(
              color: const Color(0xFFF8B73F),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/background.png'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  width: size.width,
                  height: size.height * 0.259,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          radius: 35,
                          child: Image.asset(
                            'assets/images/profile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),

                        Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              '$guestName',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6, right: 25),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           const NotificationPage(),
                            //     ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: Colors.black.withOpacity(0.15),
                              ),
                            ),
                            child:  Container(
                               decoration: const ShapeDecoration(
                                  color: Color(0xFFDD9519),
                                  shape: OvalBorder(),
                                ),
                              child: SvgPicture.asset(
                                  'assets/images/green-notification-icon.svg'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.17),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bookings',
                              style: TextStyle(
                                color: Colors.black,
                              fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        color: Colors.transparent,
                        // height: size.height * 0.3806,
                      
                        height: size.height * 0.3635,    
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: RefreshIndicator(
                            color: Colors.amber,
                              onRefresh: ()async{
                                getBookingListOngoing();
                              },
                              child: onGoingList(context,getBookingOngoingResponse)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          getBookingOngoingResponse.data!=null ?
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 150),
            child: GestureDetector(
              onTap: () {
                if( getBookingOngoingResponse.data!=null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  TrackPage(getBookingData: getBookingOngoingResponse.data![0]),
                    ));
                  setState(() {

                  });
                }
              },
              child: Container(
                width: size.width,
                height: size.height * 0.245,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.15),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'On Going Booking',
                        style: TextStyle(
                          color: Colors.black,
                         fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/homepage-map.png',
                          ),
                          Positioned(
                            top: 15,
                            left: 115,
                            child: SvgPicture.asset(
                                'assets/images/home-green-location-icon.svg'),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                child: Image.asset(
                                  'assets/images/user-profile.png',
                                ),
                              ),
                              SizedBox(width: size.width * 0.02),
                               Text(
                                 getBookingOngoingResponse.data![0].vehicles![0].vehiclesDrivers!=null?    '${getBookingOngoingResponse.data![0].vehicles![0].vehiclesDrivers!.name}':"",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/location-icon.svg'),
                              SizedBox(width: size.width * 0.02),
                              Container(
                                color: Colors.transparent,
                                width: size.width * 0.25,
                                child:  AutoSizeText(
                                  '${getBookingOngoingResponse.data![0].routes!.pickup!.name}',
                                  style: const TextStyle(
                                    color: Color(0xFF565656),
                                  fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8,
                                  ),
                                  minFontSize: 8,
                                  maxFontSize: 8,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ): const Padding(
            padding: EdgeInsets.only(left: 120, right: 20, top: 180),
            child: Column(
              children: [
                SizedBox(height: 130,),
                Text(
                  'No Current Booking',
                  style: TextStyle(
                    color: Colors.black,

                  fontFamily: 'Poppins',
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
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
