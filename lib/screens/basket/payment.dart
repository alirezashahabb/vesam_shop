import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/model/payment_model.dart';
import 'package:online_shop/screens/basket/bloc/basket_bloc.dart';
import 'package:online_shop/them.dart';
import 'package:url_launcher/url_launcher.dart';

class PayMentScreen extends StatefulWidget {
  const PayMentScreen({super.key});

  @override
  State<PayMentScreen> createState() => _PayMentScreenState();
}

class _PayMentScreenState extends State<PayMentScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController zipCode = TextEditingController();
  final TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تکمیل خرید',
        ),
      ),
      body: BlocListener<BasketBloc, BasketState>(
        listener: (context, state) {
          if (state is BasketPaymentSuccessState) {
            launchUrl(
              Uri.parse(
                'https://flutter.vesam24.com${state.payment}',
              ),
              mode: LaunchMode.externalApplication,
            );
          }
        },
        child: Form(
          key: formKey,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Column(
                      spacing: 12,
                      children: [
                        TextFormField(
                          controller: fullName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'نام و نام خانوادگی را وارد نمایید';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'نام و نام‌خانوادگی',
                          ),
                        ),
                        TextFormField(
                          textAlign: TextAlign.left,
                          controller: phoneNumber,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'شماره همراه را  وارد نمایید';
                            }
                            if (value.length < 11) {
                              return 'شماره همراه ۱۱ رقم مباشد';
                            }
                            if (!value.startsWith('09')) {
                              return 'شماره تلفن صحیح نیست';
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                          ],
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'شماره همراه',
                          ),
                        ),
                        TextFormField(
                          textAlign: TextAlign.left,
                          controller: zipCode,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'کد پستی وارد نمایید';
                            }

                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'کد پستی',
                          ),
                        ),
                        TextFormField(
                          controller: address,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'آدرس را وارد نمایید';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: 'آدرس',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  height: 72,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kGray200,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<BasketBloc>(context).add(
                          BasketPaymentProductEvent(
                            paymentModel: PaymentModel(
                                receiverFullName: fullName.text,
                                receiverAddress: address.text,
                                receiverPhoneNumber: phoneNumber.text,
                                receiverPostalCode: zipCode.text),
                          ),
                        );
                      }
                    },
                    child: Text('تایید و پرداخت'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
