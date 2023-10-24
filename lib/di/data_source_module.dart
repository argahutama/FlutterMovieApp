import 'package:common/common.dart';
import 'package:data/datasources/db/database_helper.dart';
import 'package:data/datasources/movie_local_data_source.dart';
import 'package:data/datasources/movie_remote_data_source.dart';
import 'package:http/http.dart' as http;

@module
abstract class DataSourceModule {
  @lazySingleton
  http.Client get httpClient => http.Client();

  @LazySingleton(as: MovieRemoteDataSource)
  MovieRemoteDataSourceImpl get movieRemoteDataSource;

  @LazySingleton(as: MovieLocalDataSource)
  MovieLocalDataSourceImpl get movieLocalDataSource;

  @lazySingleton
  DatabaseHelper get databaseHelper;
}
