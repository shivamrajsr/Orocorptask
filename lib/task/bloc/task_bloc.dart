
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../../repository/api_repo_impl.dart';
import '../../repository/api_repository.dart';
import '../model/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    final ApiRepositoryImpl apiRepository = ApiRepositoryImpl();

    on<callTaskEvent>((event, emit) async {
      try {
        emit(TaskLoading());
        final mList = await apiRepository.fetchList();
        emit(TaskLoaded(response: mList));
        if (mList.error != null) {
          emit(TaskError(message:mList.error));
        }
      } on NetworkError {
        emit(const TaskError(message: 'Error'));
      }
    });
  }
}

