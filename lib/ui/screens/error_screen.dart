import 'package:flutter/material.dart';
import 'package:prophetspath/utils/app_style.dart';

class ErrorScreen extends StatefulWidget {
  final VoidCallback onPressed;
  const ErrorScreen({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Column(
                children: [
                  Image.asset('assets/images/connection-error.png'),
                  const SizedBox(height: 20),
                  const Text('Sorry, an error occurred',
                      style: AppStyle.titleTextStyle),
                  const Text('Please check your internet connection',
                      style: TextStyle(wordSpacing: 0.4))
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 230,
                height: 45,
                child: ElevatedButton(
                    onPressed: widget.onPressed,
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(
                          AppStyle.secondaryColor),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppStyle.primaryColor),
                    ),
                    child: const Text(
                      'Try again',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
