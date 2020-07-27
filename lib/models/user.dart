import 'dart:io';
class User{

  final String uid;

  User({this.uid});
}

class UserData{

   String profileimage;
   String firstName;
   String lastName;
   String emailId;
   String mobileNumber;
   String password;

  UserData({this.profileimage,this.firstName, this.lastName, this.emailId,this.mobileNumber,this.password});
}