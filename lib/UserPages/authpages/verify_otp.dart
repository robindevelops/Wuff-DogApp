import 'package:dog_selling/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  int countdownValue = 10;
  bool isButtonActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verify OTP",
              style: GoogleFonts.abel(fontSize: 25),
            ),
            const SizedBox(height: 30),
            OtpTextField(
              focusedBorderColor: Colors.lightGreen,
              enabledBorderColor: Colors.grey,
              numberOfFields: 6,
              showFieldAsBox: true,
            ),
            const SizedBox(height: 30),
            Custombutton(
              text: "Verify-OTP",
              color: Colors.lightGreen,
              onPressed: () {},
            ),
            const SizedBox(height: 30),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Resend OTP",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
