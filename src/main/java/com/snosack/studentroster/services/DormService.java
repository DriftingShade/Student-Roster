package com.snosack.studentroster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snosack.studentroster.models.Dorm;
import com.snosack.studentroster.repositories.DormRepository;

@Service
public class DormService {
	private final DormRepository dormRepo;
	
	public DormService(DormRepository dormRepo) {
		this.dormRepo = dormRepo;
	}
	
	public List<Dorm> allDorms(){
		return dormRepo.findAll();
	}
	
	public Dorm addDorm(Dorm dorm) {
		return dormRepo.save(dorm);
	}
	
	public Dorm findDorm(Long id) {
		Optional<Dorm> optionalDorm = dormRepo.findById(id);
		if(optionalDorm.isPresent()) {
			return optionalDorm.get();
		}else {
			return null;
		}
	}
}