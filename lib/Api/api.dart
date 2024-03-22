import 'dart:convert';
import 'package:facebookclone/Models/news/news_model.dart';
import 'package:facebookclone/Models/todo/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<NewsModel> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(
          "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json"));
      if (response.statusCode == 200) {
        return NewsModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('$e');
    }
    throw Exception('Something went wrong');
  }

  Future<TodoModel?> fetchTodoData() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
      );
      if (response.statusCode == 200) {
        return TodoModel.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      }
    } catch (e) {
      debugPrint(" ------ Exception ------ $e");
      return null;
    }
    return null;
  }
}
