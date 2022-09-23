import 'package:trading_courses/home_screen/providers/courses.dart';
import '../models/instructor_model.dart';

class Instructors {
  final tusharGhoneDetails = Instructor(
      id: '1',
      name: 'Tushar R. Ghone',
      designation: 'SEBI Registered Advisor',
      studentCount: 25035,
      aboutInstructor:
          'I have come from a humble Maharashtrian background. I have a never say ‘NO’ attitude to my life right from my childhood. With my dedication and focus, I was able to achieve 17th rank in Maharashtra Technical Board of Diploma in Mechanical Engineering from VJTI, Mumbai. After Engineering I had to do job since I couldn’t afford exorbitant fees of MBA.Finally, in my mid career, I completed by post graduation in Finance Management.',
      courseCount: 16,
      coursesOffered: Courses().authorCourses('Tushar R. Ghone'),
      socialMedia: ['Twitter', 'LinkedIn', 'Facebook']);

  get tusharGhone {
    return tusharGhoneDetails;
  }
}
