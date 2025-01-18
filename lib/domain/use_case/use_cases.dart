import 'package:home_rabbit/domain/use_case/house_use_case/add_house_use_case.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/delete_all_houses_use_case.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/delete_house_use_case.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/get_house_use_case.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/get_houses_use_case.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/update_house_use_case.dart';
import 'package:home_rabbit/domain/use_case/system_info_use_case/get_result_info_texts_use_case.dart';

class UseCases {
  final AddHouseUseCase addHouseUseCase;
  final GetHouseUseCase getHouseUseCase;
  final GetHousesUseCase getHousesUseCase;
  final UpdateHouseUseCase updateHouseUseCase;
  final DeleteHouseUseCase deleteHouseUseCase;
  final DeleteAllHousesUseCase deleteAllHousesUseCase;
  final GetResultInfoTextsUseCase getResultInfoTextsUseCase;

  UseCases({
    required this.addHouseUseCase,
    required this.getHouseUseCase,
    required this.getHousesUseCase,
    required this.updateHouseUseCase,
    required this.deleteHouseUseCase,
    required this.deleteAllHousesUseCase,
    required this.getResultInfoTextsUseCase,
  });
}