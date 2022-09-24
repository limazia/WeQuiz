import 'package:WeQuiz/core/app_images.dart';
import 'package:WeQuiz/home/home_state.dart';
import 'package:WeQuiz/shared/models/awnser_model.dart';
import 'package:WeQuiz/shared/models/question_model.dart';
import 'package:WeQuiz/shared/models/quiz_model.dart';
import 'package:WeQuiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

import 'home_repository.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
