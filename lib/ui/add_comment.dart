import 'package:flutter/material.dart';  
import 'package:intl/intl.dart';
import 'package:submission_dua/data/api/api_service.dart'; 
import 'package:submission_dua/data/model/restaurant_review.dart';

NumberFormat myFormat = NumberFormat.decimalPattern('en_us');

class AddCommentPage extends StatefulWidget {
  static const routeName = '/add_comment'; 
  final String id;
  const AddCommentPage({Key? key, required this.id}) : super(key: key);

  @override
  State<AddCommentPage> createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  late String name;
  late String review;
  late Future<RestaurantReviewResult> _restaurantReview;  
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
           title:  const Text("Add Comment"),
        ),
        body:  
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children:   [
                TextField(
                decoration: const InputDecoration(
                  hintText:"Name", 
                ),
                onChanged: (String value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration( 
                  hintText:"Comment",
                ),
                onChanged: (String value) {
                  setState(() {
                    review = value;
                  });
                },
              ),
              Padding(
                padding:const EdgeInsets.only(top: 30.0, bottom: 5.0),
                child: ElevatedButton(  
                  onPressed: () {
                    _restaurantReview = ApiService().addComment(widget.id, name, review);  
                    _restaurantReview.then((response) {   
                      Navigator.pop(context,response.customerReviews);  
                    }); 
                  },
                  child: const Text("Save" )
                  ) 
              ),  
            ]
          ),
        ),
         
      ); 
  }
}
 
 