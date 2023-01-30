import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:receipies/ui/homePage.dart';
import 'package:receipies/ui/searchPage.dart';
import 'package:receipies/ui/settingsPage.dart';
import 'package:receipies/ui/test.dart';
import 'package:receipies/ui/categoryPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // initialRoute:
      // FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/home',
      // routes: {
      //   '/sign-in': (context) {
      //     return SignInScreen(
      //       providers: providers,
      //       actions: [
      //         AuthStateChangeAction<SignedIn>((context, state) {
      //           Navigator.pushReplacementNamed(context, '/profile');
      //         }),
      //       ],
      //     );
      //   },
      //   '/profile': (context) {
      //     return ProfileScreen(
      //       providers: providers,
      //       actions: [
      //         SignedOutAction((context) {
      //           Navigator.pushReplacementNamed(context, '/sign-in');
      //         }),
      //       ],
      //     );
      //   },
      //   "/home": (context) {
      //     return const HomePage();
      //   }
      // },
    );
  }
}
