import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_rabbit/presentation/view_model/loading_view_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final LoadingViewModel _loadingViewModel = LoadingViewModel();

  Future<UserCredential> googleLogIn() async {
    try {
      _loadingViewModel.loading();

      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      UserCredential userCredential = await _auth.signInWithCredential(
          GoogleAuthProvider.credential(idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken)
      );
      return userCredential;
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<void> googleLogOut() async {
    try {
      _loadingViewModel.loading();
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<UserCredential> appleLogIn() async {
    try {
      _loadingViewModel.loading();
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      return await _auth.signInWithCredential(oauthCredential);
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<void> appleLogOut() async {
    try {
      _loadingViewModel.loading();
      await _auth.signOut();
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }
}