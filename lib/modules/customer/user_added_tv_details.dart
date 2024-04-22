import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAddedTvDetailsScreen extends StatefulWidget {
  const UserAddedTvDetailsScreen({super.key, required this.image, required this.details});


  final  String image;
  final  Map<String,dynamic> details;
 
  @override
  State<UserAddedTvDetailsScreen> createState() => _UserAddedTvDetailsScreenState();
}

class _UserAddedTvDetailsScreenState extends State<UserAddedTvDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(widget.image),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Card(
                child: Column(
                  children: [
                    const Text(
                      'Specification',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Brand',
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              const Spacer(),
                               Text(
                                widget.details['brand'],
                                style:
                                    TextStyle(fontSize: 17, color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Model',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey.shade500),
                              ),
                              const Spacer(),
                               Text(
                                widget.details['model'],
                                style:
                                    TextStyle(fontSize: 17, color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                           Row(
                            children: [
                              Text(
                                'Type',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey.shade500),
                              ),
                              const Spacer(),
                               Text(
                                widget.details['type'],
                                style:
                                    TextStyle(fontSize: 17, color: Colors.black),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                       
                        

                           Row(
                            children: [
                              Text(
                                'color',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.grey.shade500),
                              ),
                              const Spacer(),
                               Text(
                                widget.details['color'],
                                style:
                                    TextStyle(fontSize: 17, color: Colors.black),
                              ),
                            ],
                          ),

                          SizedBox(height: 20,),


                          
                       
                           Row(
                            children: [
                              Text(
                                'price',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              Text(
                                '₹${widget.details['price']}',
                                style:
                                    TextStyle(fontSize: 17, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  
  }
}

