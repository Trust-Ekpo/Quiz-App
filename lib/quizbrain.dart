import 'package:flutter/material.dart';

class QuizBrian {
  int questionNumber = 0;
  int answeredcorrectly = 0;
  int answeredwrongly = 0;
  int finalScore = 0;

  var theQuestions = [
    "How many legs does a butterfly have?",
    "How many legs does a kangaroo have?",
    "How many legs does an octopus have?",
    "How many legs does a cat have?",
    "How many legs does a snake have?",
  ];
  var theOptions = [
    [0, 5, 6, 2],
    [0, 2, 4, 8],
    [2, 4, 6, 8],
    [1, 2, 3, 4],
    [4, 2, 1, 0]
  ];

  var correctAnswer = [6, 2, 3, 4, 0];

  var explanationc = [
    "Correct Answer!: Butterflies have six legs.They also have four wings, with scales on each wing.",
    "Correct Answer!: Officially, kangaroos have two legs and a tail. However, new research suggests that the tail functions as a third leg. But since this has not been thoroughly confirmed, the count remains at two.",
    "Correct Answer!: Most people think that octopi have eight legs since they have eight tentacles, but this is not true. Six of the tentacles function as arms, and two function as legs. Therefore, an octopus has six arms, two legs, and most bizarre, three hearts.",
    "Correct Answer!: Cats typically have four legs. They also typically have 18 toes, five on each front paw and four on each back paw.",
    "Correct Answer!: Snakes have no legs. However, basal snakes such as boas and pythons, have evolutionary remnants of the legs their ancestors once had. This is similar to how humans have tailbones but no tail.",
  ];
  var explanationw = [
    "Wrong Answer!: Butterflies have six legs.They also have four wings, with scales on each wing.",
    "Wrong Answer!: Officially, kangaroos have two legs and a tail. However, new research suggests that the tail functions as a third leg. But since this has not been thoroughly confirmed, the count remains at two.",
    "Wrong Answer!: Most people think that octopi have eight legs since they have eight tentacles, but this is not true. Six of the tentacles function as arms, and two function as legs. Therefore, an octopus has six arms, two legs, and most bizarre, three hearts.",
    "Wrong Answer!: Cats typically have four legs. They also typically have 18 toes, five on each front paw and four on each back paw.",
    "Wrong Answer!: Snakes have no legs. However, basal snakes such as boas and pythons, have evolutionary remnants of the legs their ancestors once had. This is similar to how humans have tailbones but no tail.",
  ];

  showQuestion() {
    return theQuestions[questionNumber];
  }

  showChoices(int index) {
    return theOptions[questionNumber][index];
  }

  nextQuestion() {
    if (questionNumber < theQuestions.length - 1) questionNumber++;
  }

  isFinished() {
    if (questionNumber >= theQuestions.length - 1)
      return true;
    else {
      return false;
    }
  }

  restQuiz() {
    questionNumber = 0;
    answeredcorrectly = 0;
    answeredwrongly = 0;
    finalScore = 0;
  }
}
