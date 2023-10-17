import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  final String fromAccount;
  final String toAccount;
  final String amount;

  const TransactionWidget({
    super.key,
    required this.fromAccount,
    required this.toAccount,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRichText('From Account  : ', fromAccount, Colors.black),
            const SizedBox(height: 5),
            _buildRichText('To Account       : ', toAccount, Colors.black),
            const SizedBox(height: 5),
            _buildRichText('Amount             :  Rs', amount, Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildRichText(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(color: Color.fromARGB(255, 61, 59, 59)),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
