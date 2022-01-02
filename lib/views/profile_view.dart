import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_failure_app_f/view_models/settings_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _settingsViewModel = SettingsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildPopIcon(),
          buildProfile(),
        ],
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

  Widget buildProfile() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(_settingsViewModel.profileImgUrl),
            radius: 50,
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              if (!snapshot.hasData) {
                return const Text(
                  '로그인 해 주세요',
                  style: TextStyle(fontSize: 15),
                );
              } else {
                return Text(
                  '${snapshot.data?.email}',
                  style: const TextStyle(fontSize: 20),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  // Widget _buildProfileMenu(){
  //   return ListView.builder(itemBuilder: itemBuilder)
  // }
}
