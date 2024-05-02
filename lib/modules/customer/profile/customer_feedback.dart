import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tv_service/services/api_servicces.dart';
import 'package:tv_service/services/db_services.dart';

class Customerfeedback extends StatefulWidget {
  Customerfeedback({super.key});

  @override
  State<Customerfeedback> createState() => _CustomerfeedbackState();
}

class _CustomerfeedbackState extends State<Customerfeedback> {
  final _feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              height: 200,
              width: 350,
              child: TextField(
                controller: _feedbackController,
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: "add feedback", border: OutlineInputBorder()),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                _submitFeedback(feedback: _feedbackController.text);
              },
              child: Text("Submit"))
        ],
      ),
    );
  }

  void _submitFeedback({required String feedback}) async {
    // Create your POST request
    final response = await http.post(
      Uri.parse(
          '${ApiServices.baseUrl}/api/user/add-feedback/${DbService.getLoginId()}'),
      body: {'feedback': feedback},
    );

    print(response.statusCode);

    if (response.statusCode == 201) {
      Navigator.pop(context);
      // Feedback submitted successfully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted successfully')),
      );
    } else {
      // Error occurred while submitting feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit feedback')),
      );
    }
  }
}
