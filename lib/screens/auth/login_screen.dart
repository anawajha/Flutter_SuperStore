import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:super_store/api/auth/user_login_controller.dart';
import 'package:super_store/utls/helpers.dart';
import '../../utls/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TapGestureRecognizer _register;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _register = TapGestureRecognizer()..onTap = navigateToRegisterScreen;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _register.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            const Divider(
              thickness: 0,
              color: Colors.transparent,
            ),
            Image.asset('assets/images/logo_black.png'),
            const Spacer(
              flex: 1,
            ),
            const Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const Text(
              'Sign up to get started and experience\ngreat shopping deals',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  label: Text(
                    'Username',
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.red))),
            ),
            const SizedBox(
              height: 31,
            ),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                  label: Text(
                    'Password',
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.red))),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                alignment: AlignmentDirectional.bottomEnd,
                child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      text: 'Forget password?',
                      recognizer: _register,
                    ))),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () async {
                await performLogin();
              },
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.white),
                    ),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                  primary: AppColors.red,
                  onPrimary: Colors.white.withOpacity(0.5)),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }

  void navigateToRegisterScreen() {
    Navigator.pushNamed(context, '/forget_password_screen');
  }

  bool checkData() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      return true;
    }else{
        setState(() {
      isLoading = false;
    });
    return false;
    }
  }

  performLogin() async {
    if (checkData()) {
      bool loggedIn = await UserLoginController().login(
          email: _emailController.text,
          password: _passwordController.text,
          context: context);
      if (loggedIn) {
        Navigator.pushReplacementNamed(context, '/home_screen');
      }
      setState(() {
        isLoading = false;
      });
    }
    showSnackBar(
        context: context, message: 'Some filed are missing', error: true);
  }
}
