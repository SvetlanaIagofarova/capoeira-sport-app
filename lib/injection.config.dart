// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import 'core/common/datasources/common_local_data_sources.dart' as _i13;
import 'core/common/repository/common_remote_repository.dart' as _i8;
import 'core/common/usecase.dart' as _i3;
import 'core/core_modules.dart' as _i30;
import 'core/network/dio_client.dart' as _i4;
import 'core/network/network_info.dart' as _i23;
import 'core/utils/hive_service.dart' as _i6;
import 'src/features/news_and_events/events/application/bloc/event_bloc.dart'
    as _i15;
import 'src/features/news_and_events/events/data/datasources/event_local_data_source.dart'
    as _i17;
import 'src/features/news_and_events/events/data/datasources/event_remote_data_sources.dart'
    as _i10;
import 'src/features/news_and_events/events/data/models/event_model.dart'
    as _i9;
import 'src/features/news_and_events/events/data/repos/event_repository_impl.dart'
    as _i27;
import 'src/features/news_and_events/events/domain/entities/event.dart' as _i29;
import 'src/features/news_and_events/events/domain/repos/event_repository.dart'
    as _i26;
import 'src/features/news_and_events/events/domain/usecases/get_event_list.dart'
    as _i16;
import 'src/features/news_and_events/news/application/bloc/news_bloc.dart'
    as _i21;
import 'src/features/news_and_events/news/data/datasources/news_local_data_source.dart'
    as _i14;
import 'src/features/news_and_events/news/data/datasources/news_remote_data_source.dart'
    as _i12;
import 'src/features/news_and_events/news/data/models/news_model.dart' as _i11;
import 'src/features/news_and_events/news/data/repos/news_repository_impl.dart'
    as _i25;
import 'src/features/news_and_events/news/domain/entities/news.dart' as _i28;
import 'src/features/news_and_events/news/domain/repos/news_repository.dart'
    as _i24;
import 'src/features/news_and_events/news/domain/usecases/get_news_list.dart'
    as _i22;
import 'src/features/schools/domain/entities/school.dart' as _i18;
import 'src/features/schools/domain/repos/schools_repository.dart' as _i19;
import 'src/features/schools/domain/usecases/get_particular_school.dart' as _i7;
import 'src/features/schools/domain/usecases/get_schools_list.dart' as _i20;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModules = _$CoreModules();
    gh.factory<_i3.NoParams>(() => _i3.NoParams());
    gh.singleton<_i4.DioClient>(() => coreModules.dioClient);
    gh.singleton<_i5.InternetConnectionChecker>(
        () => coreModules.internetConnectionChecker);
    gh.singleton<_i6.HiveService>(() => coreModules.hiveServiceImpl);
    gh.factory<_i7.Params>(() => _i7.Params(id: gh<int>()));
    gh.singleton<_i8.CommonRemoteRepository<_i9.EventModel>>(
      () => _i10.EventRemoteDataSourceImpl(client: gh<_i4.DioClient>()),
      instanceName: 'EventRemoteDataSourceImpl',
    );
    gh.singleton<_i8.CommonRemoteRepository<_i11.NewsModel>>(
      () => _i12.NewsRemoteDataSourceImpl(client: gh<_i4.DioClient>()),
      instanceName: 'NewsRemoteDataSourceImpl',
    );
    gh.singleton<_i13.CommonLocalDataSource<_i11.NewsModel>>(
      () => _i14.NewsLocalDataSourceImpl(hiveService: gh<_i6.HiveService>()),
      instanceName: 'NewsLocalDataSourceImpl',
    );
    gh.factory<_i15.EventBloc>(() => _i15.EventBloc(
        getEventList: gh<_i16.GetEventList>(instanceName: 'GetEventList')));
    gh.singleton<_i13.CommonLocalDataSource<_i9.EventModel>>(
      () => _i17.EventLocalDataSourceImpl(hiveService: gh<_i6.HiveService>()),
      instanceName: 'EventLocalDataSourceImpl',
    );
    gh.singleton<_i3.UseCase<List<_i18.School>, _i7.Params>>(
      () => _i7.GetParticularSchool(gh<_i19.SchoolsRepository>()),
      instanceName: 'GetParticularSchool',
    );
    gh.singleton<_i3.UseCase<List<_i18.School>, _i3.NoParams>>(
      () => _i20.GetSchoolsList(gh<_i19.SchoolsRepository>()),
      instanceName: 'GetSchoolsList',
    );
    gh.factory<_i21.NewsBloc>(() => _i21.NewsBloc(
        getNewsList: gh<_i22.GetNewsList>(instanceName: 'GetNewsList')));
    gh.factory<_i23.NetworkInfo>(
        () => _i23.NetworkInfoImpl(gh<_i5.InternetConnectionChecker>()));
    gh.singleton<_i24.NewsRepository>(() => _i25.NewsRepositoryImpl(
          remoteDataSource: gh<_i12.NewsRemoteDataSourceImpl>(
              instanceName: 'NewsRemoteDataSourceImpl'),
          localDataSource: gh<_i14.NewsLocalDataSourceImpl>(
              instanceName: 'NewsLocalDataSourceImpl'),
          networkInfo: gh<_i23.NetworkInfo>(),
        ));
    gh.singleton<_i26.EventRepository>(() => _i27.EventRepositoryImpl(
          remoteDataSource: gh<_i10.EventRemoteDataSourceImpl>(
              instanceName: 'EventRemoteDataSourceImpl'),
          localDataSource: gh<_i17.EventLocalDataSourceImpl>(
              instanceName: 'EventLocalDataSourceImpl'),
          networkInfo: gh<_i23.NetworkInfo>(),
        ));
    gh.singleton<_i3.UseCase<List<_i28.News>, _i3.NoParams>>(
      () => _i22.GetNewsList(gh<_i24.NewsRepository>()),
      instanceName: 'GetNewsList',
    );
    gh.singleton<_i3.UseCase<List<_i29.Event>, _i3.NoParams>>(
      () => _i16.GetEventList(gh<_i26.EventRepository>()),
      instanceName: 'GetEventList',
    );
    return this;
  }
}

class _$CoreModules extends _i30.CoreModules {}
