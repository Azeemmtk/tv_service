import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tv_service/modules/staff/staff_add_used_tv.dart';
import 'package:tv_service/modules/staff/staff_added_tv_details.dart';
import 'package:tv_service/services/api_servicces.dart';
import 'package:tv_service/widgets/custom_button.dart';

class StaffAddTvScreen extends StatefulWidget {
  const StaffAddTvScreen({super.key});

  @override
  State<StaffAddTvScreen> createState() => _StaffAddTvScreenState();
}

class _StaffAddTvScreenState extends State<StaffAddTvScreen> {
  Future<dynamic> fetchUsedTv() async {
    final response = await http
        .get(Uri.parse('${ApiServices.baseUrl}/api/user/view-used-tv'));

    if (response.statusCode == 201) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print(data[0]);
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load used TVs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your tv'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchUsedTv(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final tvList = snapshot.data ?? [];
            print('fgfgf');
            print(tvList[0]);

            return Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 250,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: tvList.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        StaffAddedTvDetailsScreen(
                                      image: tvList[index]['image'],
                                      details: tvList[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.grey.shade200)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        tvList[index]['image'],
                                        fit: BoxFit.fill,
                                        height: 100,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Brand : ${tvList[index]['brand']}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            '₹ ${tvList[index]['price']}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomButton(
                    text: 'Add tv',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StaffAddedUsedTvScreen(),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
