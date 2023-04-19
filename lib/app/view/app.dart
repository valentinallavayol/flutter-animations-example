import 'package:flutter/material.dart';
import 'package:panzetapp/app/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panzetapp/carousel/cubit/carousel_cubit.dart';
import 'package:panzetapp/carousel/view/carousel_screen.dart';
import 'package:panzetapp/l10n/l10n.dart';
import 'package:panzetapp/transitions/hero/tickets_sale_1.dart';
import 'package:panzetapp/transitions/liquid/education_learning.dart';
import 'package:panzetapp/transitions/ripple/summer_travel.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: TicketsSale1(),
      // home: BlocProvider(
      //   create: (context) => CarouselCubit(),
      //   child: const AwesomeCarousel(),
      // ),
    );
  }
}
