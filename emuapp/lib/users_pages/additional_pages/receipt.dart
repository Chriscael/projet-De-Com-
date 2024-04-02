// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:emuapp/models/pdf.dart';
//import 'package:emuapp/services/db.dart';
import 'package:flutter/material.dart';


class ReceiptGenerator extends StatefulWidget {
  const ReceiptGenerator({super.key});

  @override
  _ReceiptGeneratorState createState() => _ReceiptGeneratorState();
}

class _ReceiptGeneratorState extends State<ReceiptGenerator> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController agencyController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController operationNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController merchantNameController = TextEditingController();

  Pdf pdf = Pdf('', '', '', '', '', '', '', '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Générateur de Reçus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: agencyController,
              decoration: InputDecoration(labelText: 'Agence'),
            ),
            TextFormField(
              controller: currencyController,
              decoration: InputDecoration(labelText: 'Devise'),
            ),
            TextFormField(
              controller: reasonController,
              decoration: InputDecoration(labelText: 'Motif'),
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Numéro de téléphone'),
            ),
            TextFormField(
              controller: operationNumberController,
              decoration: InputDecoration(labelText: 'Numéro de l\'opération'),
            ),
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Montant'),
            ),
            TextFormField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextFormField(
              controller: merchantNameController,
              decoration: InputDecoration(labelText: 'Nom du commerçant'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //DBServices().generateReceipt(pdf, context);
              },
              child: Text('Générer le reçu'),
            ),
          ],
        ),
      ),
    );
  }
}
