import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const Color grey = Color(0xFFD9D9D9);
const Color greyBoxBack =Color(0xffECECEC);
const Color backGroundGrey = Color(0x03000000);
const Color pinkBoxBack = Color(0xfffec0cc);
const Color pinkBackGround = Color(0xfffeebef);



TextStyle textStyle({double size=14.0,Color color =  Colors.black,FontWeight weight = FontWeight.w400,double letterSpace = 0.0}){
  return GoogleFonts.poppins(
      fontSize: size,
      color: color,
      fontWeight: weight,
      letterSpacing: letterSpace
  );
}