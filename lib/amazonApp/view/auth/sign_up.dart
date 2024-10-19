import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../provider/auth_provider.dart';
import '../../widgets/custom_button.dart';
// Import the signup page

class SignupPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ConfirmpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final screenSize = MediaQuery.of(context).size;
    void signup() async {
      final user = await authRepository.registerWithEmailPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign Up  successful! Welcome, ${user.email}'),
            backgroundColor: Colors.orange,
          ),
        );

        // Optionally navigate to the home page after signup
        context.go('/login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign up failed'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/bg.png"), // Add your image path here
                fit: BoxFit.cover, // Cover the whole screen
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Center(
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 56,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenSize.height / 1.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60))),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                            child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(height: 20),
                        CustomTextField(
                          screenSize: screenSize,
                          mainController: firstNameController,
                          isTrue: false,
                          kLabelText: 'First Name',
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          screenSize: screenSize,
                          mainController: lastNameController,
                          isTrue: false,
                          kLabelText: 'Last Name',
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          screenSize: screenSize,
                          mainController: emailController,
                          isTrue: false,
                          kLabelText: 'Email',
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          screenSize: screenSize,
                          mainController: passwordController,
                          isTrue: true,
                          kLabelText: 'Password',
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          screenSize: screenSize,
                          mainController: ConfirmpasswordController,
                          isTrue: true,
                          kLabelText: 'Confirm Password',
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          screenSize: screenSize,
                          text: 'Sign Up',
                          onPressed: signup,
                        ),
                        TextButton(
                          onPressed: () {
                            context.go("/login");
                            // Navigate to the signup page
                          },
                          child: Text('Already have an account? Login'),
                        ),
                      ],
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

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.kLabelText,
    required this.screenSize,
    required this.mainController,
    required this.isTrue,
  });
  bool isTrue;
  String kLabelText;
  final Size screenSize;
  final TextEditingController mainController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width / 1.2,
      height: screenSize.height / 14,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Shadow color
            spreadRadius: 5, // How much the shadow spreads
            blurRadius: 7, // How blurry the shadow is
            offset: Offset(0, 3), // Changes the position of the shadow (x, y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: mainController,
          obscureText: isTrue,
          decoration: InputDecoration(
            labelText: kLabelText,
            border: InputBorder.none, // Removes the underline
            enabledBorder: InputBorder
                .none, // Removes the underline when the TextField is enabled
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
