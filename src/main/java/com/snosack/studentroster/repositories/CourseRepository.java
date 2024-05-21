package com.snosack.studentroster.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.snosack.studentroster.models.Course;
import com.snosack.studentroster.models.Student;

@Repository
public interface CourseRepository extends CrudRepository<Course, Long> {
	List<Course> findAll();
	List<Course> findAllByStudents(Student student);
	List<Course> findByStudentsNotContains(Student student);

}
