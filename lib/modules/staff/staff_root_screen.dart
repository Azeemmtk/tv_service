import 'package:flutter/material.dart';
import 'package:tv_service/modules/auth/login.dart';
import 'package:tv_service/modules/staff/staff_add_used_tv_list.dart';
import 'package:tv_service/modules/staff/staff_view_services.dart';
import 'package:tv_service/widgets/custom_card.dart';

class StaffRootScreen extends StatelessWidget {
  const StaffRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Staff'),
        backgroundColor: Colors.grey.shade200,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
              child: Text("Log out")),
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Custom_Card(
              image: "assets/images/used tv.png",
              text: "USED TV'S",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StaffAddTvScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Custom_Card(
              image: "assets/images/services.jpg",
              text: "Services",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StaffViewServices(),
                  ),
                );
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Custom_Card(
          //     image: "assets/images/tvtranspot.jpg",
          //     text: "Transport TV'S",
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => TransportTvListScreen(),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
