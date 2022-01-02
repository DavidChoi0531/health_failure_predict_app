import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_failure_app_f/views/profile_view.dart';


class SettingsViewModel {
  late String profileImgUrl;

  SettingsViewModel() {
    profileImgUrl = 'lib/images/default_profile.png';
  }

  profileButtonAction(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      Navigator.pushNamed(context, '/signIn');
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfileView()));
    }
  }
}
