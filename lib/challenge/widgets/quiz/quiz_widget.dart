import 'package:skynexui_responsive_stylesheet/skynexui_responsive_stylesheet.dart';

import 'package:WeQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:WeQuiz/core/core.dart';
import 'package:WeQuiz/shared/models/awnser_model.dart';
import 'package:WeQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:WeQuiz/core/app_colors.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.black,
              fontSize: responsive.value({
                Breakpoints.xs: 16,
                Breakpoints.sm: 16,
                Breakpoints.md: 17,
                Breakpoints.lg: 17,
                Breakpoints.xl: 17,
              }),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              anwser: awnser(i),
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: (value) {
                indexSelected = i;

                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onSelected(value));
              },
            ),
        ],
      ),
    );
  }
}
