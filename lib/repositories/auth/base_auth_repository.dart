import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepository {
  // Get user metadata and informations. And stream will notify when have any user auth change everytime, user login and logout.
  Stream<auth.User?> get user;

  Future<auth.User?> signUp({
    required String email,
    required String password,
  });

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
