import 'package:demo_view_shopify/src/domain/useCases/roles/RolesUseCases.dart';
import 'package:demo_view_shopify/src/domain/utils/Resource.dart';
import 'package:demo_view_shopify/src/presentation/pages/admin/roles/list/bloc/AdminRolesListEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/admin/roles/list/bloc/AdminRolesListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminRolesListBloc
    extends Bloc<AdminRolesListEvent, AdminRolesListState> {
  RolesUseCases rolesUseCases;

  AdminRolesListBloc(this.rolesUseCases) : super(AdminRolesListState()) {
    on<GetRoles>(_onGetRoles);
  }

  Future<void> _onGetRoles(
      GetRoles event, Emitter<AdminRolesListState> emit) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await rolesUseCases.getRoles.run();
    emit(state.copyWith(response: response));
  }
}
