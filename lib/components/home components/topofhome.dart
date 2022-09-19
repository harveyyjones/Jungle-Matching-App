import 'package:flutter/material.dart';

class TopOfTheHome extends StatelessWidget {
  const TopOfTheHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [sideBar(), sideBar(), sideBar()],
      ),
    );
  }

  static sideBar() {
    return Column(
      children: [
        Container(
          width: 36,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
        ),
        const SizedBox(
          height: 3,
        ),
      ],
    );
  }
}
