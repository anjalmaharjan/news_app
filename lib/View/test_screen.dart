import 'package:facebookclone/Api/api.dart';
import 'package:facebookclone/Models/todo/todo_model.dart';
import 'package:facebookclone/View/news/bloc/news_bloc.dart';
import 'package:facebookclone/View/news/bloc/news_event.dart';
import 'package:facebookclone/View/news/bloc/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final Api _api = Api();

  TodoModel? todoModel;
  String title = '';

  bool isLoading = false;

  void getTodoData() async {
    isLoading = true;
    todoModel = await _api.fetchTodoData();
    await Future.delayed(const Duration(seconds: 2));
    todoModel?.title ??= "N/A";
    title = todoModel!.title!;
    isLoading = false;
    setState(() {});
    print(title);
  }

  @override
  void initState() {
    super.initState();
    // getTodoData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(Api())..add(NewsFetchEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Api fetch"),
          ),
          body: BlocBuilder<NewsBloc, NewsState>(
            builder: (BuildContext context, state) {
              if (state is NewsLoadingState) {
                return const CircularProgressIndicator();
              }
              if (state is NewsErrorState) {
                return Text(state.errorMsg);
              }
              if (state is NewsLoadedState) {
                return Text(state.newsModel.articles?[0].title ?? "N/A");
              } else {
                return const SizedBox();
              }
            },
          )
          // isLoading ? const CircularProgressIndicator() : Text(title)
          // FutureBuilder(
          //   future: _api.fetchTodoData(),
          //   builder: (BuildContext context, AsyncSnapshot<TodoModel?> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const CircularProgressIndicator();
          //     } else {
          //       return Text(snapshot.data?.title ?? "N/A");
          //     }
          //   },
          // ),

          ),
    );
  }
}
