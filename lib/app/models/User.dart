import 'package:encrypt/encrypt.dart';

class User{
  User({required this.firstName, required this.lastName, required this.username, required this.email, required this.password, required this.profileImage});
  User.concealedUser(
      {
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.profileImage
      }
  );
  final String firstName;
  final String lastName;
  final String username;
  String? email;
  Encrypted? password;
  final String profileImage;

}