package com.snosack.studentroster.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.snosack.studentroster.models.Course;
import com.snosack.studentroster.models.Dorm;
import com.snosack.studentroster.models.Student;
import com.snosack.studentroster.services.CourseService;
import com.snosack.studentroster.services.DormService;
import com.snosack.studentroster.services.StudentService;

import jakarta.validation.Valid;

@Controller
public class HomeController {
	@Autowired
	DormService dormServ;
	
	@Autowired
	StudentService studentServ;
	
//	Student Roster 1:m
	
	@GetMapping("/")
	public String index(@ModelAttribute("dorm") Dorm dorm, Model model) {
		List<Dorm> dorms = dormServ.allDorms();
		model.addAttribute("dorms", dorms);
		return "index.jsp";
	}
	
	@GetMapping("/dorms/new")
	public String newDorm(@ModelAttribute("dorm") Dorm dorm, Model model) {
		return "createdorm.jsp";
	}
	
	@PostMapping("/createdorm")
	public String createDorm(@Valid @ModelAttribute("dorm") Dorm dorm, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("dorm", dorm);
			return "createdorm.jsp";
		} else {
			dormServ.createDorm(dorm);
			return "redirect:/";
		}
	}
	
	@GetMapping("/students/new")
	public String newStudent(Model model, @ModelAttribute("student") Student student) {
		model.addAttribute("dorms", dormServ.allDorms());
		return "createstudent.jsp";
	}
	
	@PostMapping("/newstudent")
	public String createStudent(@RequestParam("dorm") Long id, @Valid @ModelAttribute("student") Student student, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("dorms", dormServ.allDorms());
			return "createstudent.jsp";
		} else {
			studentServ.createStudent(student);
			return "redirect:/";
		}
	}
	
	@GetMapping("/dorms/{id}")
	public String viewDorm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("dorm", dormServ.findDorm(id));
		List<Student> students = studentServ.allStudents();
	    model.addAttribute("students", students);
		return "view_dorm.jsp";
	}
	
	@GetMapping("/students/remove/{studentId}")
	public String removeStudentFromDorm(@PathVariable("studentId") Long studentId) {
	    Student student = studentServ.findStudent(studentId);
	    if (student != null && student.getDorm() != null) {
	        Long dormId = student.getDorm().getId(); 
	        student.setDorm(null); 
	        studentServ.updateStudent(student); 
	        return "redirect:/dorms/" + dormId; 
	    }
	    return "redirect:/"; 
	}
	
	@PostMapping("/dorms/{dormId}/addStudent")
	public String addStudentToDorm(@PathVariable("dormId") Long dormId, @RequestParam("studentId") Long studentId) {
	    Student student = studentServ.findStudent(studentId);
	    Dorm dorm = dormServ.findDorm(dormId);
	    if (student != null && dorm != null) {
	        student.setDorm(dorm);
	        studentServ.updateStudent(student);
	    }
	    return "redirect:/dorms/" + dormId;
	}
	
//	Student Roster n:m
	
	@Autowired
	private CourseService courseService;
	
	@GetMapping("/classes")
	public String viewClasses(Model model) {
		model.addAttribute("courses", courseService.allCourses());
		return "viewClasses.jsp";
	}
	
	@GetMapping("/classes/new")
	public String newClass(@ModelAttribute("course") Course course) {
		return "newClass.jsp";
	}
	
	@PostMapping("/classes/new")
	public String addClass(@ModelAttribute("course") Course course) {
		courseService.addCourse(course);
		return "redirect:/classes";
	}
	
	@GetMapping("/classes/{id}")
	public String viewClass(@PathVariable("id") Long id, Model model) {
		model.addAttribute("course", courseService.findById(id));
		return "viewClass.jsp";
	}
	
	@GetMapping("/students/{studentId}")
	public String viewStudent(@PathVariable("studentId") Long studentId, Model model) {
		Student student = studentServ.findStudent(studentId);
		model.addAttribute("student", student);
		model.addAttribute("availableCourses", courseService.getUnassignedCourses(student));
		model.addAttribute("assignedCourses", courseService.getAssignedCourses(student));
		return "viewStudent.jsp";
	}
	
	@PostMapping("/students/{studentId}/add-class")
	public String assignCourse(@PathVariable("studentId") Long studentId, @RequestParam("courseId") Long courseId) {
		Student student = studentServ.findStudent(studentId);
		Course course = courseService.findById(courseId);
		course.getStudents().add(student);
		courseService.updateCourse(course);
		return "redirect:/students/"+studentId;
	}
	
	@GetMapping("/students/{studentId}/classes/{courseId}/drop")
	public String dropCourse(@PathVariable("studentId") Long studentId, @PathVariable("courseId") Long courseId) {
		Student student = studentServ.findStudent(studentId);
		Course course = courseService.findById(courseId);
		courseService.dropCourse(course, student);
		return "redirect:/students/"+studentId;
	}
}
