import 'package:Foodybite/screens/category_screen/category_screen.dart';
import 'package:Foodybite/screens/home_screen/home_screen.dart';
import 'package:Foodybite/screens/post_recipe_screen/post_recipe_screen.dart';
import 'package:Foodybite/screens/profile_screen/profile_screen.dart';
import 'package:Foodybite/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final List<Widget>_tabItems = [HomeScreen(), CategoryScreen(), PostRecipeScreen(), SearchScreen(), ProfileScreen()];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height:50 ,
        items: [
          Icon(
            Icons.home_filled,
            size: 30,
            color: (_page == 0)?Colors.redAccent:Colors.white
          ),
          Icon(
            Icons.category_sharp,
            size: 30,
            color: (_page == 1)?Colors.redAccent:Colors.white
          ),
          Icon(
            Icons.add_box,
            size: 30,
            color: (_page == 2)?Colors.redAccent:Colors.white
          ),
          Icon(
            Icons.search_sharp,
            size: 30,
            color: (_page == 3)?Colors.redAccent:Colors.white
          ),
          Icon(
            Icons.account_circle,
            size: 30,
            color: (_page == 4)?Colors.redAccent:Colors.white
          ),
        ],
        color: Color.fromRGBO(226, 55, 68, 0.60),
        buttonBackgroundColor: Colors.grey[50],
        backgroundColor: Color.fromRGBO(226, 55, 68, 0.60),
        animationDuration: Duration(milliseconds: 500),
        onTap: (index){
          setState((){
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _tabItems[_page],
    );
  }
}