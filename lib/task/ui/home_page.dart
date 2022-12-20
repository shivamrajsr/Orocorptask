import 'package:flutter/material.dart';
import 'package:task_oro/task/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskBloc _newBloc = TaskBloc();

  @override
  void initState() {
    _newBloc.add(callTaskEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Orocorp'),centerTitle: true,),
        body: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: BlocProvider(
        create: (_) => _newBloc,
        child: BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            if (state is TaskError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TaskInitial) {
                return _buildLoading();
              } else if (state is TaskLoading) {
                return _buildLoading();
              } else if (state is TaskLoaded) {
                return _buildCard(context, state.response);
              } else if (state is TaskError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, TaskModel model) {
    return ListView.builder(
      itemCount: model.data!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Name: ${model.data![index].firstName}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
