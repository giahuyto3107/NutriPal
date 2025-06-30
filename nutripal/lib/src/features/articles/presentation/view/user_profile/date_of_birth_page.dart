import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/multiple_choice_page_with_plain_text.dart';
import 'package:nutripal/src/features/articles/presentation/viewmodel/user_profile_store.dart';
import 'package:provider/provider.dart';

class DateOfBirthPage extends StatefulWidget {
  const DateOfBirthPage({super.key});

  @override
  State<DateOfBirthPage> createState() => _DateOfBirthPageState();
}

class _DateOfBirthPageState extends State<DateOfBirthPage> {
  int selectedDay = 1;
  int selectedMonth = 1;
  int selectedYear = 1900;

  String get dob => "${selectedDay.toString()}/${selectedMonth.toString()}/${selectedYear.toString()}}";
  
  final List<int> dayList = List.generate(31, (index) => index + 1);
  final List<String> monthNames = [
      "January", "February", "March", "April", "May", "June", "July",
      "August", "September", "October", "November", "December"
  ];
  late final List<String> monthList;
  late final List<int> yearList;

  int dayIndex = 0;
  int monthIndex = 0;
  int yearIndex = 0;

  late FixedExtentScrollController dayController;
  late FixedExtentScrollController monthController;
  late FixedExtentScrollController yearController;

   @override
  void initState() {
    super.initState();
      int currentMonth = DateTime.now().month;
      int currentYear = DateTime.now().year;
      monthList = monthNames.sublist(0, currentMonth);
      yearList = List.generate(currentYear - 1900 + 1, (index) => 1900 + index);

      dayController = FixedExtentScrollController(initialItem: dayIndex);
      monthController = FixedExtentScrollController(initialItem: monthIndex);
      yearController = FixedExtentScrollController(initialItem: yearIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final store = Provider.of<UserProfileStore>(context, listen: false);
      store.setDOB(dob);
    });

  }
 
  @override
  void dispose() {
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Day Picker
        SizedBox(
          width: 60,
          height: 120,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 32,
            diameterRatio: 0.9,
            perspective: 0.003,
            physics: FixedExtentScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            controller: dayController,
            onSelectedItemChanged: (index) => setState(() {
              selectedDay = index+1;
              final store = Provider.of<UserProfileStore>(context, listen: false);
              store.setDOB(dob);
            }),
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index < 0 || index >= dayList.length) return null;
                return Center(
                  child: Text('${dayList[index]}'),
                );
              },
            ),
          ),
        ),
        // Month Picker
        SizedBox(
          width: 100,
          height: 120,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 32,
            diameterRatio: 0.9,
            perspective: 0.003,
            physics: FixedExtentScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            controller: monthController,
            onSelectedItemChanged: (index) => setState(() {
              monthIndex = index;
              selectedMonth = index + 1;
              final store = Provider.of<UserProfileStore>(context, listen: false);
              store.setDOB(dob);
              monthIndex = index;
            } ),
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index < 0 || index >= monthList.length) return null;
                return Center(
                  child: Text('${monthList[index]}'),
                );
              },
            ),
          ),
        ),
        // Year Picker
        SizedBox(
          width: 80,
          height: 120,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 32,
            diameterRatio: 0.9,
            perspective: 0.003,
            physics: FixedExtentScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            controller: yearController,
            onSelectedItemChanged: (index) => setState(() {
              selectedYear = index + 1;
              final store = Provider.of<UserProfileStore>(context, listen: false);
              store.setDOB(dob);
              monthIndex = index;
            }),
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index < 0 || index >= yearList.length) return null;
                return Center(
                  child: Text('${yearList[index]}'),
                );
              },
            ),
          ),
        ),
      ],
    );;
  }
}