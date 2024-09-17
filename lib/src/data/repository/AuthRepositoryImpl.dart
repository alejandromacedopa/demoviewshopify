import 'package:demo_view_shopify/src/data/dataSource/remote/services/AuthServices.dart';
import 'package:demo_view_shopify/src/domain/models/AuthResponse.dart';
import 'package:demo_view_shopify/src/domain/models/User.dart';
import 'package:demo_view_shopify/src/domain/repository/AuthRepository.dart';
import 'package:demo_view_shopify/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthServices authServices;
  AuthRepositoryImpl(this.authServices);

  @override
  Future<AuthResponse?> getUsersSession() {
    throw UnimplementedError();
  }

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authServices.login(email, password);
  }

  @override
  Future<bool> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authServices.register(user);
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) {
    throw UnimplementedError();
  }
}
