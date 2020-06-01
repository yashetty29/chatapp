import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:chatapp/enum/user_state.dart';
import 'package:chatapp/provider/user_provider.dart';
import 'package:chatapp/resources/auth_method.dart';
import 'package:chatapp/screens/call_screen/pickup/pickup_layout.dart';
import 'package:chatapp/screens/pages/camera.dart';
import 'package:chatapp/screens/pages/chat_list_screen.dart';
import 'package:chatapp/screens/pages/status.dart';
import 'package:chatapp/screens/pages/widgets/user_circle.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  UserProvider userProvider;

  final AuthMethods _authMethods = AuthMethods();

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    String currentUserId =
        (userProvider != null && userProvider.getUser != null)
            ? userProvider.getUser.uid
            : "";

    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        currentUserId != null
            ? _authMethods.setUserState(
                userId: currentUserId, userState: UserState.Online)
            : print("resume state");
        break;
      case AppLifecycleState.inactive:
        currentUserId != null
            ? _authMethods.setUserState(
                userId: currentUserId, userState: UserState.Offline)
            : print("inactive state");
        break;
      case AppLifecycleState.paused:
        currentUserId != null
            ? _authMethods.setUserState(
                userId: currentUserId, userState: UserState.Waiting)
            : print("paused state");
        break;
      case AppLifecycleState.detached:
        currentUserId != null
            ? _authMethods.setUserState(
                userId: currentUserId, userState: UserState.Offline)
            : print("detached state");
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.refreshUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Chat",
              style: TextStyle(fontSize: 30),
            ),
            elevation: 0.7,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.camera_alt)),
                Tab(text: "CHATS"),
                Tab(text: "STATUS"),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/search_screen");
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
              ),
              UserCircle(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              CameraApp(),
              ChatListScreen(),
              Status(),
            ],
          ),
        ),
      ),
    );
  }
}