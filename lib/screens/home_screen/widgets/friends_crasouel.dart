import 'package:Foodybite/models/users.dart';
import 'package:flutter/material.dart';

class FriendsCaresoul extends StatelessWidget {
  const FriendsCaresoul({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          Users user = users[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profileScreen', arguments: {
                'name': user.name,
                'imageUrl': user.imageUrl,
                'following': user.following.toString(),
                'follower': user.follower.toString(),
                'email': user.email,
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(user.imageUrl),
                radius: 35.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
