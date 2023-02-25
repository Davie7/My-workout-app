import 'package:flutter/material.dart';

import '../models/exercise.dart';
import '../models/workout.dart';

class WorkoutData extends ChangeNotifier {
  List<Workout> workoutList = [
    Workout(
      name: 'Chest',
      exercises: [
        Exercise(
          name: 'Bench Press',
          weight: '20',
          reps: '10',
          sets: '2',
        ),
      ],
    ),
  ];

  // get number of exercises in that workout.
  int getNumberOfExercises(String workoutName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    return relevantWorkout.exercises.length;
  }

  // get the list of workouts
  List<Workout> getWorkoutlist() {
    return workoutList;
  }

  // add a workout
  void addWorkout(String name) {
    workoutList.add(
      Workout(
        name: name,
        exercises: [
          Exercise(
            name: name,
            weight: '',
            reps: '',
            sets: '',
          ),
        ],
      ),
    );

    notifyListeners();
  }

  // add an exercise to a workout
  void addExercise(String workoutName, String exerciseName, String weight,
      String reps, String sets) {
    // find the relevant workout
    Workout relevantWorkout = getRelevantWorkout(workoutName);

    relevantWorkout.exercises.add(
      Exercise(
        name: exerciseName,
        weight: weight,
        reps: reps,
        sets: sets,
      ),
    );

    notifyListeners();
  }

  // check off exercise
  void checkOffExercise(String workoutName, String exerciseName) {
    Exercise relevantExercise = getRelevantExercise(workoutName, exerciseName);

    relevantExercise.isCompleted != relevantExercise.isCompleted;
    notifyListeners();
  }

  // get the relevant workout given the workout name.
  Workout getRelevantWorkout(String workoutName) {
    Workout relevantWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);

    return relevantWorkout;
  }

  // get the relevant workout given the workout name and exercise name.
  Exercise getRelevantExercise(String workoutName, String exerciseName) {
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    Exercise relevantExercise = relevantWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);

    return relevantExercise;
  }
}
