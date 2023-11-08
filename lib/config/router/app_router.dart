import 'package:flutter_authentication_crud/features/auth/presentation/login_screen.dart';
import 'package:flutter_authentication_crud/features/auth/presentation/register_screen.dart';
import 'package:flutter_authentication_crud/features/products/products.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    GoRoute(path: '/login',
    builder: (context, state) => const LoginScreen(),),

    GoRoute(path: '/register',
    builder: (context, state) => const RegisterScreen(),),

    GoRoute(path: '/',
    builder: (context, state) => const ProductsScreen(),),    
  ],
  
  ///! TODO: Bloquear si no se esta autenticando de alguna manera
);