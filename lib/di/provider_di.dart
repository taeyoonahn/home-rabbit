import 'package:home_rabbit/data/data_repository/house_data_repository.dart';
import 'package:home_rabbit/data/data_repository/system_info_data_repository.dart';
import 'package:home_rabbit/data/data_source/house_data_source.dart';
import 'package:home_rabbit/data/data_source/system_info_data_source.dart';
import 'package:home_rabbit/domain/domain_repository/house_domain_repository.dart';
import 'package:home_rabbit/domain/domain_repository/system_info_domain_repository.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/add_house_use_case.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/delete_all_houses_use_case.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/delete_house_use_case.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/get_house_use_case.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/get_houses_use_case.dart';
import 'package:home_rabbit/domain/use_case/house_use_case/update_house_use_case.dart';
import 'package:home_rabbit/domain/use_case/system_info_use_case/get_result_info_texts_use_case.dart';
import 'package:home_rabbit/domain/use_case/use_cases.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/view_model/subcription_view_model.dart';
import 'package:home_rabbit/presentation/view_model/system_info_view_model.dart';
import 'package:home_rabbit/presentation/view_model/service_user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:home_rabbit/presentation/view_model/router_view_model.dart';
import 'package:home_rabbit/presentation/view_model/loading_view_model.dart';

Future<List<SingleChildWidget>> providerDi() async {

  HouseDataSource houseDataSource = HouseDataSource.houseDataSource;
  SystemInfoDataSource systemInfoDataSource = SystemInfoDataSource();

  HouseDomainRepository houseDomainRepository = HouseDataRepository(houseDataSource);
  SystemInfoDomainRepository systemInfoDomainRepository = SystemInfoDataRepository(systemInfoDataSource);

  UseCases useCases = UseCases(
    addHouseUseCase: AddHouseUseCase(houseDomainRepository),
    getHouseUseCase: GetHouseUseCase(houseDomainRepository),
    getHousesUseCase: GetHousesUseCase(houseDomainRepository),
    updateHouseUseCase: UpdateHouseUseCase(houseDomainRepository),
    deleteHouseUseCase: DeleteHouseUseCase(houseDomainRepository),
    deleteAllHousesUseCase: DeleteAllHousesUseCase(houseDomainRepository),
    getResultInfoTextsUseCase: GetResultInfoTextsUseCase(systemInfoDomainRepository),
  );

  LoadingViewModel loadingViewModel = LoadingViewModel();
  RouterViewModel routerViewModel = RouterViewModel();
  //AdMobViewModel adMobViewModel = AdMobViewModel();
  HouseViewModel houseViewModel = HouseViewModel(useCases);
  ServiceUserViewModel serviceUserViewModel = ServiceUserViewModel(useCases);
  SystemInfoViewModel systemInfoViewModel = SystemInfoViewModel(useCases);
  SubscriptionViewModel subscriptionViewModel = SubscriptionViewModel();

  return [
    ChangeNotifierProvider(create: (_) => loadingViewModel),
    ChangeNotifierProvider(create: (_) => routerViewModel),
    //ChangeNotifierProvider(create: (_) => adMobViewModel),
    ChangeNotifierProvider(create: (_) => houseViewModel),
    ChangeNotifierProvider(create: (_) => serviceUserViewModel),
    ChangeNotifierProvider(create: (_) => systemInfoViewModel),
    ChangeNotifierProvider(create: (_) => subscriptionViewModel),
  ];
}
