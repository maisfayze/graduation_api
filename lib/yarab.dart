import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IntervalPicker extends StatefulWidget {
  const IntervalPicker({super.key});
  static const id = 'Yaarab';

  @override
  _IntervalPickerState createState() => _IntervalPickerState();
}

class _IntervalPickerState extends State<IntervalPicker> {
  DateTime? selectedDate;
  List<String> intervals = [];

  void addInterval(DateTime startTime, DateTime endTime) {
    final formattedStartTime = DateFormat('HH:mm').format(startTime);
    final formattedEndTime = DateFormat('HH:mm').format(endTime);
    final interval = '$formattedStartTime - $formattedEndTime';
    setState(() {
      intervals.add(interval);
    });
  }

  Future<void> pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        intervals.clear();
      });
    }
  }

  Future<void> pickTimeInterval() async {
    final TimeOfDay? startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (startTime != null) {
      final TimeOfDay? endTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (endTime != null) {
        final DateTime startDateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          startTime.hour,
          startTime.minute,
        );
        final DateTime endDateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          endTime.hour,
          endTime.minute,
        );
        if (endDateTime.isAfter(startDateTime)) {
          addInterval(startDateTime, endDateTime);
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Invalid Interval'),
                content: Text('End time should be after start time.'),
                actions: [
                  ElevatedButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interval Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text(
                selectedDate == null
                    ? 'Choose a Date'
                    : DateFormat('yyyy-MM-dd').format(selectedDate!),
              ),
              onPressed: pickDate,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Add Interval'),
              onPressed: selectedDate == null ? null : pickTimeInterval,
            ),
            SizedBox(height: 20),
            Text(
              'Intervals:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: intervals.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(intervals[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
