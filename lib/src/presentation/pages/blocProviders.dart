import 'package:demo_view_shopify/Injection.dart';
import 'package:demo_view_shopify/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:demo_view_shopify/src/domain/useCases/roles/RolesUseCases.dart';
import 'package:demo_view_shopify/src/presentation/pages/admin/home/bloc/AdminHomeBloc.dart';
import 'package:demo_view_shopify/src/presentation/pages/admin/roles/create/RolesCreatePage.dart';
import 'package:demo_view_shopify/src/presentation/pages/admin/roles/create/bloc/RolesBloc.dart';
import 'package:demo_view_shopify/src/presentation/pages/admin/roles/list/bloc/AdminRolesListBloc.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
  BlocProvider<AdminHomeBloc>(create: (context) => AdminHomeBloc()),
  BlocProvider<AdminRolesListBloc>(
      create: (context) => AdminRolesListBloc(locator<RolesUseCases>())),
  BlocProvider(
    create: (context) => RolesBloc(),
    child: RolesCreatePage(),
  )
];
