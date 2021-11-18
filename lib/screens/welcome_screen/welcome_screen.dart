// import 'package:Foodybite/screens/login_screen/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({Key key}) : super(key: key);
//
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> {
//   SwiperController _controller = SwiperController();
//   int _currentIndex = 0;
//   final List<String> introImage = [
//     "https://raw.githubusercontent.com/Madhav2008/App-Assets/main/try1.png",
//     "https://raw.githubusercontent.com/Madhav2008/App-Assets/main/try2.png",
//     "https://raw.githubusercontent.com/Madhav2008/App-Assets/main/try3.png"
//   ];
//   final List<String> titles = [
//     "Learn",
//     "Cook",
//     "Serve",
//   ];
//   final List<String> subtitles = [
//     "🌟 Learn Your Favourite Recipe 🌟",
//     "🌟 Cook Your Favourite Recipe 🌟",
//     "🌟 Serve Your Favourite Recipe 🌟"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(milliseconds: 1000), () {
//       setState(() {
//         // _ = true;
//       });
//     });
//     return Scaffold(
//       body: Stack(
//         children: [
//           Swiper(
//             loop: false,
//             index: _currentIndex,
//             onIndexChanged: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             controller: _controller,
//             pagination: SwiperPagination(
//                 builder: DotSwiperPaginationBuilder(
//                     activeColor: Colors.black87,
//                     activeSize: 20.0,
//                     color: Colors.black54)),
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               return IntroItem(
//                 imageUrl: introImage[index],
//                 title: titles[index],
//                 subtitle: subtitles[index],
//                 // bg: colors[index],
//               );
//             },
//           ),
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: IconButton(
//               icon: Icon(
//                 Icons.skip_next_sharp,
//                 size: 30,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.pushReplacement(context,
//                     MaterialPageRoute(builder: (context) => LoginScreen()));
//               },
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: IconButton(
//               icon: Icon(
//                 _currentIndex == 2
//                     ? Icons.arrow_forward_ios
//                     : Icons.arrow_forward_sharp,
//                 size: 30,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 if (_currentIndex != 2)
//                   _controller.next();
//                 else
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => LoginScreen()));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class IntroItem extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String subtitle;
//   final Color bg;
//
//   const IntroItem({Key key, this.imageUrl, this.title, this.subtitle, this.bg})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Colors.redAccent[100],
//             Colors.redAccent[200],
//           ],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       // color: bg ?? Theme.of(context).primaryColor,
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               const SizedBox(height: 40),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 37.0,
//                   // color: Colors.black
//                 ),
//               ),
//               if (subtitle != null) ...[
//                 const SizedBox(height: 20.0),
//                 Text(
//                   subtitle,
//                   style: TextStyle(fontSize: 18.0),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//               const SizedBox(height: 40.0),
//               Expanded(
//                 child: Container(
//                   margin: const EdgeInsets.only(bottom: 70),
//                   width: double.infinity,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20.0),
//                     // child: Material(
//                     // color: Colors.transparent,
//                     // elevation: 4.0,
//                     child: Image.network(
//                       imageUrl,
//                       fit: BoxFit.cover,
//                     ),
//                   // ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:Foodybite/screens/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'description_text.dart';
import 'model.dart';
import 'title_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

PageController _pageController = PageController();
int selectedPage = 0;

nexPage() {
  _pageController.nextPage(
    duration: const Duration(milliseconds: 200),
    curve: Curves.ease,
  );
}

jumpPage() {
  _pageController.jumpToPage(2);
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    selectedPage = value;
                  });
                },
                itemCount: onboardong.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.black,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: size.height * 0.4,
                          child: Image.network(
                            'https://raw.githubusercontent.com/Madhav2008/App-Assets/main/RecipoLogo.png',
                          // child: Image.asset(
                          //   onboardong[index].imageAsset,
                            width: size.width * 0.7,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0, right: 10.0),
                            child: TitleTextWidget(
                              size: size,
                              index: index,
                              name: onboardong[index].title,
                            ),
                          ),
                        ),
                        // ),
                        DescriptionTextWidget(
                          size: size,
                          index: index,
                          description: onboardong[index].description,
                        ),
                      ],
                    ),
                  );
                },
              ),
               Padding(
                 padding: const EdgeInsets.only(top: 8.0, left: 18.0, bottom: 18.0),
                 child: Align(
                  alignment: Alignment.topLeft,
                  // child: Image.network(
                  //   'https://raw.githubusercontent.com/Madhav2008/App-Assets/main/Logo2Recipo.png',
                    child: Text(
                      'Recipo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.09,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  // ),
                  ),
              ),
               ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        onboardong.length,
                            (index) => AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 800,
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedPage == index
                                ? Colors.white
                                : Colors.white.withOpacity(.5),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (selectedPage == onboardong.length - 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        } else {
                          nexPage();
                        }
                      },
                      child: Icon(
                        selectedPage == 2
                        ? Icons.arrow_forward_ios
                        : Icons.arrow_forward_sharp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}