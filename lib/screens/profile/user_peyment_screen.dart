import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop/screens/profile/bloc/profile_bloc.dart';
import 'package:online_shop/screens/profile/payemnt_detail_screen.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/date_formatter.dart';
import 'package:online_shop/utils/navigator.dart';

class UserPaymentScreen extends StatefulWidget {
  const UserPaymentScreen({super.key});

  @override
  State<UserPaymentScreen> createState() => _UserPaymentScreenState();
}

class _UserPaymentScreenState extends State<UserPaymentScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(UserPaymentInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('پرداخت‌های من'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is UserPaymentSuccess) {
            return state.userPayment.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/img/peyment.svg',
                          width: 250,
                          height: 250,
                        ),
                        Text('پرداختی انجام نشده است')
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 50),
                    itemBuilder: (context, index) {
                      var payment = state.userPayment[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          goScreen(
                            context: context,
                            screen: UserPaymentDetailScreen(
                              userPaymentModel: payment,
                            ),
                          );
                        },
                        child: Ink(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.kGray50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            spacing: 12,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('شماره فاکتور'),
                                  Text(
                                    payment.factorCode.toString(),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('نام خریدار'),
                                  Text(
                                    payment.receiverFullName!,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('تاریخ خرید'),
                                  Text(
                                    '${convertDateAndTime(payment.createDate!).$2} - ${convertDateAndTime(payment.createDate!).$1}',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('کد پستی'),
                                  Text(
                                    payment.receiverPostalCode!,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: state.userPayment.length);
          } else if (state is UserPaymentError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
