import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/data/workout_data.dart';

class WorkoutPage extends StatefulWidget {
  final String workoutName;
  const WorkoutPage({super.key, required this.workoutName});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.workoutName),
        ),
        body: ListView.builder(
          itemCount: value.getNumberOfExercises(widget.workoutName),
          itemBuilder: (context, index) => Container(
            color: Colors.blue,
            child: ListTile(
              title: Text(
                value
                    .getRelevantWorkout(widget.workoutName)
                    .exercises[index]
                    .name,
              ),
              subtitle: Row(
                children: [
                  Chip(
                    label: Text(
                      '${value
                          .getRelevantWorkout(widget.workoutName)
                          .exercises[index]
                          .weight}kgs' ,
                    ),
                  ),
                  Chip(
                    label: Text(
                      '${value
                          .getRelevantWorkout(widget.workoutName)
                          .exercises[index]
                          .sets} sets',
                    ),
                  ),
                  Chip(
                    label: Text(
                      '${value
                          .getRelevantWorkout(widget.workoutName)
                          .exercises[index]
                          .reps} reps',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
