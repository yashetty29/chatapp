import 'package:flutter/material.dart';
import 'package:chatapp/screens/pages/widgets/user_details_container.dart';

class UserCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     return GestureDetector(
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        builder: (context) => UserDetailsContainer(),
      ),
      child: Container(
      height: 0,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.blue[300],
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.person),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.black, width: 1),
                  color: Colors.green[500]),
            ),
          )
        ],
      ),
    ));
  }
}