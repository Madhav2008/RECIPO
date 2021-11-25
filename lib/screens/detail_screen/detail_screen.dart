import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final document;
  const DetailScreen({Key? key, this.document}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
            "Recipe Details",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'MuseoModerno',
              // fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Hero(
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                width: double.infinity,
                child: Image.network(
                  widget.document["image"],
                  fit: BoxFit.cover,
                ),
              ),
              tag: widget.document["image"],
            ),
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.6,
              minChildSize: 0.6,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              widget.document["title"],
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            // IconButton(
                            //   icon: Icon(Icons.favorite),
                            //   color: Colors.redAccent,
                            //   iconSize: 30,
                            //   onPressed: () {},
                            // )
                            // LikeButton()
                          ],
                        ),
                        Text(
                          widget.document["category"],
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Divider(color: Colors.black45,),
                        // Row(
                        //   children: <Widget>[
                        //     Icon(
                        //       Icons.star,
                        //       color: Colors.orange,
                        //       size: 15,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       color: Colors.orange,
                        //       size: 15,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       color: Colors.orange,
                        //       size: 15,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       color: Colors.orange,
                        //       size: 15,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       color: Colors.grey[400],
                        //       size: 15,
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Icon(Icons.assignment_outlined),
                            SizedBox(width: 5),
                            Text(
                              "About Recipe",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 4,
                        ),

                        Text(widget.document["about_recipe"],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                        ),
                        Divider(color: Colors.black45,),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Icon(Icons.watch_later_outlined),
                            SizedBox(width: 5),
                            Text(
                              "Time to Cook",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),


                        SizedBox(
                          height: 4,
                        ),

                        Text(widget.document["time_to_cook"],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                        ),
                        Divider(color: Colors.black45,),

                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Icon(Icons.room_service_outlined),
                            SizedBox(width: 5),
                            Text(
                              "Ingredients",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),

                        Text(widget.document["ingredient"],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                        ),
                        Divider(color: Colors.black45,),

                        SizedBox(
                          height: 24,
                        ),

                        Row(
                          children: [
                            Icon(Icons.book_outlined),
                            SizedBox(width: 5),
                            Text(
                              "Cooking Method",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),

                        Text(widget.document["cooking_method"],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
