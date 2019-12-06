import 'package:flutter_bloc_login/src/bloc/authorization_bloc.dart';

class HomeBloc {
  logoutUser() {
    authBloc.closeSession();
  }
}