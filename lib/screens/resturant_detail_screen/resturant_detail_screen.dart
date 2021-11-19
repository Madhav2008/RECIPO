import 'dart:ui';
import 'package:Foodybite/models/resturants.dart';
import 'package:Foodybite/screens/resturant_detail_screen/widgets/head_image.dart';
import 'package:Foodybite/screens/resturant_detail_screen/widgets/icon_box.dart';
import 'package:Foodybite/screens/resturant_detail_screen/widgets/menu_and_photo_crasouel.dart';
import 'package:Foodybite/screens/resturant_detail_screen/widgets/open_time_text.dart';
import 'package:Foodybite/screens/resturant_detail_screen/widgets/review_list.dart';
import 'package:Foodybite/widgets/row_title_carsoul.dart';
import 'package:Foodybite/widgets/small_tag.dart';
import 'package:Foodybite/widgets/small_text_box.dart';
import 'package:Foodybite/widgets/sticky_button.dart';
import 'package:flutter/material.dart';

class ResturantDetailScreen extends StatefulWidget {
  const ResturantDetailScreen({Key key, this.resturants}) : super(key: key);
  final Resturants resturants;

  @override
  _ResturantDetailScreenState createState() => _ResturantDetailScreenState();
}

class _ResturantDetailScreenState extends State<ResturantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StickyButton(
        title: 'Rate Your Experience',
        onPress: () {
          Navigator.pushNamed(context, '/reviewScreen');
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                HeadImage(
                  image: widget.resturants.imageUrl,
                ),
                Positioned(
                  left: 15.0,
                  top: 35.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  right: 15.0,
                  top: 35.0,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.share_outlined,
                          size: 35.0,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.bookmark_border_outlined,
                          size: 35.0,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 310,
                  left: 20,
                  child: IconBox(
                    phoneNumber: widget.resturants.phone,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        widget.resturants.name,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SmallTag(
                          title: widget.resturants.type,
                          color: Colors.pink,
                        ),
                      ),
                      SmallTag(
                        title: widget.resturants.distance + ' km',
                        color: Colors.purpleAccent,
                      ),
                    ],
                  ),
                  SmallTextBox(
                    title: '🌟 ' + widget.resturants.rate,
                    color: Colors.grey[600],
                    color2: Colors.grey[300],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.resturants.address,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: OpenTimeText(
                isOpen: widget.resturants.isOpen + ' Now',
                dailyTime: '9:30 am to 11:00 pm',
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: RowTitleCraousel(
                title: 'Menu & Photos',
                count: 32,
                onPress: () {
                  Navigator.pushNamed(context, '/menuAndPhotoScreen');
                },
              ),
            ),
            MenuAndPhototsCrasouel(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: RowTitleCraousel(
                title: 'Review & Ratings',
                count: 32,
                onPress: () {
                  Navigator.pushNamed(context, '/reviewListScreen');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ReviewList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ReviewList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ReviewList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
