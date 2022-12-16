part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class callTaskEvent extends  TaskEvent{ }
