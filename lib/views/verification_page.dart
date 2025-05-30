//import packages
import 'dart:async'; // Import for Timer
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test_3/firebase_options.dart'; // Assuming this file exists and provides Firebase options

// Verification Page
class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  // State variable to track if the verification email has been sent
  bool _isEmailSent = false;
  // State variable to track if the email has been successfully verified
  bool _emailSuccessfullyVerified = false;

  Timer? _timer; // Timer for periodic checks

  @override
  void initState() {
    super.initState();
    // Automatically send verification email when the page loads, if not already sent
    _sendVerificationEmail();
    // Start periodic check for email verification status
    _startEmailVerificationCheck();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Function to show a SnackBar message
  void _showSnackBar(String message) {
    // Check if the context is still valid before showing SnackBar
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  // Function to start the periodic email verification check
  void _startEmailVerificationCheck() {
    // Check every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.reload(); // Reload user data to get the latest status
        if (user.emailVerified) {
          _timer?.cancel(); // Cancel the timer if email is verified
          if (mounted) {
            setState(() {
              _emailSuccessfullyVerified = true; // Update UI to show tick mark
            });
            _showSnackBar('Email successfully verified! Redirecting...');
            // Add a small delay before navigating to allow the tick mark to be seen
            await Future.delayed(const Duration(seconds: 2));
            if (mounted) {
              Navigator.pushReplacementNamed(context, '/HomePage'); // Navigate to home page
            }
          }
        }
      }
    });
  }

  // Function to send the email verification
  Future<void> _sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        setState(() {
          _isEmailSent = true;
          _emailSuccessfullyVerified = false; // Reset success state if user resends email
        });
        print("Verification email sent to ${user.email}");
        _showSnackBar('Verification email sent! Please check your inbox and spam folder.');
      } else if (user != null && user.emailVerified) {
        setState(() {
          _emailSuccessfullyVerified = true; // Already verified, show tick mark
        });
        _showSnackBar('Your email is already verified!');
        // If already verified, navigate directly
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/HomePage');
        }
      }
    } on FirebaseAuthException catch (e) {
      print("Error sending verification email: ${e.message}");
      _showSnackBar('Failed to send verification email: ${e.message}');
    } catch (e) {
      print("An unexpected error occurred: $e");
      _showSnackBar('An unexpected error occurred. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "lib/images/Group 6.png",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            FutureBuilder(
              future: Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              ),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 140),
                          Container(
                            height: 300, // Adjusted height to accommodate new elements
                            width: 305,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20),
                                const Text(
                                  'Verify Your Email',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    _isEmailSent
                                        ? 'A verification email has been sent to your registered email address. Please check your inbox and spam folder.'
                                        : 'Please click the button below to send a verification email.',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 50, 50, 50),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 30),

                                // Button to resend verification email
                                Container(
                                  width: 250,
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(250, 169, 19, 1),
                                    borderRadius: BorderRadius.circular(7.0),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: TextButton(
                                    // Disable resend button if email is already verified
                                    onPressed: _emailSuccessfullyVerified ? null : _sendVerificationEmail,
                                    style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll<Color>(
                                        Color.fromRGBO(250, 169, 19, 1),
                                      ),
                                    ),
                                    child: const Text(
                                      'Resend Verification Email',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // Check verification status button (now optional, as it auto-checks)
                                // This button allows for an on-demand check, but the timer will handle automatic checks.
                                
                                const SizedBox(height: 20),

                                // Loading indicator or tick mark (always show unless verified)
                                if (_emailSuccessfullyVerified)
                                  const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 48.0,
                                  )
                                else
                                  const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(250, 169, 19, 1)),
                                  ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  default:
                    return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
