
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/models/coffe_model.dart';
import 'package:travelapp/models/user.dart';

class DatabaseService{

  final String uid;

  DatabaseService({ this.uid });
  final CollectionReference Collection = Firestore.instance.collection('user');


  Future updateData(userData) async {

    UserData userdata  = userData;
    return await Collection.document(uid).setData({
      'firstName':userdata.firstName,
      'lastName':userdata.lastName,
      'emailId':userdata.emailId,
      'mobileNumber':userdata.mobileNumber,
      'profileImage':userdata.profileimage
    });

  }

  //user data from snapshot

  UserData userDataFromSnapshot(DocumentSnapshot snapshot){
    print(snapshot.data['firstName']);
    return UserData(
      firstName: snapshot.data['firstName'],
        lastName: snapshot.data['lastName'],
        emailId: snapshot.data['emailId'],
        mobileNumber: snapshot.data['mobileNumber'],
        profileimage: snapshot.data['profileImage']
    );
  }


  Stream<UserData> get getData{

    return Collection.document(uid).snapshots().map(userDataFromSnapshot);
  }
}


//get user doc stream
