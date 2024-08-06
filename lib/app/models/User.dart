import 'package:encrypt/encrypt.dart';

class User{
  User({required this.firstName, required this.lastName, required this.username, required this.email, required this.password});
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final Encrypted password;

}