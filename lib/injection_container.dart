import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_app/core/service/cat_fact_service.dart';
import 'package:flutter_app/features/cat_fact/data/repositories/cat_fact_repository_impl.dart';
import 'package:flutter_app/features/cat_fact/domain/usecases/get_cat_facts.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/service/number_trivia_service.dart';
import 'core/util/input_converter.dart';
import 'features/cat_fact/data/datasources/cat_fact_remote_data_source.dart';
import 'features/cat_fact/domain/repositories/cat_fact_repository.dart';
import 'features/cat_fact/presentation/bloc/cat_fact_bloc.dart';
import 'features/nuber_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'features/nuber_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'features/nuber_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'features/nuber_trivia/domain/repositories/number_trivia_repository.dart';
import 'features/nuber_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'features/nuber_trivia/domain/usecases/get_random_number_trivia.dart';
import 'features/nuber_trivia/presentation/bloc/number_trivia_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => NumberTriviaBloc(
      concrete: sl(),
      inputConverter: sl(),
      random: sl(),
    ),
  );

  sl.registerFactory(
    () => CatFactBloc(
      getCatFacts: sl(),
      inputConverter: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  sl.registerLazySingleton(() => GetCatFacts(sl()));

  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<CatFactRepository>(
    () => CatFactRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(service: sl()),
  );

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<CatFactRemoteDataSource>(
    () => CatFactRemoteDataSourceImpl(service: sl()),
  );

  // Services
  sl.registerLazySingleton(() => NumberTriviaService.create());
  sl.registerLazySingleton(() => CatFactService.create());

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DataConnectionChecker());
}
