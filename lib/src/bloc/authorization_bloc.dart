import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationBloc {
  final String _key = 'token';
  final PublishSubject _isSessionValid = PublishSubject<bool>();

  String _tokenString;
  Observable<bool> get isSessionValid => _isSessionValid.stream;

  void dispose() {
    _isSessionValid.close();
  }

  void openSession(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token);
    _tokenString = token;
    _isSessionValid.sink.add(true);
  }


  void closeSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_key);
    _isSessionValid.sink.add(false);
  }

  void restoreSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.get(_key);
    if (_tokenString != null && _tokenString.length > 0) {
      _isSessionValid.sink.add(true);
    }else{
      _isSessionValid.sink.add(false);
    }
  }
}

final authBloc = AuthorizationBloc();