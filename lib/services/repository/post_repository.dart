import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'package:mime/mime.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/screens/conversation_screen/model/message_list_model.dart';
import 'package:servi_app_camituresso/services/api/services/api_patch_services.dart';
import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';
import 'package:servi_app_camituresso/services/app_storage/app_auth_storage.dart';

class ImageRepository {
  Future<MessageListModel?> imageUploadWithData2({
    required String url,
    String? imagePath,
    required Map<String, dynamic> body,
  }) async {
    try {
      // Initialize FormData with the body fields
      FormData formData = FormData.fromMap(body);

      // Check if an image path is provided
      if (imagePath != null) {
        final file = File(imagePath);
        if (await file.exists()) {
          String fileName = file.path.split('/').last;
          String? mimeType = lookupMimeType(file.path);

          // Add the file to FormData
          formData.files.add(
            MapEntry(
              'image', // Key as per the API documentation
              await MultipartFile.fromFile(
                file.path,
                filename: fileName,
                contentType:
                    mimeType != null ? MediaType.parse(mimeType) : null,
              ),
            ),
          );
        }
      }

      // Send the API request
      var data = await ApiPostServices().apiPostServices(
        url: url,
        body: formData,
        token: AppAuthStorage().getToken(),
      );

      if (data != null) {
        print("💕💕💕💕💕 ${data["data"].runtimeType}");
        if (data["data"].runtimeType != Null) {
          print("💕💕💕💕💕 $data");
          // return MessageListModel.fromJson(data["data"]);
        }
      }
    } catch (e) {
      log("$e");
    }

    return null;
  }

  Future<dynamic> imageUploadWithData({
    required String url,
    String? imagePath,
    required Map<String, dynamic> body,
  }) async {
    try {
      // Initialize FormData with the body fields
      FormData formData = FormData.fromMap(body);

      // Check if an image path is provided
      if (imagePath != null) {
        final file = File(imagePath);
        if (await file.exists()) {
          String fileName = file.path.split('/').last;
          String? mimeType = lookupMimeType(file.path);

          // Add the file to FormData
          formData.files.add(
            MapEntry(
              'image', // Key as per the API documentation
              await MultipartFile.fromFile(
                file.path,
                filename: fileName,
                contentType:
                    mimeType != null ? MediaType.parse(mimeType) : null,
              ),
            ),
          );
        }
      }

      // Send the API request
      var data = await ApiPostServices().apiPostServices(
        url: url,
        body: formData,
        token: AppAuthStorage().getToken(),
      );

      if (data != null) {
        return data;
      }
    } catch (e) {
      log("$e");
    }

    return null;
  }

  Future<dynamic> profilePatchImageUpdate({
    required String url,
    String? imagePath,
    required Map<String, dynamic> body,
  }) async {
    try {
      // Initialize FormData with the body fields
      FormData formData = FormData.fromMap(body);

      // Check if an image path is provided
      if (imagePath != null) {
        final file = File(imagePath);
        if (await file.exists()) {
          String fileName = file.path.split('/').last;
          String? mimeType = lookupMimeType(file.path);

          // Add the file to FormData
          formData.files.add(
            MapEntry(
              'image', // Key as per the API documentation
              await MultipartFile.fromFile(
                file.path,
                filename: fileName,
                contentType:
                    mimeType != null ? MediaType.parse(mimeType) : null,
              ),
            ),
          );
        }
      }

      // Send the API request
      var data = await ApiPatchServices().apiPatchServices(
        url: url,
        body: formData,
        token: AppAuthStorage().getToken(),
      );

      if (data != null) {
        return data;
      }
    } catch (e) {
      log("$e");
    }

    return null;
  }

  // Future<dynamic> profilePatchImageUpdate({
  //   ///////////
  //   String? imagePath,
  //   String? name,
  //   String? number,
  //   String? dateOfBirth,
  //   String? address,
  // }) async {
  //   try {
  //     FormData formData = FormData();

  //     if (imagePath != null) {
  //       final file = File(imagePath);
  //       if (await file.exists()) {
  //         String fileName = file.path.split('/').last;
  //         var mimeType = lookupMimeType(file.path);

  //         formData = FormData.fromMap({
  //           'image': await MultipartFile.fromFile(file.path,
  //               filename: fileName, contentType: MediaType.parse(mimeType!)),
  //         });
  //       }
  //     }
  //     if (name != null) {
  //       formData.fields.add(MapEntry("name", name));
  //     }
  //     if (number != null) {
  //       formData.fields.add(MapEntry("contact", number));
  //     }
  //     if (dateOfBirth != null) {
  //       formData.fields.add(MapEntry("dateOfBirth", dateOfBirth));
  //     }
  //     if (address != null) {
  //       formData.fields.add(MapEntry("location", address));
  //     }

  //     var data = ApiPatchServices()
  //         .apiPatchServices(url: AppApiUrl.updateProfileUrl, body: formData);
  //     if (data != null) {
  //       // print(data);
  //       return data;
  //     }
  //   } catch (e) {
  //     log("$e");
  //   }
  //   return null;
  // }
}
