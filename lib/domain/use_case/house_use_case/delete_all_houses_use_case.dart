import 'package:home_rabbit/domain/domain_repository/house_domain_repository.dart';

class DeleteAllHousesUseCase {
  final HouseDomainRepository houseDomainRepository;
  DeleteAllHousesUseCase(this.houseDomainRepository);

  Future<void> call() async{
    await houseDomainRepository.deleteAllHouses();
  }
}