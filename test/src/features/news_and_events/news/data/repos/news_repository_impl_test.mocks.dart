// Mocks generated by Mockito 5.4.4 from annotations
// in capoeirasport_project/test/src/features/news_and_events/news/data/repos/news_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:capoeirasport_project/core/network/dio_client.dart' as _i2;
import 'package:capoeirasport_project/core/network/network_info.dart' as _i9;
import 'package:capoeirasport_project/core/utils/hive_service.dart' as _i8;
import 'package:capoeirasport_project/src/features/news_and_events/news/data/datasources/news_local_data_source.dart'
    as _i7;
import 'package:capoeirasport_project/src/features/news_and_events/news/data/datasources/news_remote_data_source.dart'
    as _i4;
import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDioClient_0 extends _i1.SmartFake implements _i2.DioClient {
  _FakeDioClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNewsModel_1 extends _i1.SmartFake implements _i3.NewsModel {
  _FakeNewsModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NewsRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsRemoteDataSourceImpl extends _i1.Mock
    implements _i4.NewsRemoteDataSourceImpl {
  MockNewsRemoteDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get path => (super.noSuchMethod(
        Invocation.getter(#path),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#path),
        ),
      ) as String);

  @override
  _i2.DioClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeDioClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.DioClient);

  @override
  _i3.NewsModel fromJson(Map<String, dynamic>? json) => (super.noSuchMethod(
        Invocation.method(
          #fromJson,
          [json],
        ),
        returnValue: _FakeNewsModel_1(
          this,
          Invocation.method(
            #fromJson,
            [json],
          ),
        ),
      ) as _i3.NewsModel);

  @override
  Map<String, dynamic> toJson(_i3.NewsModel? body) => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [body],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);

  @override
  List<_i3.NewsModel> getResult(dynamic data) => (super.noSuchMethod(
        Invocation.method(
          #getResult,
          [data],
        ),
        returnValue: <_i3.NewsModel>[],
      ) as List<_i3.NewsModel>);

  @override
  _i6.Future<List<_i3.NewsModel>> getListOfThings() => (super.noSuchMethod(
        Invocation.method(
          #getListOfThings,
          [],
        ),
        returnValue: _i6.Future<List<_i3.NewsModel>>.value(<_i3.NewsModel>[]),
      ) as _i6.Future<List<_i3.NewsModel>>);

  @override
  _i6.Future<_i3.NewsModel> getThing({required int? id}) => (super.noSuchMethod(
        Invocation.method(
          #getThing,
          [],
          {#id: id},
        ),
        returnValue: _i6.Future<_i3.NewsModel>.value(_FakeNewsModel_1(
          this,
          Invocation.method(
            #getThing,
            [],
            {#id: id},
          ),
        )),
      ) as _i6.Future<_i3.NewsModel>);

  @override
  _i6.Future<_i3.NewsModel> postThing({required _i3.NewsModel? body}) =>
      (super.noSuchMethod(
        Invocation.method(
          #postThing,
          [],
          {#body: body},
        ),
        returnValue: _i6.Future<_i3.NewsModel>.value(_FakeNewsModel_1(
          this,
          Invocation.method(
            #postThing,
            [],
            {#body: body},
          ),
        )),
      ) as _i6.Future<_i3.NewsModel>);

  @override
  _i6.Future<_i3.NewsModel> putThing({
    required int? id,
    required _i3.NewsModel? body,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putThing,
          [],
          {
            #id: id,
            #body: body,
          },
        ),
        returnValue: _i6.Future<_i3.NewsModel>.value(_FakeNewsModel_1(
          this,
          Invocation.method(
            #putThing,
            [],
            {
              #id: id,
              #body: body,
            },
          ),
        )),
      ) as _i6.Future<_i3.NewsModel>);

  @override
  _i6.Future<void> deleteThing({required int? id}) => (super.noSuchMethod(
        Invocation.method(
          #deleteThing,
          [],
          {#id: id},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [NewsLocalDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockNewsLocalDataSourceImpl extends _i1.Mock
    implements _i7.NewsLocalDataSourceImpl {
  MockNewsLocalDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.BoxType get boxType => (super.noSuchMethod(
        Invocation.getter(#boxType),
        returnValue: _i8.BoxType.newsList,
      ) as _i8.BoxType);

  @override
  _i6.Future<List<_i3.NewsModel>> getLastTypeModelList() => (super.noSuchMethod(
        Invocation.method(
          #getLastTypeModelList,
          [],
        ),
        returnValue: _i6.Future<List<_i3.NewsModel>>.value(<_i3.NewsModel>[]),
      ) as _i6.Future<List<_i3.NewsModel>>);

  @override
  _i6.Future<void> cacheTypeModelList(
          List<_i3.NewsModel>? typeModelListToCache) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheTypeModelList,
          [typeModelListToCache],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i9.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
}
