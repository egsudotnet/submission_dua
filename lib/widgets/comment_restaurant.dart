import 'package:submission_dua/common/styles.dart'; 
import 'package:submission_dua/data/model/restaurant_detail.dart'; 
import 'package:flutter/material.dart';

class CommentRestaurant extends StatelessWidget {
  final List<CustomerReview> review;

  const CommentRestaurant({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return ListView(
        scrollDirection: Axis.vertical,
        children: review.map((item) {  
          return Card(
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: Color.fromARGB(255, 205, 221, 241),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children:<Widget>[
                      Text(
                        "${item.name}:",
                        style: myTextTheme.subtitle2
                      ),
                      Expanded(
                        child: Text(
                          item.date,
                          textAlign: TextAlign.right,
                          ),
                      ),
                  ]),  
                  const SizedBox(
                    height: 5,
                  ),
                  Text(item.review),
                ],
                ),
              ),
          );
          
        }).toList(),
      );
  }
}
