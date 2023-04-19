import 'package:flutter/material.dart';

class EducationOnboardingScreen extends StatelessWidget {
  const EducationOnboardingScreen({
    super.key,
    required Color color,
    required String title,
    required String description,
    required String image,
  })  : _color = color,
        _title = title,
        _description = description,
        _image = image;

  final Color _color;
  final String _title;
  final String _description;
  final String _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: _color,
      child: Padding(
        padding: const EdgeInsets.only(left: 38, right: 38, top: 250),
        child: Column(
          children: [
            Image(
              image: AssetImage(_image),
              height: 240,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 38, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title,
                    style: const TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(79, 79, 79, 1),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    _description,
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color.fromRGBO(79, 79, 79, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
