import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AuthenticationRepository {
  final AmplifyClass amplify;

  AuthenticationRepository(this.amplify);

  Future<bool> initializeAuthentication() async {
    try {
      return amplify.Auth.fetchAuthSession().then((value) => value.isSignedIn);
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<AuthNextSignUpStep?> createUserWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      return await amplify.Auth.signUp(
          username: username,
          password: password,
          options: CognitoSignUpOptions(
              userAttributes: <CognitoUserAttributeKey, String>{
                CognitoUserAttributeKey.email: email,
                CognitoUserAttributeKey.name: name,
              })).then((value) => value.nextStep);
    } on UsernameExistsException catch (e) {
      print("UsernameExistsException");
      print(e.toString());
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> signInWithUsernameAndPassword({
    required String password,
    required String username,
  }) async {
    try {
      return await amplify.Auth.signIn(username: username, password: password)
          .then((value) => "authenticated");
    } on UserNotConfirmedException catch (e) {
      await resendConfirmationCode(username);
      return "needConfirmationCode";
    } on UserNotFoundException catch (e) {
      return "userNotFound";
    } catch (e) {
      print(e.toString());
      return "Exception";
    }
  }

  Future<bool> confirmSignUp({
    required String username,
    required String confirmationCode,
  }) async {
    try {
      return await amplify.Auth.confirmSignUp(
              username: username, confirmationCode: confirmationCode)
          .then((value) => value.isSignUpComplete);
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> resendConfirmationCode(String username) async {
    try {
      await amplify.Auth.resendSignUpCode(username: username);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String?> forgotPassword(String username) async {
    try {
      return await amplify.Auth.resetPassword(username: username).then(
          (value) => value.isPasswordReset
              ? null
              : "Sorry, we are unable to reset your password.");
    } on InvalidParameterException catch (e) {
      return "Please make sure the username is accurate.";
    } catch (e) {
      print(e.toString());
      return "Sorry, we are unable to reset your password.";
    }
  }

  Future<bool> resetPasswordVerification({
    required String username,
    required String password,
    required String verificationCode,
  }) async {
    try {
      await amplify.Auth.confirmResetPassword(
          username: username,
          newPassword: password,
          confirmationCode: verificationCode);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  get signOut => amplify.Auth.signOut();

  // Future<AuthDebugger> clearUsersData() async {
  //   if (sharedPreferences != null) {
  //     SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
  //     _sharedPrefs.clear();
  //     return AuthDebugger(response: true, message: 'User data deleted');
  //   } else if (amplify != null) {
  //     try {
  //       await amplify!.Auth.deleteUser();
  //       return AuthDebugger(response: true, message: 'User data deleted');
  //     } catch (e) {
  //       return AuthDebugger(response: false, error: e.toString());
  //     }
  //   } else {
  //     return AuthDebugger(response: false, error: 'Something went wrong');
  //   }
  // }
}
