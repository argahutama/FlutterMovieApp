import 'dart:io';

import 'package:common/common.dart';
import 'package:data/datasources/db/database_helper.dart';
import 'package:data/datasources/movie_local_data_source.dart';
import 'package:data/datasources/movie_remote_data_source.dart';
import 'package:flutter/services.dart';
import 'package:http/io_client.dart';

@module
abstract class DataSourceModule {
  @preResolve
  Future<IOClient> get ioClient async {
    final sslCert = await rootBundle.load('assets/certificates/certificates.crt');
    SecurityContext securityContext = SecurityContext();
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());

    final client = HttpClient(context: securityContext);
    client.badCertificateCallback = (cert, host, port) => false;
    return IOClient(client);
  }

  @LazySingleton(as: MovieRemoteDataSource)
  MovieRemoteDataSourceImpl get movieRemoteDataSource;

  @LazySingleton(as: MovieLocalDataSource)
  MovieLocalDataSourceImpl get movieLocalDataSource;

  @lazySingleton
  DatabaseHelper get databaseHelper;
}
