import 'package:skynexui_responsive_stylesheet/skynexui_responsive_stylesheet.dart';

import 'package:WeQuiz/core/core.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;
  const ScoreCardWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsive = Responsive(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
          height: 136,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: responsive.value({
               Breakpoints.xs:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              Breakpoints.sm:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              Breakpoints.md:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              Breakpoints.lg:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              Breakpoints.xl:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            }),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(AppImages.icon)),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vamos começar",
                          style: AppTextStyles.heading,
                        ),
                        Text(
                          "Complete os desafios para aprimorar seus conhecimentos",
                          style: AppTextStyles.challengeText,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
