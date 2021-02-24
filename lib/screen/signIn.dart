import 'package:flutter/material.dart';
import 'package:flutter_application_test/screen/chat.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 20),
          height: 40,
          width: 40,
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.black,
            ),
          ),
        ),
        title: Text('Welcome'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to TestChat!',
                style: TextStyle(color: Colors.purpleAccent, fontSize: 35),
                textAlign: TextAlign.center),
            SizedBox(height: 40),
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Sign-In with Google',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              onPressed: _signAndNavigateToChat,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () => launch('https://www.termsfeed.com/'),
              child: Text(
                'Policy and terms',
                style: TextStyle(
                    fontSize: 18, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Let`s chat!',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              onPressed: _navigateToChat,
              color: Colors.brown,
            ),
          ],
        ),
      ),
    );
  }

  _signAndNavigateToChat() {
    _signInWithGoogle().then(_navigateToChat());
  }

  _navigateToChat() {
    return Navigator.push<MaterialPageRoute>(
      context,
      MaterialPageRoute(builder: (context) => Chat()),
    );
  }

  _signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final User user =
        (await firebaseAuth.signInWithCredential(credential)).user;
  }
}
