import 'package:flutter/material.dart';
import 'package:flutter_bloc_login/src/bloc/authorization_bloc.dart';
import 'package:flutter_bloc_login/src/screen//login_screen.dart';
import 'package:flutter_bloc_login/src/screen/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    authBloc.restoreSession();

    return MaterialApp(
      title: 'Login Demo Bloc',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: createContent(),
    );
  }

  Widget createContent() {
    return StreamBuilder<bool> (
      stream: authBloc.isSessionValid,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if(snapshot.hasData && snapshot.data) {
          return HomeScreen();
        }else{
          return LoginScreen();
        }
      }
    );
  }
}