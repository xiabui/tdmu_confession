import 'package:flutter/material.dart';

Widget avatar(String linkToImage){
  return Container(
    width: 65,
    height: 65,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(width: 1, color: Colors.white),
    ),
    child: Image.asset(linkToImage, fit: BoxFit.contain,),
  );
}