import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_failure_app_f/services/email_login_api.dart';

class UserInfoProvider with ChangeNotifier {
  String _uid = '로그인 해 주세요';

  String get uid => _uid;

  UserInfoProvider();

  emailLogin(BuildContext context, String email, String password) {
    EmailLoginApi emailLoginApi = EmailLoginApi();
    emailLoginApi.emailSignIn(email, password).then(
      (value) {
        if (value == 1) {
          if (FirebaseAuth.instance.currentUser != null) {
            _uid = FirebaseAuth.instance.currentUser!.email!;
          }
          notifyListeners();
          Navigator.of(context).pop();
        } else if (value == 0) {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text('사용자를 찾을 수 없습니다.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('확인'),
                )
              ],
            ),
          );
        } else if (value == -1) {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text('비밀번호가 틀렸습니다.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('확인'),
                )
              ],
            ),
          );
        } else {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text('오류'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('확인'),
                )
              ],
            ),
          );
        }
      },
    );
  }

  emailSignUp(BuildContext context, String email, String password) {
    EmailLoginApi emailLoginApi = EmailLoginApi();
    emailLoginApi.emailAccountReg(email, password).then((value) {
      if (value == 2) {
        if (FirebaseAuth.instance.currentUser != null) {
          _uid = FirebaseAuth.instance.currentUser!.email!;
        }
        notifyListeners();
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text('회원가입이 완료 되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('확인'),
              )
            ],
          ),
        );
      } else if (value == 1) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text('패스워드 오류'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('확인'),
              )
            ],
          ),
        );
      } else if (value == 0) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text('사용중인 이메일 입니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('확인'),
              )
            ],
          ),
        );
      } else {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text('오류'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('확인'),
              )
            ],
          ),
        );
      }
    });
  }

  signOut() {
    EmailLoginApi emailLoginApi = EmailLoginApi();
    emailLoginApi.signOut().then((value) => {
          if (value == 1) {_uid = '로그인 해 주세요'}
        });
    notifyListeners();
  }
}
