import 'package:demo_view_shopify/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/RegisterUseCase.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  GetUserSessionUseCase getUserSession;
  AuthUseCases(
      {required this.login,
      required this.register,
      required this.getUserSession});
}
