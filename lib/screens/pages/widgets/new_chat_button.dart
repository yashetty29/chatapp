import 'package:flutter/material.dart';
import 'package:chatapp/screens/search_screen.dart';

class NewChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add,
        color: Colors.white,
        size: 25,
      ),
        onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
        )); 
  }
}
