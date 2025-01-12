import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_rabbit/domain/model/service_user.dart';
import 'package:home_rabbit/presentation/view_model/loading_view_model.dart';

class ServiceUserDataSource {
  final db = FirebaseFirestore.instance;
  static final LoadingViewModel _loadingViewModel = LoadingViewModel();

  Future<List<String>> getServiceUserIds() async {
    _loadingViewModel.loading();
    try {
      List<String> userIds = [];
      QuerySnapshot querySnapshot = await db.collection('serviceUsers').get();
      for (var documentSnapshot in querySnapshot.docs) {
        userIds.add(documentSnapshot.id);
      }
      return userIds;
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<void> addServiceUser(User user) async {
    _loadingViewModel.loading();
    try {
      String defaultId = user.uid;
      bool defaultIsSubscribed = false;
      String defaultName = user.displayName ?? user.uid;
      ServiceUser serviceUser = ServiceUser(
        id: defaultId,
        isSubscribed: defaultIsSubscribed,
        name: defaultName,
      );
      final usersRef = db.collection('serviceUsers').doc(user.uid).withConverter<ServiceUser>(
        fromFirestore: (snapshot, _) => ServiceUser.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );
      await usersRef.set(serviceUser);
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<void> deleteServiceUser(String uid) async {
    _loadingViewModel.loading();
    try {
      await db.collection('serviceUsers').doc(uid).delete();
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<bool> getServiceUserIsSubscribed(String uid) async {
    _loadingViewModel.loading();
    try {
      DocumentSnapshot documentSnapshot = await db.collection('serviceUsers').doc(uid).get();
      bool userIsSubscribed = documentSnapshot.get('isSubscribed') as bool;
      return userIsSubscribed;
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }
}
