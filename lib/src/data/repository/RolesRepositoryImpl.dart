import 'package:demo_view_shopify/src/data/dataSource/remote/services/RolesServices.dart';
import 'package:demo_view_shopify/src/domain/models/Roles.dart';
import 'package:demo_view_shopify/src/domain/repository/RolesRepository.dart';
import 'package:demo_view_shopify/src/domain/utils/Resource.dart';

class RolesRepositoryImpl implements RolesRepository {
  RolesService rolesService;
  RolesRepositoryImpl(this.rolesService);
  @override
  Future<Resource<Roles>> create(Roles rol) {
    return rolesService.create(rol);
  }

  @override
  Future<Resource<List<Roles>>> getRoles() {
    return rolesService.getRoles();
  }
}
