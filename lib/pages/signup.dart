// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/main.dart';
import 'package:instagram/pages/home_page.dart';
import 'package:instagram/pages/login.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    storeClass.getStorage();
    GlobalKey<FormState> formKey = GlobalKey();
    final TextEditingController idController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Instagram',
              style: GoogleFonts.grandHotel(
                  color: Colors.black,
                  fontSize: 65,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Phone no is required!';
                        } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                            .hasMatch(value)) {
                          return 'Enter a valid phone number';
                        } else {
                          return null;
                        }
                      },
                      controller: idController,
                      decoration: inputDeco('Phone Number'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required!';
                          } else if (!(value.length >= 6)) {
                            return 'Password must have atleast 6 letters';
                          } else {
                            return null;
                          }
                        },
                        controller: passController,
                        decoration: inputDeco('Password')),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Already Have Account?',
                    style: GoogleFonts.nunito(
                        color: const Color(0xff059CF6),
                        fontSize: 18,
                        letterSpacing: -.5,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await storeClass.store!
                              .setString('username', idController.text.trim());
                          await storeClass.store!.setString(
                              'password', passController.text.trim());

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage()));
                        }
                      },
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        backgroundColor: const Color(0xFF58CBFD), // foreground
                      ),
                      child: Text(
                        'Register',
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

InputDecoration inputDeco(String hint) {
  return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      contentPadding: const EdgeInsets.all(15),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Color(0xFFD00909), width: .8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Color(0xFFD00909), width: .8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Color(0xFFA8A8A8), width: .8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: const BorderSide(color: Color(0xFFA8A8A8), width: .8),
      ),
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ));
}
