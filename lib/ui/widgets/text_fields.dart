import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_bloc/ui/constants/colors.dart';

class CityTextField extends StatelessWidget {
  const CityTextField({Key? key, this.controller}) : super(key: key);

  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: Colors.black45,
                  style: BorderStyle.solid
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  color: accentColor,
                  style: BorderStyle.solid,
                  width: 2.0
              )
          ),
          hintText: "Город",
          hintStyle: TextStyle(
            color: secondaryTextColor,
            fontSize: 14.0
          ),
        ),
      ),
    );
  }
}
