import 'package:travelapp/models/user.dart';
import 'package:travelapp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthServices {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user object

  User _userFromFirebaseUser(FirebaseUser user){
    
      return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream

  Stream<User> get user {

    return _auth.onAuthStateChanged.map((FirebaseUser firebaseUser) => _userFromFirebaseUser(firebaseUser));
  }
  //sign  in anon

  Future signInAnon() async{

    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in using email and password

  Future signInWithEmailAndPassword(user) async {
    UserData userData = user;
    try{
      AuthResult result = await  _auth.signInWithEmailAndPassword(email: userData.emailId, password: userData.password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register in using email & password
  Future registerEmailAndPassword(user) async {
    UserData userData = user;
    try{
        AuthResult result = await  _auth.createUserWithEmailAndPassword(email: userData.emailId, password: userData.password);
        FirebaseUser user = result.user;

        await DatabaseService(uid: user.uid).updateData(userData);
        return _userFromFirebaseUser(user);
    }catch(e){
        print(e.toString());
        return null;
    }
  }
  //sign out

  Future signOut() async{

    try{
      return _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}