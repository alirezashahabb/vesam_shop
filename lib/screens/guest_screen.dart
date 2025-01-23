import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/screens/auth/auth_scren.dart';
import 'package:online_shop/utils/navigator.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          SvgPicture.asset(
            'assets/img/baket.svg',
            width: 300,
            height: 300,
          ),
          Text(
            'لطفا به حساب کاربری خود وارد شوید !',
          ),
          ElevatedButton(
            onPressed: () {
              goScreen(
                context: context,
                screen: AuthScreen(),
              );
            },
            child: Text('ورود به حساب کاربری'),
          )
        ],
      ),
    );
  }
}
