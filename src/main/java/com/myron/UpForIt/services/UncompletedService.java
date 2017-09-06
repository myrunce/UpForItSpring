package com.myron.UpForIt.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myron.UpForIt.models.Challenge;
import com.myron.UpForIt.models.UncompletedChallenge;
import com.myron.UpForIt.models.User;
import com.myron.UpForIt.repositories.UncompletedRepo;

@Service
public class UncompletedService {
private UncompletedRepo uncompletedRepo;
	
	public UncompletedService(UncompletedRepo uncompletedRepo) {
		this.uncompletedRepo = uncompletedRepo;
	}
	
	public void saveChallengeAsUncompleted(Challenge challenge) {
		UncompletedChallenge uncompleted = new UncompletedChallenge(challenge.getTheChallenge());
		uncompletedRepo.save(uncompleted);
	}
	
	public List<UncompletedChallenge> allCompletedByUser(User user){
		return uncompletedRepo.findByUser(user);
	}
	
	public void deleteUnCompleted(UncompletedChallenge uncompleted) {
		uncompletedRepo.delete(uncompleted);
	}
	
	public void saveUncompleted(UncompletedChallenge uncompleted) {
		uncompletedRepo.save(uncompleted);
	}
	
	

}
