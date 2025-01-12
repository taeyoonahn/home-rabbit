import 'dart:async';
import 'package:home_rabbit/domain/model/house.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:home_rabbit/presentation/view_model/loading_view_model.dart';

class HouseDataSource {
  static Isar? _isar;
  HouseDataSource._();
  static final HouseDataSource houseDataSource = HouseDataSource._();
  static final LoadingViewModel _loadingViewModel = LoadingViewModel();

  static Future<void> init(String uid) async {
    if (_isar != null && _isar!.isOpen) {
      return;
    }
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [HouseSchema],
      directory: dir.path,
      name: uid,
    );
  }

  static Future<void> logoutDB() async {
    if (_isar != null && _isar!.isOpen) {
      await _isar!.close();
      _isar = null;
    }
  }

  Future<void> addHouse(House house) async {
    _loadingViewModel.loading();
    try {
      if (_isar == null) {
        throw Exception("Isar instance is not initialized. Call init() first.");
      }
      await _isar!.writeTxn(() async {
        await _isar!.houses.put(house);
      });
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<List<House>> getHouse(String houseName) async {
    _loadingViewModel.loading();
    try {
      if (_isar == null) {
        throw Exception("Isar instance is not initialized. Call init() first.");
      }
      final result = await _isar!.houses
          .filter()
          .houseNameEqualTo(houseName)
          .findAll();
      return result;
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<List<House>> getHouses() async {
    try {
      if (_isar == null) {
        throw Exception("Isar instance is not initialized. Call init() first.");
      }
      final result = await _isar!.houses.where().findAll();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateHouse(House house) async {
    try {
      if (_isar == null) {
        throw Exception("Isar instance is not initialized. Call init() first.");
      }
      await _isar!.writeTxn(() async {
        await _isar!.houses.put(house);
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteHouse(int id) async {
    _loadingViewModel.loading();
    try {
      if (_isar == null) {
        throw Exception("Isar instance is not initialized. Call init() first.");
      }
      await _isar!.writeTxn(() async {
        await _isar!.houses.delete(id);
      });
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }

  Future<void> deleteAllHouses() async {
    _loadingViewModel.loading();
    try {
      if (_isar == null) {
        throw Exception("Isar instance is not initialized. Call init() first.");
      }
      await _isar!.close(deleteFromDisk: true);
      _isar = null;
    } catch (e) {
      rethrow;
    } finally {
      _loadingViewModel.notLoading();
    }
  }
}
