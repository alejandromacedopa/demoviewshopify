import 'dart:convert';
import 'package:demo_view_shopify/src/presentation/pages/admin/roles/create/bloc/RolesEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/admin/roles/create/bloc/RolesState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  RolesBloc() : super(RolesInitial()) {
    on<CreateRole>(_onCreateRole);
  }

  void _onCreateRole(CreateRole event, Emitter<RolesState> emit) async {
    emit(RolesLoading());

    try {
      final response = await http.post(
        Uri.parse(
            'http://192.168.1.189:3000/roles'), // Cambia a la URL adecuada
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'id': event.id,
          'name': event.name,
          'image': event.image,
          'route': event.route,
        }),
      );

      if (response.statusCode == 201) {
        emit(RolesSuccess(message: 'Rol creado con éxito.'));
      } else {
        emit(RolesFailure(error: 'Error al crear el rol'));
      }
    } catch (error) {
      emit(RolesFailure(error: error.toString()));
    }
  }
}
