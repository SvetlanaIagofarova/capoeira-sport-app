// Mocks generated by Mockito 5.4.4 from annotations
// in capoeirasport_project/test/src/features/news_and_events/news/data/datasources/news_remote_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:capoeirasport_project/core/network/dio_client.dart' as _i2;
import 'package:dio/dio.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

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

/// A class which mocks [DioClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioClient extends _i1.Mock implements _i2.DioClient {
  MockDioClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> get(
    String? path, {
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i4.CancelToken? cancelToken,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [path],
          {
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);

  @override
  _i3.Future<dynamic> post(
    String? path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i4.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);

  @override
  _i3.Future<dynamic> put(
    String? path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i4.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);

  @override
  _i3.Future<dynamic> delete(
    String? path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    _i4.Options? options,
    _i4.CancelToken? cancelToken,
    _i4.ProgressCallback? onSendProgress,
    _i4.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [path],
          {
            #data: data,
            #queryParameters: queryParameters,
            #options: options,
            #cancelToken: cancelToken,
            #onSendProgress: onSendProgress,
            #onReceiveProgress: onReceiveProgress,
          },
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
}
