
import 'package:travelapp/models/user.dart';
import 'package:travelapp/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/user/src/ui/pages/home.dart';

class Wrapper extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user == null)
      return Authenticate();
    else
      return MyHomePage();
  }
}
