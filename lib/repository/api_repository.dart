import '../task/model/task_model.dart';

abstract class ApiRepository {
  Future<TaskModel> fetchList() ;
}

class NetworkError extends Error {}
