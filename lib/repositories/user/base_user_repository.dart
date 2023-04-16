import '/models/models.dart';

abstract class BaseUserRepository {
  // Get information for specific user and update everytime when the user object updated into firestore.
  Stream<User> getUser(String userId);
  // Create user document into firestore.
  Future<void> createUser(User user);
  // Update user information into firestore.
  Future<void> updateUser(User user);
}
