// A. Define an abstract class named Role
abstract class Role {
  void displayRole();
}

// B. Create a class Person
class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {}
}

// C. Create a class Student that extends Person
class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student(super.name, super.age, super.address, this.studentID, this.grade,
      this.courseScores);

  double calculateTheAverageScore() {
    double sum = courseScores.reduce((a, b) => a + b);
    return courseScores.isNotEmpty ? sum / courseScores.length : 0.0;
  }

  @override
  void displayRole() {
    print('Role: Student');
  }

  void displayStudentInfo() {
    print('Student Information:');
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Average Score: ${calculateTheAverageScore()}');
  }
}

// D. Create a class Teacher that extends Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(
      super.name, super.age, super.address, this.teacherID, this.coursesTaught);

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void displayTeacherInfo() {
    print('Teacher Information:');
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Courses Taught:');
    for (var course in coursesTaught) {
      print('- $course');
    }
  }
}

// E. Create a class StudentManagementSystem
void main() {
  // Student instance
  List<double> mirSakhawatHossenScores = [90, 85, 82];
  Student mirSakhawatHossen = Student('Mir Sakhawat Hossen', 30, 'Rajbari',
      '20160360', 'F+', mirSakhawatHossenScores);
  mirSakhawatHossen.displayStudentInfo();

  print('');

  // Teacher instance
  List<String> khanSirCourses = ['Math', 'English', 'Bangla'];
  Teacher khanSir =
      Teacher('Khan Sir', 40, 'Satkhira', '59751', khanSirCourses);
  khanSir.displayTeacherInfo();
}
