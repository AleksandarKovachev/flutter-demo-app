import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/features/animal_image/data/repositories/animal_image_repository_impl.dart';
import 'package:flutter_app/features/animal_image/domain/usecases/get_dog_image.dart';
import 'package:flutter_app/features/animal_image/domain/usecases/get_fox_image.dart';
import 'package:flutter_app/features/animal_image/presentation/bloc/animal_image_bloc.dart';
import 'package:flutter_app/features/cat_fact/data/repositories/cat_fact_repository_impl.dart';
import 'package:flutter_app/features/cat_fact/domain/usecases/get_cat_facts.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/service/animal_image_service.dart';
import 'core/service/cat_fact_service.dart';
import 'core/service/number_trivia_service.dart';
import 'core/service/post_api_service.dart';
import 'core/util/input_converter.dart';
import 'features/animal_image/data/datasources/animal_image_remote_data_source.dart';
import 'features/animal_image/domain/repositories/animal_image_repository.dart';
import 'features/animal_image/domain/usecases/get_cat_image.dart';
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
    ),
  );

  sl.registerFactory(
    () => AnimalImageBloc(
      getCatImage: sl(),
      getDogImage: sl(),
      getFoxImage: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  sl.registerLazySingleton(() => GetCatFacts(sl()));

  sl.registerLazySingleton(() => GetDogImage(sl()));
  sl.registerLazySingleton(() => GetFoxImage(sl()));
  sl.registerLazySingleton(() => GetCatImage(sl()));

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

  sl.registerLazySingleton<AnimalImageRepository>(
    () => AnimalImageRepositoryImpl(
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

  sl.registerLazySingleton<AnimalImageRemoteDataSource>(
    () => AnimalImageRemoteDataSourceImpl(service: sl()),
  );

  // Services
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<AnimalImageService>(() => AnimalImageService(sl()));
  sl.registerLazySingleton<CatFactService>(() => CatFactService(sl()));
  sl.registerLazySingleton<NumberTriviaService>(() => NumberTriviaService(sl()));
  sl.registerLazySingleton<PostApiService>(() => PostApiService(sl()));

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => DataConnectionChecker());
}
