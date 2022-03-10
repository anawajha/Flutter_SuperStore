import 'package:flutter/material.dart';
import 'package:super_store/api/auth/forget_password_controller.dart';
import 'package:super_store/screens/auth/reset_password_screen.dart';
import 'package:super_store/utls/app_colors.dart';
import 'package:super_store/utls/helpers.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> with Helpers {
  late TextEditingController _emailController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
            'Forget password',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 8,),
          const Text(
            'Enter your email address to send reset password code',
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
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                label: Text(
                  'Email',
                  style: TextStyle(color: Colors.grey),
                ),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red))),
          ),
          const SizedBox(
            height: 45,
          ),
          ElevatedButton(
            onPressed: isLoading ? null : () async {
              setState(() {
                isLoading = true;
                forgetPassword();
              });
            },
            child: isLoading ?  const CircularProgressIndicator(color: AppColors.red,) : const Text(
              'SEND CODE',
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
    ));
  }

  bool validate() {
    return _emailController.text.isNotEmpty;
  }

  forgetPassword() async {
    if(validate()){
      bool codeSent = await ForgetPasswordController().forgetPassword(email: _emailController.text, context: context);
      if(codeSent){
        setState(() {
          isLoading = false;
        });
        //Navigator.pushReplacementNamed(context, '/reset_password_screen');
        Future.delayed(Duration(seconds: 1),(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen(email: _emailController.text,),));
        });
      }
      setState(() {
        isLoading = false;
      });
    }else{
      showSnackBar(context: context, message: 'Email is required',error: true);
      setState(() {
        isLoading = false;
      });
    }
  }


}
