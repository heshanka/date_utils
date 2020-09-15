//GET NUMBER OF DAYS OF CURRENT MONTH

int numDaysCurrentMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;

//GET A DATE AS NUMBER OF DAY OF WEEK :   
// e.g. date.weekday
// if date is a Monday, returns 1

DateTime currentDayOfWeek = DateTime.now().weekday

//////
///   GET A LIST OF LIST OF DAYS AS INTEGERS OF THE CURRENT MONTH IN THE BELOW FORMAT: 
///                 M  T  W  T  F  S  S
///                 31 1  2  3  4  5  6
////                7  8  9  10 11 12 13 ... 
////  OUTPUT => [[31,1,2,3,4,5,6], [7,8,9,10,11,12,13], ...]
//////

  List<List<int>> generateCurrentMonth(){
    //int numDaysCurrentMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
    List<List<int>> rowValueList = [];

    DateTime firstOfMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);

    //Adding the first week
    DateTime endWeek = firstOfMonth.add(Duration(days: 7 - firstOfMonth.weekday));
    DateTime startWeek = endWeek.subtract(Duration(days:6));
    List<int> first = [];
    for (DateTime j = startWeek; j.compareTo(endWeek) <= 0; j = j.add(Duration(days:1))){
      first.add(j.day);
    }
    rowValueList.add(first);

    //Moving the counters
    int i = endWeek.day + 1;
    endWeek = endWeek.add(Duration(days:7));

    //Looping to add the other weeks inside the month
    while(endWeek.month == DateTime.now().month){
      List<int> temp = [];
      for(int j = i; j <= endWeek.day; j++){
        temp.add(j);
      }
      rowValueList.add(temp);
      i = 1 + endWeek.day;
      endWeek = endWeek.add(Duration(days:7));
    }

    //Adding the last week
    List<int> last = [];
    startWeek = endWeek.subtract(Duration(days:6));
    for (DateTime j = startWeek; j.compareTo(endWeek) <= 0; j = j.add(Duration(days:1))){
      last.add(j.day);
    }
    rowValueList.add(last);
    print(rowValueList);
    return rowValueList;
  }

