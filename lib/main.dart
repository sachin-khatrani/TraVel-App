import 'package:travelapp/models/user.dart';
import 'package:travelapp/screens/home/user/src/ui/pages/add_card.dart';
import 'package:travelapp/screens/home/user/src/ui/pages/add_payment_method.dart';
import 'package:travelapp/screens/home/user/src/ui/pages/help.dart';
import 'package:travelapp/screens/home/user/src/ui/pages/payment.dart';
import 'package:travelapp/screens/home/user/src/ui/pages/select_issue.dart';
import 'package:travelapp/screens/home/user/src/ui/pages/your_trips.dart';
import 'package:travelapp/screens/wrapper.dart';
import 'package:travelapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
    @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServices().user,
      child: MaterialApp(
        routes: {
          '/payment': (context) => PaymentPage(),
          '/add_payment': (context) => AddPaymentMethodPage(),
          '/add_card': (context) => AddCardPage(),
          '/your_trip': (context) => YourTripPage(),
          '/select_issue': (context) => SelectIssuePage(),
          '/help': (context) => HelpPage(),
        },
        home: Wrapper(),
      ),
    );
  }

}
