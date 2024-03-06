import 'package:employeeapp/core/utils/validation_functions.dart';
import 'package:employeeapp/presentation/login/controller/login_controller.dart';
import 'package:employeeapp/theme/app_decoration.dart';
import 'package:employeeapp/theme/button_style.dart';
import 'package:employeeapp/theme/theme.dart';
import 'package:employeeapp/widgets_common/elevated_button.dart';
import 'package:employeeapp/widgets_common/textstyle.dart';
import 'package:employeeapp/widgets_common/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(left: 26, top: 100),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome Back\n",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 30),
                      ),
                      TextSpan(
                        text: "Please login to your account",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: AppDecoration.outlineBlack9004,
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        defaultSpacerVerticalLarge,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: CustomTextFormField(
                              onChanged: (value) {
                                controller.checkText();
                              },
                              prefix: const Icon(
                                Icons.email_outlined,
                                size: 23,
                              ),
                              controller: controller.emailController,
                              hintText: "Username",
                              hintStyle: CustomTextStyles.bodyMediumBluegray400,
                              textInputType: TextInputType.text,
                              validator: (value) {
                                if (isValidEmail(value)) {
                                  return "Please enter valid email";
                                }
                                return null;
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14)),
                        ),
                        defaultSpacerVerticalMedium,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: CustomTextFormField(
                              onChanged: (value) {
                                controller.checkText();
                              },
                              prefix: const Icon(
                                Icons.key,
                                size: 23,
                              ),
                              controller: controller.passwordController,
                              hintText: "Password",
                              hintStyle: CustomTextStyles.bodyMediumBluegray400,
                              textInputType: TextInputType.text,
                              validator: (value) {
                                if (isValidPassword(value)) {
                                  return "Please enter valid password";
                                } else if (value!.length < 5) {
                                  return 'Password should be at least 5 characters long';
                                }
                                return null;
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14)),
                        ),
                        defaultSpacerVerticalMedium,
                        defaultSpacerVerticalMedium,
                        Obx(
                          () => CustomElevatedButton(
                              isDisabled: controller.buttoncheck.value,
                              height: 50,
                              text: controller.isloading.value
                                  ? "Please wait.."
                                  : "Sign in",
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              buttonStyle: CustomButtonStyles.fillBlue,
                              buttonTextStyle:
                                  CustomTextStyles.bodyMediumBluegray40,
                              rightIcon: controller.isloading.value
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          color: Colors.white,
                                        )),
                                      ),
                                    )
                                  : null,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  controller.userLogin();
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
