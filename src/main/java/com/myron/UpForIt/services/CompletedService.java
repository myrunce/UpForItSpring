package com.myron.UpForIt.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myron.UpForIt.models.Challenge;
import com.myron.UpForIt.models.CompletedChallenge;
import com.myron.UpForIt.models.User;
import com.myron.UpForIt.repositories.CompletedRepo;

@Service
public class CompletedService {
	private CompletedRepo completedRepo;
	
	public CompletedService(CompletedRepo completedRepo) {
		this.completedRepo = completedRepo;
	}
	
	public void saveChallengeAsCompleted(Challenge challenge) {
		CompletedChallenge completed = new CompletedChallenge(challenge.getTheChallenge());
		completedRepo.save(completed);
	}
	
	public List<CompletedChallenge> allCompletedByUser(User user){
		return completedRepo.findByUser(user);
	}
	
	public void saveCompleted(CompletedChallenge completed) {
		completedRepo.save(completed);
	}
}
