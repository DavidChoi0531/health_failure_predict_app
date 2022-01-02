import 'package:flutter/material.dart';
import 'package:health_failure_app_f/services/email_login_api.dart';
import 'package:health_failure_app_f/services/google_login_api.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            buildPopIcon(),
            const SizedBox(
              height: 50,
            ),
            buildTitle(),
            const SizedBox(
              height: 20,
            ),
            buildLoginForm(),
            buildSnsLogin(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPopIcon() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return const Text(
      '로그인',
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.email,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _emailController,
                    autocorrect: false,
                    autofocus: false,
                    decoration: const InputDecoration(
                      hintText: 'example@example.com',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black38,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return '이메일을 입력하세요';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.lock_open,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _passwordController,
                    autocorrect: false,
                    autofocus: false,
                    decoration: const InputDecoration(
                      hintText: 'Input Password',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black38,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return '비밀번호를 입력하세요';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                String email = _emailController.text;
                String password = _passwordController.text;
                EmailLoginApi emailLoginApi = EmailLoginApi();
                emailLoginApi.emailSignIn(email, password);
                Navigator.of(context).pop();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInView()),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '회원가입',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSnsLogin() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoogleLoginApi googleLoginApi = GoogleLoginApi();
            googleLoginApi
                .googleSignIn()
                .then((value) => Navigator.of(context).pop());
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Expanded(
              child: Image.asset(
                  'lib/images/btn_google_signin_light_normal_web@2x.png'),
            ),
          ),
        ),
      ],
    );
  }
}
