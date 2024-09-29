import 'package:demo_view_shopify/src/data/repository/RolesRepositoryImpl.dart';
import 'package:demo_view_shopify/src/domain/repository/RolesRepository.dart';

class GetRolesUseCase {
  RolesRepository rolesRepository;
  GetRolesUseCase(this.rolesRepository);

  run() => rolesRepository.getRoles();
}
