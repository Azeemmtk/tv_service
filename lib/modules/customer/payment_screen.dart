import 'package:flutter/material.dart';
import 'package:tv_service/widgets/custom_button.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key, this.totalAmount, this.phone});

  final String? totalAmount;
  final String? phone;

  @override
  // ignore: library_private_types_in_public_api
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPaymentMethod;
  final _formkey = GlobalKey<FormState>();

  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedPaymentMethod = value;
    });
  }

  void _handleAddPayment() {
    if (_selectedPaymentMethod != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          if (_selectedPaymentMethod == 'UPI') {
            return AlertDialog(
              title: const Text('Enter UPI Details'),
              content: const TextField(
                decoration: InputDecoration(labelText: 'Enter UPI ID'),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(true);

                    print('ddd');
                  },
                  child: const Text('Submit'),
                ),
              ],
            );
          } else if (_selectedPaymentMethod == 'Card') {
            return AlertDialog(
              title: const Text('Enter Card Details'),
              content: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Card Number'),
                      validator: (value) {
                        return value == null || value.isEmpty
                            ? 'fill the field'
                            : value.length != 16
                                ? 'card number must be 16 digit'
                                : null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Expiry Date'),
                      validator: (value) {
                        return value == null || value.isEmpty
                            ? 'fill the field'
                            : null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'CVV'),
                      validator: (value) {
                        return value == null || value.isEmpty
                            ? 'fill the field'
                            : value.length != 3
                                ? 'card number must be 3 digit'
                                : null;
                      },
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop(true);
                    }

                    // Add your logic here to handle the card details
                  },
                  child: const Text('Submit'),
                ),
              ],
            );
          } else {
            return AlertDialog(
              title: Text('Payment Method: $_selectedPaymentMethod'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          }
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a payment method')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Select Payment Method:'),
            RadioListTile<String>(
              title: const Text('UPI'),
              value: 'UPI',
              groupValue: _selectedPaymentMethod,
              onChanged: _handleRadioValueChange,
            ),
            RadioListTile<String>(
              title: const Text('Cash on Delivery'),
              value: 'Cash on Delivery',
              groupValue: _selectedPaymentMethod,
              onChanged: _handleRadioValueChange,
            ),
            RadioListTile<String>(
              title: const Text('Card'),
              value: 'Card',
              groupValue: _selectedPaymentMethod,
              onChanged: _handleRadioValueChange,
            ),
            const SizedBox(height: 16.0),
            const Spacer(),
            if (widget.phone != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Phone:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(widget.phone!),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(widget.totalAmount!),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                onPressed: _handleAddPayment,
                text: 'Add',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
