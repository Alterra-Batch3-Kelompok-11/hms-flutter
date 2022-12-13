import 'package:flutter/material.dart';

class PatientCountLoading extends StatelessWidget {
  const PatientCountLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      width: double.infinity,
    );
  }
}
