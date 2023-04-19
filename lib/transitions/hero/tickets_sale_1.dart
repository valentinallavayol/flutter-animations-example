// ignore_for_file: prefer_int_literals

import 'package:flutter/material.dart';
import 'package:panzetapp/transitions/hero/buy_button.dart';
import 'package:panzetapp/transitions/hero/constants/colors.dart';

class TicketsSale1 extends StatelessWidget {
  const TicketsSale1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopOfScreen(),
            const Spacer(),
            _buildBottomOfScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopOfScreen() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'ORDER',
            style: TextStyle(
              fontFamily: 'LexendDeca',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 80, top: 20),
          child: Row(
            children: [
              Row(
                children: const [
                  Text(
                    '6:15',
                    style: TextStyle(
                      fontFamily: 'LexendDeca',
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      letterSpacing: 0.8,
                    ),
                  ),
                  Text(
                    'PM',
                    style: TextStyle(
                      fontFamily: 'LexendDeca',
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'FRIDAY \nAPRIL 8TH',
                    style: TextStyle(
                      fontFamily: 'LexendDeca',
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      letterSpacing: 0.8,
                    ),
                  ),
                  Text(
                    'KINOTEKA \nPLAC DEFILAD 1',
                    style: TextStyle(
                      fontFamily: 'LexendDeca',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      letterSpacing: 0.8,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBottomOfScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Matt Reeves',
                style: TextStyle(
                  fontFamily: 'LexendDeca',
                  fontWeight: FontWeight.w200,
                  fontSize: 36,
                  letterSpacing: 0.8,
                ),
              ),
              Text(
                'The Batman',
                style: TextStyle(
                  fontFamily: 'LexendDeca',
                  fontWeight: FontWeight.w400,
                  fontSize: 36,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.black,
        ),
        const SizedBox(height: 20),
        const Center(child: BuyButton()),
        const SizedBox(height: 20),
      ],
    );
  }
}
