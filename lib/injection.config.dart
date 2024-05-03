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

import 'core/common/datasources/common_local_data_sources.dart' as _i12;
import 'core/common/repository/common_remote_repository.dart' as _i7;
import 'core/common/usecase.dart' as _i3;
import 'core/core_modules.dart' as _i26;
import 'core/network/dio_client.dart' as _i4;
import 'core/network/network_info.dart' as _i19;
import 'core/utils/hive_service.dart' as _i6;
import 'src/features/news_and_events/events/application/bloc/event_bloc.dart'
    as _i14;
import 'src/features/news_and_events/events/data/datasources/event_local_data_source.dart'
    as _i16;
import 'src/features/news_and_events/events/data/datasources/event_remote_data_sources.dart'
    as _i9;
import 'src/features/news_and_events/events/data/models/event_model.dart'
    as _i8;
import 'src/features/news_and_events/events/data/repos/event_repository_impl.dart'
    as _i23;
import 'src/features/news_and_events/events/domain/entities/event.dart' as _i25;
import 'src/features/news_and_events/events/domain/repos/event_repository.dart'
    as _i22;
import 'src/features/news_and_events/events/domain/usecases/get_event_list.dart'
    as _i15;
import 'src/features/news_and_events/news/application/bloc/news_bloc.dart'
    as _i17;
import 'src/features/news_and_events/news/data/datasources/news_local_data_source.dart'
    as _i13;
import 'src/features/news_and_events/news/data/datasources/news_remote_data_source.dart'
    as _i11;
import 'src/features/news_and_events/news/data/models/news_model.dart' as _i10;
import 'src/features/news_and_events/news/data/repos/news_repository_impl.dart'
    as _i21;
import 'src/features/news_and_events/news/domain/entities/news.dart' as _i24;
import 'src/features/news_and_events/news/domain/repos/news_repository.dart'
    as _i20;
import 'src/features/news_and_events/news/domain/usecases/get_news_list.dart'
    as _i18;

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
    gh.singleton<_i7.CommonRemoteRepository<_i8.EventModel>>(
      () => _i9.EventRemoteDataSourceImpl(client: gh<_i4.DioClient>()),
      instanceName: 'EventRemoteDataSourceImpl',
    );
    gh.singleton<_i7.CommonRemoteRepository<_i10.NewsModel>>(
      () => _i11.NewsRemoteDataSourceImpl(client: gh<_i4.DioClient>()),
      instanceName: 'NewsRemoteDataSourceImpl',
    );
    gh.singleton<_i12.CommonLocalDataSource<_i10.NewsModel>>(
      () => _i13.NewsLocalDataSourceImpl(hiveService: gh<_i6.HiveService>()),
      instanceName: 'NewsLocalDataSourceImpl',
    );
    gh.factory<_i14.EventBloc>(() => _i14.EventBloc(
        getEventList: gh<_i15.GetEventList>(instanceName: 'GetEventList')));
    gh.singleton<_i12.CommonLocalDataSource<_i8.EventModel>>(
      () => _i16.EventLocalDataSourceImpl(hiveService: gh<_i6.HiveService>()),
      instanceName: 'EventLocalDataSourceImpl',
    );
    gh.factory<_i17.NewsBloc>(() => _i17.NewsBloc(
        getNewsList: gh<_i18.GetNewsList>(instanceName: 'GetNewsList')));
    gh.factory<_i19.NetworkInfo>(
        () => _i19.NetworkInfoImpl(gh<_i5.InternetConnectionChecker>()));
    gh.singleton<_i20.NewsRepository>(() => _i21.NewsRepositoryImpl(
          remoteDataSource: gh<_i11.NewsRemoteDataSourceImpl>(
              instanceName: 'NewsRemoteDataSourceImpl'),
          localDataSource: gh<_i13.NewsLocalDataSourceImpl>(
              instanceName: 'NewsLocalDataSourceImpl'),
          networkInfo: gh<_i19.NetworkInfo>(),
        ));
    gh.singleton<_i22.EventRepository>(() => _i23.EventRepositoryImpl(
          remoteDataSource: gh<_i9.EventRemoteDataSourceImpl>(
              instanceName: 'EventRemoteDataSourceImpl'),
          localDataSource: gh<_i16.EventLocalDataSourceImpl>(
              instanceName: 'EventLocalDataSourceImpl'),
          networkInfo: gh<_i19.NetworkInfo>(),
        ));
    gh.singleton<_i3.UseCase<List<_i24.News>, _i3.NoParams>>(
      () => _i18.GetNewsList(gh<_i20.NewsRepository>()),
      instanceName: 'GetNewsList',
    );
    gh.singleton<_i3.UseCase<List<_i25.Event>, _i3.NoParams>>(
      () => _i15.GetEventList(gh<_i22.EventRepository>()),
      instanceName: 'GetEventList',
    );
    return this;
  }
}

class _$CoreModules extends _i26.CoreModules {}
