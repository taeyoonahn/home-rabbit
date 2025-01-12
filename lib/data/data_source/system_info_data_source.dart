import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_rabbit/presentation/view_model/loading_view_model.dart';

class SystemInfoDataSource {
  final db = FirebaseFirestore.instance;
  static final LoadingViewModel _loadingViewModel = LoadingViewModel();

  Future<List<String>> getResultInfoTexts(String id) async {
    _loadingViewModel.loading();
    try {
      List<String> documentFields = [];
      DocumentSnapshot documentSnapshot = await db
          .collection('infoResultTexts')
          .doc(id)
          .get();
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      documentFields = data.values.map((value) => value.toString()).toList();
      return documentFields;
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }
}
