import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);
  final String title;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.78,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.transparent, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                prefixIcon: icon,
                hintText: '$title',
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '');
            },
          )
        ],
      ),
    );
  }
}