import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeartButton extends StatefulWidget {
  const HeartButton({Key? key}) : super(key: key);

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: IconButton(
        iconSize: 34,
        icon: Icon(
          isSelected ? Icons.favorite : Icons.favorite_border,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
      ),
    );
  }
}
