import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umrahcar_user/utils/colors.dart';

Widget button(buttonText, context) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}

Widget buttonTransparent(buttonText, context) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: buttonColor, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/small-delete-icon.svg',
            // colorFilter: ColorFilter.mode(buttonColor, BlendMode.srcIn),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Text(
            buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: buttonColor,
             fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dialogButton(buttonText, context) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
           fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: 0.3,
          ),
        ),
      ),
    ),
  );
}

Widget dialogButtonTransparent(buttonText, context) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: buttonColor, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/contact-icon.svg'),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Text(
            buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
             fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dialogbuttonSmall(buttonText, context) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
           fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: 0.3,
          ),
        ),
      ),
    ),
  );
}

Widget dialogButtontransparentSmall(buttonText, context) {
  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: buttonColor, width: 1),
      ),
      child: Center(
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
           fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: 0.3,
          ),
        ),
      ),
    ),
  );
}
