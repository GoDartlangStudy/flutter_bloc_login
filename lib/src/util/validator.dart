import 'dart:async';

class Validators {

  final StreamTransformer validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@') && email.contains('.')) {
     sink.add(email); 
    }else{
      sink.addError("Enter a valid email");
    }
  });

  final StreamTransformer validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    }else{
      sink.addError('Password needs to be at least 6 charaters');
    }
  });
}