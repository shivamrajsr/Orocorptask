part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {

}
class TaskLoading extends  TaskState{

}
class TaskLoaded extends  TaskState{
  final TaskModel response;
  const TaskLoaded({required this.response});

}
class TaskError extends TaskState{
   final String? message;
   const TaskError({this.message});
}