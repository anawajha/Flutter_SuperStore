import 'package:flutter/material.dart';
import 'package:super_store/api/auth/reset_password_controller.dart';
import 'package:super_store/utls/helpers.dart';
import 'package:super_store/widgets/code_text_field_widget.dart';

import '../../utls/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> with Helpers{

  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _firstController;
  late TextEditingController _secondController;
  late TextEditingController _thirdController;
  late TextEditingController _fourthController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  bool isLoading = false;
  late String? _code;

  @override
  void initState() {
    super.initState();
    _firstController = TextEditingController();
    _secondController = TextEditingController();
    _thirdController = TextEditingController();
    _fourthController = TextEditingController();

    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

   _firstFocusNode = FocusNode();
   _secondFocusNode = FocusNode();
   _thirdFocusNode = FocusNode();
   _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(27.0),
            children: [
              const SizedBox(height: 50,),
              const Divider(
                thickness: 0,
                color: Colors.transparent,
              ),
              Image.asset('assets/images/logo_black.png'),
              const SizedBox(height: 50,),
              const Text(
                'Reset password',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 8,),
              const Text(
                'Enter the code has been sent to your email address\n & new password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CodeTextField(
                      controller: _firstController,
                      focusNode: _firstFocusNode,
                  onChanged: (value){
                        if(value.isNotEmpty) {
                          _secondFocusNode.requestFocus();
                        } else {
                          _firstFocusNode.requestFocus();
                        }
                  },),
                  const SizedBox(width: 15,),
                  CodeTextField(
                      controller: _secondController,
                      focusNode: _secondFocusNode,
                  onChanged: (value){
                        if(value.isNotEmpty) {
                          _thirdFocusNode.requestFocus();
                        } else {
                          _firstFocusNode.requestFocus();
                        }
                  },),
                  const SizedBox(width: 15,),
                  CodeTextField(
                      controller: _thirdController,
                      focusNode: _thirdFocusNode,
                  onChanged: (value){
                        if(value.isNotEmpty) {
                          _fourthFocusNode.requestFocus();
                        } else {
                          _secondFocusNode.requestFocus();
                        }
                  },),
                  const SizedBox(width: 15,),
                  CodeTextField(
                      controller: _fourthController,
                      focusNode: _fourthFocusNode,
                  onChanged: (value){
                        if(value.isEmpty) _thirdFocusNode.requestFocus();
                  },),
                ],
              ),
              const SizedBox(height: 50,),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                    label: Text(
                      'New password',
                      style: TextStyle(color: Colors.grey),
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.red))),
              ),
              const SizedBox(height: 25,),
              TextField(
                controller: _confirmPasswordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                    label: Text(
                      'Confirm password',
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
                onPressed: isLoading ? null : () {
                  setState(() {
                    isLoading = true;
                     performResetPassword();
                  });
                },
                child: isLoading ?  const CircularProgressIndicator(color: AppColors.red,) : const Text(
                  'RESET',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52),
                    primary: AppColors.red,
                    onPrimary: Colors.white.withOpacity(0.5)),
              ),
              const SizedBox(height: 100,)
            ],
          ),
        );
  }

  bool passwordMatcher(){
    if(_passwordController.text.isNotEmpty && _confirmPasswordController.text.isNotEmpty) {
      if(_passwordController.text == _confirmPasswordController.text){
        return true;
      }else {
        setState(() {
          isLoading = false;
        });
        showSnackBar(context: context, message: 'The two passwords does\'nt mach' ,error: true);
        return false;
      }
    }else{
      setState(() {
        isLoading = false;
      });
      showSnackBar(context: context, message: 'Password can\'nt be empty',error: true);
      return false;
    }
  }

  bool checkData(){
    if(_firstController.text.isNotEmpty && _secondController.text.isNotEmpty && _thirdController.text.isNotEmpty && _fourthController.text.isNotEmpty){
      _code = _firstController.text + _secondController.text + _thirdController.text + _fourthController.text;
      if(passwordMatcher()) return true;
      else return false;
     // return true;
    }else{
      showSnackBar(context: context, message: 'Invalid code',error: true);
      setState(() {
        isLoading = false;
      });
      return false;
    }
  }

  performResetPassword() async {
    if(checkData()){
      print('code :${_code!}');
      bool isReset = await ResetPasswordController().resetPassword(email: widget.email, code: _code!, password: _passwordController.text, context: context);
      if(isReset) {
        Navigator.pop(context);
        setState(() {
          isLoading = false;
        });
      }else setState(() {
        isLoading = false;
      });
    }
  }

}


