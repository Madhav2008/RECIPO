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
                        ClipRRect(
                          child: Image.asset(
                            onboardong[index].imageAsset,
                            width: size.width * 0.6,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 50.0, right: 10.0),
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
                padding:
                    const EdgeInsets.only(top: 2.0, left: 18.0, bottom: 18.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.network(
                    'https://raw.githubusercontent.com/Madhav2008/App-Assets/main/Logo4Recipo.png',
                    width: 120,
                    height: 120,
                    // child: Text(
                    //   'Recipo',
                    // style: TextStyle(
                    //   color: Colors.white,
                    //   fontSize: size.width * 0.09,
                    //   fontWeight: FontWeight.bold,
                    //   fontStyle: FontStyle.italic,
                    // ),
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
                          fontSize: size.width * 0.05,
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
                        size: 30,
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
