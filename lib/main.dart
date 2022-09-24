import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/bottom_navigation.dart';
import 'package:food_ordering_app/cubit/cart_cubit.dart';
import 'package:food_ordering_app/cubit/detail_cubit.dart';
import 'package:food_ordering_app/cubit/main_cubit.dart';
import 'package:food_ordering_app/views/detail_page.dart';
import 'package:food_ordering_app/views/intro_page.dart';
import 'package:food_ordering_app/views/profile/login_page.dart';
import 'package:food_ordering_app/views/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_ordering_app/views/profile/register_page.dart';

import 'Themese/Themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //Initiliaze Firebase App
  Future<FirebaseApp> _initiliazeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => DetailCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        home: IntroPage(),
      ),
    );
  }
}
