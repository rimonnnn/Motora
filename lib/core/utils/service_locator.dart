

// GetIt sl = GetIt.instance;

// void setupServicesLocator() {
//   DioHelper dio = DioHelper();

//   sl.registerLazySingleton<DioHelper>(() => dio);
//   sl.registerLazySingleton<AuthRepo>(() => AuthRepo(sl()));
//   sl.registerLazySingleton<HomeRepo>(() => HomeRepo(sl()));
//   sl.registerLazySingleton(() => StorageHelper());
//   sl.registerFactory(() => AuthCubit(sl<AuthRepo>(), sl<StorageHelper>()));
//   sl.registerFactory(() => ProductsCubit(sl<HomeRepo>()));
//   sl.registerFactory(() => CategoriesCubit(sl<HomeRepo>()));

//   // Scoped by ShellRoute: same instance shared across Main/ProductDetails/Cart
//   sl.registerLazySingleton<CartLocalDataSource>(() => CartLocalDataSource());

//   sl.registerLazySingleton<CartCubit>(
//     () => CartCubit(sl<CartLocalDataSource>()),
//   );
//   sl.registerLazySingleton<FavoriteLocalDataSource>(
//     () => FavoriteLocalDataSource(),
//   );

//   // Scoped globally: نفس الـ instance في كل التطبيق عشان الـ favorites تفضل متزامنة
//   sl.registerLazySingleton<FavoriteCubit>(
//     () => FavoriteCubit(sl<FavoriteLocalDataSource>()),
//   );
// }
