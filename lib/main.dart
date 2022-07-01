import 'package:awesome_clother_shop/models/providers/cart.dart';
import 'package:awesome_clother_shop/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartModel())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Clothes Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark),
              titleTextStyle: GoogleFonts.tajawal(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22)),
          textTheme: GoogleFonts.tajawalTextTheme(),
          backgroundColor: Colors.white,
          primarySwatch: Colors.grey),
      home: const MyHomePage(title: 'Collection'),
    );
  }
}
