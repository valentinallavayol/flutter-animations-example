import 'package:flutter/material.dart';

class CardChips extends StatelessWidget {
  const CardChips({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CardChip(title: 'Action'),
          SizedBox(
            width: 10,
          ),
          CardChip(title: 'Drama'),
          SizedBox(
            width: 10,
          ),
          CardChip(title: 'History'),
        ],
      ),
    );
  }
}

class CardChip extends StatelessWidget {
  const CardChip({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.fromLTRB(10, -6, 10, -6),
      label: Text(
        title,
        style: const TextStyle(fontSize: 10, color: Colors.black38),
      ),
      backgroundColor: Colors.white,
      shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),
    );
  }
}
