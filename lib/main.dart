import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app1/Screens/_screens.dart';

import 'Cubits/_cubits.dart';
import 'Router/AppRouter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantsListCubit>(
      create: (context) => RestaurantsListCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant App',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: RestaurantListScreen(),
      ),
    );
  }
}
