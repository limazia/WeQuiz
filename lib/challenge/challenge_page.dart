import 'package:skynexui_responsive_stylesheet/skynexui_responsive_stylesheet.dart';
import 'dart:async';

import 'package:WeQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:WeQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:WeQuiz/result/result_page.dart';
import 'package:WeQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'challenge_controller.dart';
import 'widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  var isDisable = false;

  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
  }

  void onSelected(bool value) {
    if (value) {
      controller.qtdAnwserRight++;
    }

    nextPage();
  }

  void setButton(bool value) {
    isDisable = value;

    setState(() {
      Timer(Duration(milliseconds: 200), () => isDisable = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                  question: e, onSelected: onSelected, setButton: setButton),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: responsive.value({
              Breakpoints.xs:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              Breakpoints.sm:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              Breakpoints.md:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              Breakpoints.lg:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              Breakpoints.xl:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            }),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (value < widget.questions.length)
                          Expanded(
                              child: NextButtonWidget.white(
                            label: "Pular",
                            onTap: isDisable ? () => null : nextPage,
                          )),
                        if (value == widget.questions.length)
                          Expanded(
                              child: NextButtonWidget.green(
                            label: "Confirmar",
                            onTap: () {
                              isDisable
                                  ? () => null
                                  : Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ResultPage(
                                                result:
                                                    controller.qtdAnwserRight,
                                                title: widget.title,
                                                length: widget.questions.length,
                                              )));
                            },
                          )),
                      ],
                    ))),
      ),
    );
  }
}
