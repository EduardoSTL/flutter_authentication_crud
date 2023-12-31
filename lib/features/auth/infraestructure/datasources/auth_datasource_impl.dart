import 'package:dio/dio.dart';
import 'package:flutter_authentication_crud/config/constants/enviroment.dart';
import 'package:flutter_authentication_crud/features/auth/domain/datasources/auth_datasource.dart';
import 'package:flutter_authentication_crud/features/auth/domain/entities/user.dart';
import 'package:flutter_authentication_crud/features/auth/infraestructure/errors/auth_errors.dart';
import 'package:flutter_authentication_crud/features/auth/infraestructure/mappers/user_mapper.dart';

class AuthDataSourceImpl extends AuthDataSource {

  final dio = Dio(
    BaseOptions(
      baseUrl: Enviroment.apiUrl,
    )
  );

  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    
    try {
      final response = await dio.post('/auth/login', data: {
        'email': email,
        'password': password
      });

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
      
    } on DioError catch (e) {
      if( e.response?.statusCode == 401 ){
         throw CustomError(e.response?.data['message'] ?? 'Credenciales incorrectas' );
      }
      if ( e.type == DioErrorType.connectionTimeout ){
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }


  }

  @override
  Future<User> register(String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }
  
}
