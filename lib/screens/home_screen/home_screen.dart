import 'package:Foodybite/screens/view_all_recent_recipes/view_all_recent_recipes.dart';
import 'package:Foodybite/widgets/card.dart';
import 'package:Foodybite/widgets/text_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key key}) : super(key: key);

   @override
   _HomeScreenState createState() => _HomeScreenState();
 }

 class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.network(
            "https://raw.githubusercontent.com/Madhav2008/App-Assets/main/Logo3Recipo.png",
            width: 110,
            height: 110,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Recipo',
                applicationVersion: 'by Madhav Arora\n\nV1.0',
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          HomeScreenTop(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Recent Recipes",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w700)),
                Spacer(),
                Builder(
                  builder: (BuildContext context) => TextSimpleButton(
                    title: "View All",
                    colors: Colors.lightBlue,
                    onPress: () async{
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewAllRecentRecipesScreen()
                          )
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
            horizontal: 19.0,
            vertical: 15.0,
          ),
          child: StyleCard(
            rate: '10',
            title: 'Happy Bones',
            isOpen: 'OPEN',
            category: 'Italian',
            image: "assets/images/Register.png",
            about: 'Lorem Ipsum is simply dummy text',
            size: MediaQuery.of(context).size.width * 0.91,
            onPress: (){
              Navigator.pushNamed(context, '/DetailScreen');
            }
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreenTop extends StatefulWidget {
  @override
  _HomeScreenTopState createState() => _HomeScreenTopState();
}

class _HomeScreenTopState extends State<HomeScreenTop> {
  final TextStyle bigWhite = TextStyle(color: Colors.white, fontSize: 16);
  final TextStyle bigBlack = TextStyle(color: Colors.black, fontSize: 18);
  var selected = 0;
  bool isRecentSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(226, 55, 68, 0.60),
              Color.fromRGBO(226, 55, 68, 0.60),
              Color.fromRGBO(226, 55, 68, 0.60),
              Color.fromRGBO(226, 55, 68, 0.60),
            ])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      PopupMenuButton(
                        onSelected: (dynamic index) {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: 280,
                    child: Text(
                      "What Do You Want To Eat ?",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      cursorColor: Theme.of(context).primaryColor,
                      style: bigBlack,
                      decoration: InputDecoration(
                          hintText: 'Search Your Recipe',
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(Icons.search, color: Colors.grey),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          setState(() {
                            isRecentSelected = true;
                          });
                        },
                        child: ChoiceChip(
                            Icons.timer, "Recent", isRecentSelected)),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isRecentSelected = false;
                          });
                        },
                        child: ChoiceChip2(Icons.favorite_sharp, "Most Liked",
                            !isRecentSelected)),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isRecentSelected;

  ChoiceChip(this.icon, this.text, this.isRecentSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: widget.isRecentSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.all(Radius.circular(20)))
          : null,
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 14))
        ],
      ),
    );
  }
}

class ChoiceChip2 extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isRecentSelected;

  ChoiceChip2(this.icon, this.text, this.isRecentSelected);

  @override
  _ChoiceChip2State createState() => _ChoiceChip2State();
}

class _ChoiceChip2State extends State<ChoiceChip2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: widget.isRecentSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.all(Radius.circular(20)))
          : null,
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 14))
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var firstControlPoint = Offset(size.width / 4, size.height - 53);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondEndPoint = Offset(size.width, size.height - 90);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 14);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}