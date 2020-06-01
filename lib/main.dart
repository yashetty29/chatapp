import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatapp/provider/image_upload_provider.dart';
import 'package:chatapp/provider/user_provider.dart';
import 'package:chatapp/resources/auth_method.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/pages/widgets/user_circle.dart';
import 'package:chatapp/screens/search_screen.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
   final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImageUploadProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child:MaterialApp(
      title: "chatapp",
      theme: new ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/search_screen': (context) => SearchScreen(),
        '/menu_screen': (context) => UserCircle(),
      },
      home: FutureBuilder(
        future: _authMethods.getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    ));
  }
}