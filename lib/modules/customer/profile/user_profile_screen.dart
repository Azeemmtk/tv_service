import 'package:flutter/material.dart';
import 'package:tv_service/modules/auth/login.dart';
import 'package:tv_service/services/api_servicces.dart';
import 'package:tv_service/utils/constants.dart';
import 'package:tv_service/widgets/custom_button.dart';
import 'package:tv_service/widgets/custom_text_field.dart';

import 'customer_feedback.dart';

class CustomerProfileScreen extends StatelessWidget {
  CustomerProfileScreen({super.key});

  TextEditingController _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: ApiServices().fetchUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            var profileData = snapshot.data!;
            print(profileData);

            _nameController.text = profileData['name'];
            _emailController.text = profileData['email'];
            _phoneController.text = profileData['phone'];

            return Center(
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    actions: [
                      // IconButton(
                      //   onPressed: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => UserEditProfileScreen(
                      //           name: _nameController.text,
                      //           email: _emailController.text,
                      //           phone: _phoneController.text,
                      //         ),
                      //       ),
                      //     );
                      //   },
                      //   icon: Icon(
                      //     Icons.edit,
                      //     size: 30,
                      //     color: KButtonColor,
                      //   ),
                      // )
                    ],
                  ),
                  const CircleAvatar(
                    radius: 100,
                    child: Icon(
                      Icons.person,
                      size: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomTextField(
                      hintText: 'name',
                      controller: _nameController,
                      isEnabled: false,
                      borderColor: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomTextField(
                      hintText: 'email',
                      controller: _emailController,
                      isEnabled: false,
                      borderColor: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomTextField(
                      hintText: 'phone',
                      controller: _phoneController,
                      isEnabled: false,
                      borderColor: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        child: CustomButton(
                          text: 'Log out',
                          color: KButtonColor,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (route) => false);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        child: CustomButton(
                          text: 'Feedback',
                          color: KButtonColor,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Customerfeedback(),
                                ));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        });
  }
}
