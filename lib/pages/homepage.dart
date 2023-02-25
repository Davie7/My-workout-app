import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_tracker/data/workout_data.dart';
import 'package:workout_tracker/pages/workoutpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final newWorkoutNameController = TextEditingController();
  void createNewWorkout() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create new Workout'),
        content: TextField(
          controller: newWorkoutNameController,
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text('Save'),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void goToWorkoutPage(String workoutName){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutPage(workoutName: workoutName,),
      ),
    );
  }

  void save() {
    String newWorkoutName = newWorkoutNameController.text;
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);
    Navigator.of(context).pop();
    clear();
  }

  void cancel() {
    Navigator.of(context).pop();
    clear();
  }

  void clear() {
    newWorkoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('Workout tracker'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: value.getWorkoutlist().length,
          itemBuilder: (context, index) => ListTile(
            title: Text(value.getWorkoutlist()[index].name),
            trailing: IconButton(
              onPressed: () => goToWorkoutPage(value.getWorkoutlist()[index].name),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
      ),
    );
  }
}
