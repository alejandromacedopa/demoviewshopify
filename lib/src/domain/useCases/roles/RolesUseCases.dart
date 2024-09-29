import 'package:demo_view_shopify/src/domain/useCases/roles/CreateRolesUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/roles/GetRolesUseCases.dart';

class RolesUseCases {
  CreateRolesUseCase create;
  GetRolesUseCase getRoles;

  RolesUseCases({
    required this.create,
    required this.getRoles,
  });
}
