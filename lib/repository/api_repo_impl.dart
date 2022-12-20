import '../services/api_provider.dart';
import '../task/model/task_model.dart';
import 'api_repository.dart';

class ApiRepositoryImpl implements ApiRepository{
  final _provider = ApiProvider();

  @override
  Future<TaskModel> fetchList() {
    return _provider.fetchList();
  }

}