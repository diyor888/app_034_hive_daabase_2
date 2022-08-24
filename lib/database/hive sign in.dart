import 'package:hive/hive.dart';
import '../models/sign in model.dart';

class Hive_db_SI {
  var box_si = Hive.box("userdatabase");

  // database ga obyekt saqlash
  void add_si(SignIn signIn) {
    box_si.put("signIn", signIn.toJson());
  }

  // database dan obyektni olamiz
  SignIn get_obj_si() {
    SignIn si = new SignIn.fromJson(box_si.get("signIn"));
    return si;
  }

  // database dan obyektni o'chirish
  void remove_si () {
    box_si.delete("signIn");
  }
}
