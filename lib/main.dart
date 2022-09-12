
import 'package:bloc/bloc.dart';
import 'package:e_commerce_complete_app/screens/home/home_screen.dart';
import 'package:e_commerce_complete_app/screens/sign_in/sign_in.dart';
import 'package:e_commerce_complete_app/screens/splash/splash_screen.dart';
import 'package:e_commerce_complete_app/shared/bloc_observer.dart';
import 'package:e_commerce_complete_app/shared/constants.dart';
import 'package:e_commerce_complete_app/shared/local/cache_helper.dart';
import 'package:e_commerce_complete_app/shared/remote/dio_helper.dart';
import 'package:e_commerce_complete_app/shared/routes.dart';
import 'package:e_commerce_complete_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'components/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget? widget;
  bool? splash = CacheHelper.getData(key: 'splash');
  token = CacheHelper.getData(key: 'token');
  print(token);

  if (splash != null && token != null) {
    if (token != null) {
      widget = const HomeScreen();
    } else {
      widget = SignInScreen();
    }
  } else {
    widget = const SplashScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.startWidget}) : super(key: key);
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopCubit()..getHomeData()..getCategoriesData()..getFavoritesData()..getCarts()..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: theme(),
        home: startWidget,
        routes: routes,
      ),
    );
  }
}
