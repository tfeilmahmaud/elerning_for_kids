import 'package:flutter/material.dart';
import 'package:flutter_application_formatiom/config.dart';
import 'package:flutter_application_formatiom/screens/catagorylist.dart';
import 'package:flutter_application_formatiom/screens/forgot_password_screen.dart';
import 'package:flutter_application_formatiom/screens/level.dart';
import 'package:flutter_application_formatiom/widget/my_button.dart';
import 'package:flutter_application_formatiom/widget/my_text_filed.dart';
import 'package:get/get.dart';

import '../app_constants.dart';
import '../controllers/auth_controller.dart';
import '../services/firebase_service.dart';
import '../utils.dart';
import 'main_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  final FirebaseService _firebaseService = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context)
                .pop(); // Utilisation de Navigator pour revenir en arrière
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: AppBar().preferredSize.height * 2),
                Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Image(
                      image: AssetImage('assets/images/logo.jpg'),
                    )),
                SizedBox(height: fullHeight(context) * 0.06),
                const Text(
                  'Bienvenue',
                  style: TextStyle(
                    color: Color.fromARGB(255, 107, 179, 252),
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                    "Connectez-vous à votre compte d'apprentissage en ligne"),
                SizedBox(height: fullHeight(context) * 0.04),
                MyTextFiled(
                  hint: 'Enter Email Address',
                  controller: _authController.emailController,
                ),
                SizedBox(height: fullHeight(context) * 0.02),
                MyTextFiled(
                  hint: 'Password',
                  hasIcon: true,
                  controller: _authController.passwordController,
                ),
                SizedBox(height: fullHeight(context) * 0.01),
                Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: InkWell(
                        onTap: () {
                          Get.to(ForgotPasswordScreen());
                        },
                        child: const Text("Forgot Password?"))),
                SizedBox(height: fullHeight(context) * 0.04),
                Obx(() => _authController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : MyButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _authController.setIsLoading(true);
                            var loginResult = await _firebaseService.login(
                                _authController.emailController.text,
                                _authController.passwordController.text);
                            if (loginResult == true) {
                              _authController.setIsLoading(false);
                              Get.to(HomScreen());
                            } else {
                              _authController.setIsLoading(false);
                              showSnackbarError('Login failed !');
                            }
                          }
                        },
                        title: 'Log In',
                        color: Color.fromARGB(255, 88, 166, 240),
                      )),
                SizedBox(height: fullHeight(context) * 0.03),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Don't have an account ? ",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Create Account Here',
                              style: TextStyle(
                                  color: AppConstants.secondColor,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
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
