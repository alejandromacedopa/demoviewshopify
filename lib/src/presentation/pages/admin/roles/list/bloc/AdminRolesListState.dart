import 'package:demo_view_shopify/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';

class AdminRolesListState extends Equatable {
  final Resource? response;

  const AdminRolesListState({this.response});

  AdminRolesListState copyWith({Resource? response}) {
    return AdminRolesListState(response: response);
  }

  @override
  List<Object?> get props => [response];
}
