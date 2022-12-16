

import '../services/api_provider.dart';
import '../task/model/task_model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<TaskModel> fetchList() {
    return _provider.fetchList();
  }
}

class NetworkError extends Error {}