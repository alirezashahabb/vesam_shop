import 'package:cherry_toast/cherry_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/screens/home/bloc/home_bloc.dart';
import 'package:online_shop/screens/root/root.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    setState(
      () {
        if (connectivityResult.contains(ConnectivityResult.mobile)) {
          isConnectedToInternet = true;
          BlocProvider.of<HomeBloc>(context).add(HomeInitEvent());
        } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
          isConnectedToInternet = true;
          BlocProvider.of<HomeBloc>(context).add(HomeInitEvent());
        } else {
          isConnectedToInternet = false;
        }
      },
    );
  }

  bool isConnectedToInternet = true;
  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary500,
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeSuccessState) {
            goScreen(
              context: context,
              screen: RootScreen(),
              closeScreen: true,
            );
          } else if (state is HomeErrorState) {
            CherryToast.error(
              title: Text(state.error,
                  style: Theme.of(context).textTheme.bodyMedium),
            ).show(context);
          }
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                SvgPicture.asset(
                  'assets/img/Logo.svg',
                  width: 100,
                  height: 100,
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kWhite,
                        ),
                    text: ' به اپلیکیشن',
                    children: [
                      TextSpan(
                        text: ' وسام شاپ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.kWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                      ),
                      TextSpan(
                        text: ' خوش آمدید',
                      ),
                    ],
                  ),
                ),
                Spacer(),
                isConnectedToInternet
                    ? CupertinoActivityIndicator(
                        color: AppColors.kWhite,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Column(
                          children: [
                            Text(
                                'ای بابا به نظر میرسه که اتصال به اینترنت قطعه!',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: AppColors.kWhite,
                                      fontSize: 17,
                                    )),
                            TextButton(
                              onPressed: () {
                                checkInternet();
                              },
                              child: Text(
                                'تلاش مجدد',
                                style: TextStyle(
                                  color: AppColors.kWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
