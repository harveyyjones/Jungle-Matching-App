import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  ProgressBar({super.key, required this.percentWatched});

  double percentWatched = 0.5;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

List storyCount = [
  1,
  2,
  3,
  
]; // Listenin sıranın lengthini burdan alıyor. Burada fotoğrafları tutacağız.

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 10,
      progressColor: Colors.grey,
      backgroundColor: Colors.white,
      barRadius: Radius.circular(20),
      percent: widget.percentWatched,
      width: MediaQuery.of(context).size.width * 1 / storyCount.length,
    );
  }
}

class AllProgressBars extends StatefulWidget {
  AllProgressBars({super.key, required this.percentWatched});
  var percentWatched = [];

  @override
  State<AllProgressBars> createState() => _AllProgressBarsState();
}

class _AllProgressBarsState extends State<AllProgressBars> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProgressBar(percentWatched: widget.percentWatched[0]),
        ProgressBar(percentWatched: widget.percentWatched[1]),
        ProgressBar(percentWatched: widget.percentWatched[2]),
      ],
    );
  }
}
