import 'package:ecommerce_hti/features/login/presentation/manager/cubit.dart';
import 'package:ecommerce_hti/features/login/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text(state.failures.message),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: LoginCubit.get(context).formKEy,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 85.h,
                  ),
                  Image.asset(
                    "assets/images/route.png",
                    width: 237.w,
                    height: 71.h,
                  ),
                  SizedBox(
                    height: 89.h,
                  ),
                  TextFormField(
                    controller: LoginCubit.get(context).nameController,
                    decoration: InputDecoration(
                        hintText: "Username",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                  SizedBox(
                    height: 74.h,
                  ),
                  TextFormField(
                    controller: LoginCubit.get(context).passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Email",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.transparent)),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(398.w, 64.h),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        LoginCubit.get(context).login();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20.sp, color: AppColors.primaryColor),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
