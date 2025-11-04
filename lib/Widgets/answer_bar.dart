import 'package:flutter/material.dart';


class AnswerBar extends StatefulWidget {
  final String answerOptionText;

  const AnswerBar({super.key, required this.answerOptionText});

  @override
  State<AnswerBar> createState() => _AnswerBarState();
}

class _AnswerBarState extends State<AnswerBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: AlignmentGeometry.center,
          width: 400,
          height: 75,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/kertasPipihPol.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(widget.answerOptionText),
    );
  }
}