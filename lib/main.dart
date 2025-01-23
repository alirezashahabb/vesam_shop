import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/data/model/home_model.dart';
import 'package:online_shop/data/services/auth_service.dart';
import 'package:online_shop/data/services/basket_service.dart';
import 'package:online_shop/data/services/home_service.dart';
import 'package:online_shop/data/services/product_service.dart';
import 'package:online_shop/data/services/profile_service.dart';
import 'package:online_shop/screens/auth/bloc/auth_bloc.dart';
import 'package:online_shop/screens/basket/bloc/basket_bloc.dart';
import 'package:online_shop/screens/comment/bloc/comment_bloc.dart';
import 'package:online_shop/screens/home/bloc/home_bloc.dart';
import 'package:online_shop/screens/product/PopularBloc/popular_bloc_bloc.dart';
import 'package:online_shop/screens/product/latestbloc/product_bloc.dart';
import 'package:online_shop/screens/productDetail/bloc/prodcut_detail_bloc.dart';
import 'package:online_shop/screens/profile/bloc/profile_bloc.dart';
import 'package:online_shop/screens/splash_screen.dart';
import 'package:online_shop/them.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

ValueNotifier<bool> isLogin = ValueNotifier(false);
// set  global context when is no exist
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(HomeProductsAdapter());
  await Hive.openBox<HomeProducts>('favorite_products');

  prefs = await SharedPreferences.getInstance();
  isLogin.value = prefs.getString('token') != null;

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc(
          HomeService(),
        ),
      ),
      BlocProvider(
        create: (context) => ProductLatestBloc(
          ProductService(),
        ),
      ),
      BlocProvider(
        create: (context) => PopularBloc(
          ProductService(),
        ),
      ),
      BlocProvider(
        create: (context) => ProductDetailBloc(
          ProductService(),
        ),
      ),
      BlocProvider(
        create: (context) => AuthBloc(
          AuthService(),
          HomeService(),
        ),
      ),
      BlocProvider(
        create: (context) => CommentBloc(
          ProductService(),
        ),
      ),
      BlocProvider(
        create: (context) => ProfileBloc(
          ProfileService(),
        ),
      ),
      BlocProvider(
        create: (context) => BasketBloc(
          BasketService(),
        ),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1),
          ),
          child: child as Widget,
        );
      },
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // farsi
        // Spanish
      ],
      title: 'online_shop',
      theme: lightThemeData(),
      home: const SplashScreen(),
    );
  }
}
