import 'package:flutter/material.dart';

class CCP extends StatefulWidget {
  const CCP({super.key});

  @override
  State<CCP> createState() => _CCPState();
}

class _CCPState extends State<CCP> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    const boarder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(40)),
    );
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: const Text('currency converter'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NPR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(3)}',
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyanAccent),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'please enter amount in usd',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.monetization_on),
                  prefixIconColor: Colors.amberAccent,
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: boarder,
                  focusedBorder: boarder,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  final inputText = textEditingController.text.trim();
                  if (inputText.isNotEmpty) {
                    setState(() {
                      double? parsedValue =
                          double.tryParse(inputText.toString());
                      result = (parsedValue ?? 0) * 123;
                      print(result);
                    });
                  } else {
                    // Handle empty input case here, for example, show a Snackbar or provide a message to the user.
                    print('Please enter a valid amount.');
                  }
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child: const Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
