import 'package:Foodybite/screens/category_screen/category_screen.dart';
import 'package:Foodybite/screens/home_screen/home_screen.dart';
import 'package:Foodybite/screens/post_recipe_screen/post_recipe_screen.dart';
import 'package:Foodybite/screens/profile_screen/profile_screen.dart';
import 'package:Foodybite/screens/search_screen/search_screen.dart';
import 'package:Foodybite/screens/like_button.dart';
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
            Icons.home,
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
        // animationCurve:Curves.easeIn,
        animationDuration: Duration(milliseconds: 1000),
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

// import 'package:Foodybite/screens/category_screen/category_screen.dart';
// import 'package:Foodybite/screens/home_screen/home_screen.dart';
// import 'package:Foodybite/screens/post_recipe_screen/post_recipe_screen.dart';
// import 'package:Foodybite/screens/profile_screen/profile_screen.dart';
// import 'package:Foodybite/screens/search_screen/search_screen.dart';
// import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
// import 'package:flutter/material.dart';
//
// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   _BottomNavigationState createState() => _BottomNavigationState();
// }
//
// class _BottomNavigationState extends State<BottomNavigation> {
//   int _currentIndex = 0;
//
//   void changeIndex(int index) {
//     setState(() {
//       _currentIndex = index;
//       if (index == 1) {
//         Navigator.pushNamed(context, "/homeScreen");
//       }
//       // if (index == 2) {
//       //   Navigator.pushNamed(context, CategoryScreen());
//       // }
//       // if (index == 3) {
//       //   Navigator.pushNamed(context, PostRecipeScreen());
//       // }
//       // if (index == 4) {
//       //   Navigator.pushNamed(context, SearchScreen());
//       // }
//       // if (index == 5) {
//       //   Navigator.pushNamed(context, ProfileScreen());
//       // }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BubbleBottomBar(
//       opacity: .2,
//       currentIndex: _currentIndex,
//       onTap: changeIndex,
//       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       elevation: 8,
//       fabLocation: BubbleBottomBarFabLocation.end, //new
//       hasNotch: true, //new
//       hasInk: true, //new, gives a cute ink effect
//       items: <BubbleBottomBarItem>[
//         BubbleBottomBarItem(
//             backgroundColor: Colors.blue,
//             icon: Icon(
//               Icons.dashboard_outlined,
//               color: Colors.blue,
//             ),
//             activeIcon: Icon(
//               Icons.dashboard_outlined,
//               color: Colors.blue,
//             ),
//             title: Text("Home")),
//         BubbleBottomBarItem(
//             backgroundColor: Colors.deepPurple,
//             icon: Icon(
//               Icons.bookmark_border_outlined,
//               color: Colors.blue,
//             ),
//             activeIcon: Icon(
//               Icons.bookmark_border_outlined,
//               color: Colors.deepPurple,
//             ),
//             title: Text("Saved")),
//         BubbleBottomBarItem(
//             backgroundColor: Colors.indigo,
//             icon: Icon(
//               Icons.notifications_none_outlined,
//               color: Colors.blue,
//             ),
//             activeIcon: Icon(
//               Icons.notifications_none_outlined,
//               color: Colors.indigo,
//             ),
//             title: Text("Notification")),
//         BubbleBottomBarItem(
//             backgroundColor: Colors.green,
//             icon: Icon(
//               Icons.supervised_user_circle_outlined,
//               color: Colors.blue,
//             ),
//             activeIcon: Icon(
//               Icons.supervised_user_circle_outlined,
//               color: Colors.green,
//             ),
//             title: Text("User"))
//       ],
//     );
//   }
// }