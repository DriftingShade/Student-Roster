package com.snosack.studentroster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snosack.studentroster.models.Student;
import com.snosack.studentroster.repositories.StudentRepository;

@Service
public class StudentService {
	@Autowired
	StudentRepository studentRepo;
	
	public List<Student> allStudents() {
		return studentRepo.findAll();
	}
	
	public Student createStudent(Student student) {
		return studentRepo.save(student);
	}
	
	public Student findStudent(Long id) {
		Optional<Student> optionalStudent = studentRepo.findById(id);
		if(optionalStudent.isPresent()) {
			return optionalStudent.get();
		} else {
			return null;
		}
	}
	
	public void updateStudent(Student student) {
	    studentRepo.save(student);
	}

}
