import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'package:mime/mime.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/services/api/services/api_patch_services.dart';

class ImageRepository {
  Future<dynamic> imageUpdate({
    String? imagePath,
    String? name,
    String? number,
    String? dateOfBirth,
    String? address,
  }) async {
    try {
      FormData formData = FormData();

      if (imagePath != null) {
        final file = File(imagePath);
        if (await file.exists()) {
          String fileName = file.path.split('/').last;
          var mimeType = lookupMimeType(file.path);

          formData = FormData.fromMap({
            'image': await MultipartFile.fromFile(file.path,
                filename: fileName, contentType: MediaType.parse(mimeType!)),
          });
        }
      }
      if (name != null) {
        formData.fields.add(MapEntry("name", name));
      }
      if (number != null) {
        formData.fields.add(MapEntry("contact", number));
      }
      if (dateOfBirth != null) {
        formData.fields.add(MapEntry("dateOfBirth", dateOfBirth));
      }
      if (address != null) {
        formData.fields.add(MapEntry("location", address));
      }

      var data = ApiPatchServices()
          .apiPatchServices(url: AppApiUrl.updateProfileUrl, body: formData);
      if (data != null) {
        // print(data);
      }
    } catch (e) {
      log("$e");
    }
  }

  // FormData? imageData;
  // amniAri(
  //     titleController,
  //     priceController,
  //     pricungBreakdownController,
  //     descriptionController,
  //     selectedServicesCategory,
  //     locationController) async {
  //   await ApiPostServices().apiPostServices(
  //     url: AppApiUrl.createPostUrl,
  //     body: {
  //       "title": titleController.text,
  //       "price": priceController.text,
  //       "price_breakdown": pricungBreakdownController.text,
  //       "description": descriptionController.text,
  //       "category": selectedServicesCategory.value,
  //       "location": locationController.text,
  //       "image": imageData,
  //     },
  //   );
  // }

  //   Future<bool> profileUpdate({
  //   String? imagePath,
  //   String? name,
  //   String? email,
  //   String? contactNumber,
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
  //           'image': await MultipartFile.fromFile(
  //             file.path,
  //             filename: fileName,
  //             contentType: MediaType.parse(mimeType!),
  //           ),
  //         });
  //       }
  //     }

  //     if (name != null) {
  //       formData.fields.add(MapEntry("name", name));
  //     }
  //     // if (email != null) {
  //     //   formData.fields.add(MapEntry("email", email));
  //     // }
  //     // if (address != null) {
  //     //   formData.fields.add(MapEntry("location", address));
  //     // }
  //     // if (contactNumber != null) {
  //     //   formData.fields.add(MapEntry("contact", contactNumber));
  //     // }

  //     final repoData = await ApiPatchServices().apiPatchServices(
  //       url: AppApiUrl.domaine,
  //       body: formData,
  //     );
  //     if (repoData != null) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } on DioException catch (e) {
  //     log("Dio error: ${e.message}, data: ${e.response?.data}");
  //     log("error form user profile $e");
  //     return false;
  //   } catch (e) {
  //     log("error form user profile $e");
  //     return false;
  //   }
  // }
}
