import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:italian_food/model/model.dart';

class ApiFoodProvider {
  static Future<List<FoodModel>> getFood() async {
    try {
      log('getFood');

      var response = await Dio()
          .get("https://www.themealdb.com/api/json/v1/1/filter.php?a=Italian");

      return (response.data['meals'] as Iterable)
          .map((e) => FoodModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      rethrow;
    }
  }

  static Future<FoodModel> getFoodId(String id) async {
    try {
      log('getFoodByid');
      var response = await Dio()
          .get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id");
      return FoodModel.fromJson(response.data['meals'][0]);
    } on DioError catch (e) {
      debugPrint(e.response.toString());

      rethrow;
    }
  }
}
