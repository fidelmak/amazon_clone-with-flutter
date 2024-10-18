import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../provider/auth_provider.dart';
import '../../widgets/custom_button.dart';
// Import the signup page

class LoginPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    final screenSize = MediaQuery.of(context).size;
    void login() async {
      final user = await authRepository.signInWithEmailPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful! Welcome, ${user.email}'),
            backgroundColor: Colors.orange,
          ),
        );

        context.go("/home");
        // Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Failed '),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                height: screenSize.height / 2,
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
                        'Login',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(height: 20),
                      Container(
                        width: screenSize.width / 1.2,
                        height: screenSize.height / 14,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.1), // Shadow color
                              spreadRadius: 5, // How much the shadow spreads
                              blurRadius: 7, // How blurry the shadow is
                              offset: Offset(0,
                                  3), // Changes the position of the shadow (x, y)
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: InputBorder.none, // Removes the underline
                              enabledBorder: InputBorder
                                  .none, // Removes the underline when the TextField is enabled
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: screenSize.width / 1.2,
                        height: screenSize.height / 14,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.1), // Shadow color
                              spreadRadius: 5, // How much the shadow spreads
                              blurRadius: 7, // How blurry the shadow is
                              offset: Offset(0,
                                  3), // Changes the position of the shadow (x, y)
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',

                              border: InputBorder.none, // Removes the underline
                              enabledBorder: InputBorder
                                  .none, // Removes the underline when the TextField is enabled
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        screenSize: screenSize,
                        text: 'Login',
                        onPressed: login,
                      ),
                      TextButton(
                        onPressed: () {
                          context.go("/signup");
                          // Navigate to the signup page
                        },
                        child: Text('Don\'t have an account? Sign up'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
