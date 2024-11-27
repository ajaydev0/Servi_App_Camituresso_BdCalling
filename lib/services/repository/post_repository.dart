import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:servi_app_camituresso/const/app_api_url.dart';
import 'package:servi_app_camituresso/services/api/services/api_post_services.dart';

class ImageRepository {
  Future<dynamic> imageUpdate(XFile imagePath) async {
    File image = File(imagePath.path);
    print("😍😍😍😍😍😍😍😍  😍😍😍😍😍😍😍😍");
    try {
      FormData formData = FormData();
      if (imagePath.path.isNotEmpty) {
        final file = File(imagePath.path);
        if (await file.exists()) {
          String fileName = file.path.split('/').last;
          var mimeType = lookupMimeType(file.path);

          formData = FormData.fromMap({
            'image': await MultipartFile.fromFile(file.path,
                filename: fileName, contentType: MediaType.parse(mimeType!)),
          });

          //
          // formData.files.add("image", );
        }
      }
      if (formData.files.isNotEmpty) {
        print(
            " Convert Image 😍😍😍😍😍😍😍 ${formData.files[0]} 😍😍😍😍😍😍😍");
        formData = amniData!;
        // return formData;
      }
      // return false;
    } catch (e) {
      print(e);
    }
  }

  FormData? amniData;
  amniAri(
      titleController,
      priceController,
      pricungBreakdownController,
      descriptionController,
      selectedServicesCategory,
      locationController) async {
    await ApiPostServices().apiPostServices(
      url: AppApiUrl.createPostUrl,
      body: {
        "title": titleController.text,
        "price": priceController.text,
        "price_breakdown": pricungBreakdownController.text,
        "description": descriptionController.text,
        "category": selectedServicesCategory.value,
        "location": locationController.text,
        "image": amniData,
      },
    );
  }
}
