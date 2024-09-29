import 'dart:convert';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  void _onRegisterButtonPressed(
      RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());

    try {
      final response = await http.post(
        Uri.parse('http://10.70.16.125:3000/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'name': event.name,
          'lastname': event.lastname,
          'email': event.email,
          'image': event.image,
          'phone': event.phone,
          'password': event.password,
        }),
      );

      if (response.statusCode == 201) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(error: 'Error al registrar usuario'));
      }
    } catch (error) {
      emit(RegisterFailure(error: error.toString()));
    }
  }
}
