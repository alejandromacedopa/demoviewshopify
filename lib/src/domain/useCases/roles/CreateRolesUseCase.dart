import 'package:demo_view_shopify/src/domain/models/Roles.dart';
import 'package:demo_view_shopify/src/domain/repository/RolesRepository.dart';

class CreateRolesUseCase {
  RolesRepository rolesRepository;
  CreateRolesUseCase(this.rolesRepository);

  run(Roles roles) => rolesRepository.create(roles);
}
