import 'package:flutter/material.dart';
import 'package:roadfix_test/card_infos.dart';
import 'package:roadfix_test/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String selected = "first";
  List<CardInfo> myList = [];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 70, right: 40, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Checkout',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              'Select your payment method',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 'first';
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 99,
                          height: 75,
                          decoration: BoxDecoration(
                            color: selected == 'first'
                                ? const Color.fromARGB(255, 83, 224, 255)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1.5,
                              color: const Color.fromARGB(255, 83, 224, 255),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 55,
                            height: 5.0,
                            child: Image.asset(
                              'assets/images/AppleLogo.png',
                              color: selected == 'first'
                                  ? Colors.white
                                  : const Color.fromARGB(255, 83, 224, 255),
                            ),
                          )),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'Apple Pay',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 163, 255)),
                      ),
                    ],
                  )),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 'second';
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 99,
                          height: 75,
                          decoration: BoxDecoration(
                            color: selected == 'second'
                                ? const Color.fromARGB(255, 83, 224, 255)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1.5,
                              color: const Color.fromARGB(255, 83, 224, 255),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset(
                              'assets/images/cardcard.png',
                              width: 54,
                              height: 22.5,
                              color: selected == 'second'
                                  ? Colors.white
                                  : const Color.fromARGB(255, 83, 224, 255),
                            ),
                          )),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'Credit Card',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 163, 255)),
                      ),
                    ],
                  )),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 'third';
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 99,
                          height: 75,
                          decoration: BoxDecoration(
                            color: selected == 'third'
                                ? const Color.fromARGB(255, 83, 224, 255)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1.5,
                              color: const Color.fromARGB(255, 83, 224, 255),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset(
                              'assets/images/PayPalPay.png',
                              width: 54,
                              height: 22.5,
                              color: selected == 'third'
                                  ? Colors.white
                                  : const Color.fromARGB(255, 83, 224, 255),
                            ),
                          )),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        'PayPal',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 163, 255)),
                      ),
                    ],
                  )),
            ]),
            const SizedBox(
              height: 57,
            ),
            const Text(
              'Select your card',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myList.isEmpty
                    ? Column(
                        children: [
                          Image.asset(
                            'assets/images/Icon.png',
                            width: 99,
                            height: 96,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'You do not have a credit card on file.',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    : MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: Container(
                          height: 130,
                          child: ListView.builder(
                              itemCount: myList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, position) {
                                return InkWell(
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () =>
                                      setState(() => selectedIndex = position),
                                  child: Card(
                                      color: (selectedIndex == position)
                                          ? const Color.fromARGB(
                                              255, 107, 179, 228)
                                          : Colors.white,
                                      child: Row(children: [
                                        Container(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 10),
                                            child: getCardIcon(
                                                myList[position].type)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 2,
                                                    bottom: 2,
                                                    left: 30)),
                                            Text(myList[position].cardNumber),
                                            Text(myList[position].expDate)
                                          ],
                                        )
                                      ])),
                                );
                              }),
                        ),
                      ),
              ],
            )),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 83, 224, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  _awaitReturnValueFromSecondScreen(context);
                },
                child: const Text(
                  'Add a new card',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total amount',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$29.90',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () => {
                  if (selectedIndex != -1)
                    {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Success!'),
                          content: const Text('The payment was registered'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                    }
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 83, 224, 255),
                    ),
                    alignment: Alignment.center,
                    width: 264,
                    height: 50,
                    child: const Text(
                      'Pay now',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    CardInfo result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SecondScreen(
            title: "Add new card",
          ),
        ));
    if (result.isPrimary) {
      selectedIndex = myList.length;
      for (var i = 0; i < myList.length; i++) {
        if (myList[i].isPrimary) {
          myList[i].isPrimary = false;
        }
      }
    }
    setState(() {
      myList.add(result);
    });
  }
}
