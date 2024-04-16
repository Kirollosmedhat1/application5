// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutterme_credit_card/flutterme_credit_card.dart';

class PaymentPage2 extends StatefulWidget {
  @override
  State<PaymentPage2> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage2> {
  int _selectedIndex = 0;

  final TextEditingController number = TextEditingController();

  final TextEditingController validThru = TextEditingController();

  final TextEditingController cvv = TextEditingController();

  final TextEditingController holder = TextEditingController();

  final formkey = GlobalKey<FormState>();

  void initState() {
    super.initState();

    number.addListener(() => setState(() {}));
    validThru.addListener(() => setState(() {}));
    cvv.addListener(() => setState(() {}));
    holder.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF1FCF3),
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            Text(
              "Payment Methods",
              style: TextStyle(color: Color(0xff1A7431)),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Credit & Debit Card",
                    style: TextStyle(fontSize: 25, color: Color(0xff1A7431)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Add new Card",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff1A7431)),
                        ),
                      ],
                    ),
                    Radio(value: true, groupValue: "ad", onChanged: (t) {})
                  ],
                ),
              ),
              FMCreditCard(
                number: number.text,
                numberMaskType: FMMaskType.first6last2,
                cvv: cvv.text,
                cvvMaskType: FMMaskType.full,
                validThru: validThru.text,
                validThruMaskType: FMMaskType.none,
                holder: holder.text,
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    FMHolderField(
                      controller: holder,
                      cursorColor: const Color(0xFF1A7431),
                      decoration: InputDecoration(
                        labelText: "Card Holder Name",
                        labelStyle: TextStyle(
                          color: Color(0xFF1A7431),
                        ),
                        hintText: "John Doe",
                      ),
                    ),
                    const SizedBox(height: 20),
                    FMNumberField(
                        style: TextStyle(color: Color(0xFF1A7431)),
                        controller: number,
                        cursorColor: Color(0xff1A7431),
                        decoration: InputDecoration(
                            labelText: "Card Number",
                            labelStyle: TextStyle(
                              color: Color(0xFF1A7431),
                            ),
                            hintText: "0000 0000 0000 0000",
                            fillColor: Color(0xFF1A7431),
                            counterStyle: TextStyle(color: Color(0xFF1A7431)),
                            focusColor: Color(0xFF1A7431))),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: FMValidThruField(
                            controller: validThru,
                            cursorColor: const Color(0xFF1A7431),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF1A7431),
                                ),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF1A7431)),
                              labelText: "Expiration Date",
                              hintText: "****",
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: FMCvvField(
                            controller: cvv,
                            cursorColor: const Color(0xFF1A7431),
                            decoration: InputDecoration(
                              labelText: "CVV",
                              labelStyle: TextStyle(
                                color: Color(0xFF1A7431),
                              ),
                              hintText: "***",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (t) {},
                                activeColor: Color(0xff1A7431),
                              ),
                              Text(
                                "Save Card Info",
                                style: TextStyle(color: Color(0xff1A7431)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "More Payment options",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1A7431)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "images/scan.png",
                                    height: 25,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text("Cash")
                                ],
                              ),
                              Radio(
                                  value: true,
                                  groupValue: "ad",
                                  onChanged: (t) {})
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF1B602D),
                        padding: const EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 90,
                        ),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                           AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.bottomSlide,
                              title: "Hello ",
                              desc:
                                  " Your payment has been processed successfully. Thank you for your purchase!",
                            ).show();
                        }
                      },
                      child: const Text("continue",
                          style: TextStyle(fontSize: 24)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }

  InputDecoration inputDecoration({
    required String labelText,
    required String hintText,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF49B7AE),
        ),
      ),
      labelStyle: const TextStyle(color: Color(0xFF49B7AE)),
      labelText: labelText,
      hintText: hintText,
    );
  }
}