import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nhom6_shopping_app/Screens/Login/components/background.dart';
import 'package:nhom6_shopping_app/Screens/Signup/signup_screen.dart';
import 'package:nhom6_shopping_app/components/already_have_an_account_check.dart';
import 'package:nhom6_shopping_app/components/rounded_button.dart';
import 'package:nhom6_shopping_app/components/rounded_input_field.dart';
import 'package:nhom6_shopping_app/components/rounded_password_field.dart';
import 'package:nhom6_shopping_app/components/text_field_container.dart';
import 'package:nhom6_shopping_app/constants.dart';
import 'package:nhom6_shopping_app/pages/root_app.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "You Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RootApp();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
