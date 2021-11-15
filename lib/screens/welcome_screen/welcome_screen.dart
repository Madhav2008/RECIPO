import 'package:Foodybite/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  final List<String> introImage = ["assets/try1.png", "assets/try2.png", "assets/try3.png"];
  final List<String> titles = [
    "Learn",
    "Cook",
    "Serve",
  ];
  final List<String> subtitles = [
    "🌟 Learn Your Favourite Recipe 🌟",
    "🌟 Cook Your Favourite Recipe 🌟",
    "🌟 Serve Your Favourite Recipe 🌟"
  ];

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        // _ = true;
      });
    });
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.black87,
                  activeSize: 20.0,
                  color: Colors.black54
                )),
            itemCount: 3,
            itemBuilder: (context, index) {
              return IntroItem(
                imageUrl: introImage[index],
                title: titles[index],
                subtitle: subtitles[index],
                // bg: colors[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
              // child: Text("Skip", style: TextStyle(color: Colors.black, fontSize: 20.0),),
              icon:
              Icon(
                Icons.skip_next_sharp,
                size: 30,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon:
              Icon(
                _currentIndex == 2 ? Icons.arrow_forward_ios : Icons.arrow_forward_sharp,
                size: 30,
                color: Colors.black87,
              ),
              onPressed: () {
                if (_currentIndex != 2)
                  _controller.next();
                else
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class IntroItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final Color bg;

  const IntroItem({Key key, this.imageUrl, this.title, this.subtitle, this.bg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.redAccent,
            Color.fromRGBO(226, 55, 68, 0.80),
            Color.fromRGBO(226, 55, 68, 1.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      // color: bg ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    // color: Colors.black
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 20.0),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 40.0),
              Expanded(
                 child: Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Material(
                      elevation: 4.0,
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}