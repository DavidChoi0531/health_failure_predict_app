import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_failure_app_f/services/email_login_api.dart';
import 'package:health_failure_app_f/view_models/settings_view_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final SettingsViewModel _settingsViewModel = SettingsViewModel();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildTop(),
        buildList(),
      ],
    );
  }

  Widget buildTop() {
    return GestureDetector(
      onTap: () {
        _settingsViewModel.profileButtonAction(context);
      },
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(_settingsViewModel.profileImgUrl),
                      radius: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        child: StreamBuilder(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: (BuildContext context,
                              AsyncSnapshot<User?> snapshot) {
                            if (!snapshot.hasData) {
                              return const Text(
                                '로그인 해 주세요',
                                style: TextStyle(fontSize: 15),
                              );
                            } else {
                              return Text(
                                '${snapshot.data?.email}',
                                style: const TextStyle(fontSize: 15),
                              );
                            }
                          },
                        ),
                        width: constraints.maxWidth - 170,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            EmailLoginApi emailLoginApi = EmailLoginApi();
            emailLoginApi.signOut();
          },
          child: const Text('logout'),
        )
      ],
    );
  }
}
