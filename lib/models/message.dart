import 'package:chatapp/customs/constants.dart';

class message {
  final String msg;
  final String id;
  message(this.msg, this.id);
  factory message.fromJson(jsondata) {
    return message(jsondata[kmsg], jsondata['id']);
  }
}
