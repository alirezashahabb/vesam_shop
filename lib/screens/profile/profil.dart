import 'package:flutter/material.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/guest_screen.dart';
import 'package:online_shop/screens/home/bloc/home_bloc.dart';
import 'package:online_shop/screens/profile/favariot_screen.dart';
import 'package:online_shop/screens/profile/user_comment.dart';
import 'package:online_shop/screens/profile/user_peyment_screen.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/navigator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('اطلاعات کاربری'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: isLogin,
        builder: (context, value, child) {
          if (value) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                spacing: 12,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.kGray50,
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: AppColors.kGray700,
                    ),
                  ),
                  Text(
                    currentUser!.fullName!,
                  ),
                  Text(
                    currentUser!.phoneNumber!,
                    style: themeData.textTheme.bodySmall,
                  ),
                  ListTileSection(
                    title: 'نظرات من',
                    icone: Icon(Icons.message_outlined),
                    onTap: () {
                      goScreen(
                        context: context,
                        screen: UserCommentScreen(),
                      );
                    },
                  ),
                  Divider(),
                  ListTileSection(
                    title: 'لیست موردعلاقه‌ها',
                    icone: Icon(Icons.favorite_border_outlined),
                    onTap: () {
                      goScreen(
                        context: context,
                        screen: FavoriteScreen(),
                      );
                    },
                  ),
                  Divider(),
                  ListTileSection(
                    title: 'پرداخت‌های من',
                    icone: Icon(Icons.payment_outlined),
                    onTap: () {
                      goScreen(
                        context: context,
                        screen: UserPaymentScreen(),
                      );
                    },
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () async {
                            await prefs.remove('token');
                            isLogin.value = false;
                            currentUser = null;
                          },
                          child: Icon(
                            Icons.exit_to_app_outlined,
                            color: AppColors.kAlert500,
                          ),
                        ),
                        Text(
                          'خروج از حساب کاربری',
                          style: themeData.textTheme.bodyLarge!.copyWith(
                            color: AppColors.kAlert500,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return GuestScreen();
          }
        },
      ),
    );
  }
}

class ListTileSection extends StatelessWidget {
  final String title;
  final Widget icone;
  final GestureTapCallback onTap;

  const ListTileSection({
    super.key,
    required this.title,
    required this.icone,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icone,
      title: Text(title),
      trailing: Icon(
        Icons.chevron_right_rounded,
      ),
      onTap: onTap,
    );
  }
}
