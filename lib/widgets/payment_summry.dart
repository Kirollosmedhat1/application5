import 'package:flutter/material.dart';

class payment_summary extends StatefulWidget {
  final String text;
  final String number;

  payment_summary({super.key, required this.text, required this.number});

  @override
  State<payment_summary> createState() => _payment_summaryState();
}

class _payment_summaryState extends State<payment_summary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  widget.text,
                  style: TextStyle(fontSize: 15, color: Color(0xff184F27)),
                ),
              ],
            ),
            Row(
              children: [
                Text(widget.number,
                    style: TextStyle(fontSize: 15, color: Color(0xff184F27))),
              ],
            )
          ],
        )
      ],
    );
  }
}
