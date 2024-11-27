import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:servi_app_camituresso/services/api/services/api.dart';
import 'package:servi_app_camituresso/widgets/app_snack_bar/app_snack_bar.dart';

class ApiGetServices {
  final api = AppApi();

  apiGetServices(
    String url, {
    int statusCode = 200,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await api.sendRequest.get(
        url,
        queryParameters: queryParameters,
      );
      if (response.statusCode == statusCode) {
        return response.data;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      debugPrint(e.toString());
      AppSnackBar.error("Check Your Internet Connection");
      return null;
    } on TimeoutException catch (e) {
      // AppSnackBar.error("Something Went Wrong");
      debugPrint(e.toString());
      return null;
    } on DioException catch (e) {
      // AppSnackBar.error("Something Went Wrong");
      debugPrint(e.toString());
      return null;
    } catch (e) {
      // AppSnackBar.error("Something Went Wrong");
      return null;
    }
  }
}
