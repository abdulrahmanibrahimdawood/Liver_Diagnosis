import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title, Icon? icon}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo'),
    ),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: icon,
    ),
  );
}
