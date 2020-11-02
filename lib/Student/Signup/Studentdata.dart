class StudentData {
  String fname,
      mname,
      lname,
      div,
      semister,
      branch,
      aboutyou = "",
      rollno,
      studentId;
  int attendace = 0;
  DateTime pickeddate;


  StudentData({this.aboutyou,this.attendace,this.branch, this.div,this.fname,this.lname, this.mname,this.pickeddate})
}