// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required String title,
    required String subtitle,
    required Widget screen,
  })  : _title = title,
        _subtitle = subtitle,
        _screen = screen;

  final String _title;
  final String _subtitle;
  final Widget _screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => _screen,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(22)),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, right: 10, top: 14, bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title,
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(79, 79, 79, 1),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _subtitle,
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color.fromRGBO(79, 79, 79, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.navigate_next,
                color: Color.fromRGBO(79, 79, 79, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
