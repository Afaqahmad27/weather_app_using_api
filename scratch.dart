import 'dart:io';

void main(){
  performTask();
}

performTask() async{
  task1();
  String newData= await task2();
  task3(newData);
}

void task3(String task2Data) {
  String result='Task 3 Data';
  print('Task 3 Completed  with $task2Data');
}

Future<String> task2() async{
  String result='';
  Duration threeSeconds=Duration(seconds: 3);
  await Future.delayed(threeSeconds,(){
    result='Task 2 Data';
    print('Task 2 Completed');
  });
  return result;
}

void task1() {
  String result='Task 1 Data';
  print('Task 1 Completed');
}