import 'package:firebase_auth/firebase_auth.dart';

/// Sets up authorization using Firebase Authentication and listens to changes
/// in the user's authentication state.
void setUpAuthorizationMonitor() {
  /// Listen to changes in the user's authentication state
  /// using `authStateChanges()`.
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      // If the user is null, they are currently signed out.
      print('User is currently signed out!');
    } else {
      // If a user object is present, the user is signed in.
      print('User is signed in!');
    }
  });

  /// Listen to changes in the user's authentication state again.
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      // If the user is null, they are currently signed out.
      print('User is currently signed out!');
    } else {
      // If a user object is present, the user is signed in.
      print('User is signed in!');
    }
  });

  /// Listen to changes in the user's profile data, including sign-in
  /// and sign-out events.
  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user == null) {
      // If the user is null, they are currently signed out.
      print('User is currently signed out!');
    } else {
      // If a user object is present, the user is signed in.
      print('User is signed in!');
    }
  });
}
