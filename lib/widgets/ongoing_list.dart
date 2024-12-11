import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:umrahcar_user/screens/tracking_process/track_screen.dart';
import 'package:umrahcar_user/utils/colors.dart';

import '../models/get_booking_list_model.dart';
import '../utils/const.dart';

Widget onGoingList(
    BuildContext context, GetBookingListModel getBookingOngoingData) {
  var size = MediaQuery.of(context).size;
  return getBookingOngoingData.data != null
      ? ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: getBookingOngoingData.data!.length,
          itemBuilder: (BuildContext context, int index) {
            var getData = getBookingOngoingData.data![index];

            return InkWell(
              splashColor: Colors.grey.withOpacity(0.5),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackPage(getBookingData: getData),
                    ));
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 8, bottom: 8, left: 8),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                                "$imageUrl${getData.routes!.vehicles!.featureImage}"),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.003),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getData.name!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: size.height * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "booking id: ${getData.bookingsId}",
                                style: const TextStyle(
                                  color: Color(0xFF565656),
                                  fontSize: 8,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: size.width * 0.02),
                              SvgPicture.asset(
                                  'assets/images/small-black-location-icon.svg'),
                              SizedBox(width: size.width * 0.01),
                              Text(
                                "${getData.routes!.pickup!.name}",
                                style: const TextStyle(
                                  color: Color(0xFF565656),
                                  fontSize: 8,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.005),
                          SizedBox(
                            width: 180,
                            child: Row(
                              children: [
                                for (int i = 0;
                                    i < getData.vehicles!.length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2),
                                    child: getData.vehicles!.length < 4
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/small-black-car-icon.svg'),
                                              SizedBox(
                                                  width: size.width * 0.01),
                                              Text(
                                                '${getData.vehicles![i].vehiclesName!.name}',
                                                style: const TextStyle(
                                                  color: Color(0xFF565656),
                                                  fontSize: 7,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 4),
                                                  child: SvgPicture.asset(
                                                      'assets/images/small-black-car-icon.svg'),
                                                ),
                                                Text(
                                                  '${getData.vehicles![i].vehiclesName!.name}',
                                                  style: const TextStyle(
                                                    color: Color(0xFF565656),
                                                    fontSize: 7,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/small-black-bookings-icon.svg'),
                              SizedBox(width: size.width * 0.01),
                              Text(
                                '${_formatDate(getData.pickupDate!)} ${_formatTime(getData.pickupTime!)}',
                                style: const TextStyle(
                                  color: Color(0xFF565656),
                                  fontSize: 8,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: size.width * 0.15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TrackPage(getBookingData: getData),
                              ));
                        },
                        child: Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: buttonColor,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            );
          },
        )
      : const SizedBox(
          // height: 300,
          // width: 300,
          child: Center(child: Text("No Ongoing Booking")),
        );
}

String _formatDate(String date) {
  final DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(date);
  return DateFormat('d MMM yyyy').format(parsedDate);
}

String _formatTime(String time) {
  final DateTime parsedTime = DateFormat('HH:mm:ss').parse(time);
  return DateFormat('h:mm a').format(parsedTime);
}

List myList = [
  MyList("assets/images/list-image-1.png", "Makkah Hottle Aziziz"),
];

class MyList {
  String? image;
  String? title;

  MyList(this.image, this.title);
}
