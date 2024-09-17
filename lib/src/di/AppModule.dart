import 'package:demo_view_shopify/src/data/dataSource/remote/services/AuthServices.dart';
import 'package:demo_view_shopify/src/data/repository/AuthRepositoryImpl.dart';
import 'package:demo_view_shopify/src/domain/repository/AuthRepository.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  //SERVICE AUTH
  @injectable
  AuthServices get authServices => AuthServices();

  //SERVICE REPOSITORY
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authServices);

  //USECASES AUTH
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      getUserSession: GetUserSessionUseCase(authRepository));
}
