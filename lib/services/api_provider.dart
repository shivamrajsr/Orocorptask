import 'dart:async';

import 'package:task_oro/task/model/task_model.dart';
import 'package:dio/dio.dart';
class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://reqres.in/api/users?page=2';

  Future<TaskModel> fetchList() async {
    try {
      Timer(Duration(seconds: 2), () {
      });
      Response response = await _dio.get(_url);
      return TaskModel.fromJson(response.data);
    } catch (error, stacktrace) {
      return TaskModel.withError("Connection issue");
    }
  }
}