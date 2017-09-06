package com.myron.UpForIt.services;

import org.springframework.stereotype.Service;

import com.myron.UpForIt.models.Challenge;
import com.myron.UpForIt.repositories.ChallengeRepo;

@Service
public class ChallengeService {
	private ChallengeRepo challengeRepo;
	
	public ChallengeService(ChallengeRepo challengeRepo) {
		this.challengeRepo = challengeRepo;
	}
	
	public void saveChallenge(Challenge challenge) {
		challengeRepo.save(challenge);
	}
	
	public void deleteChallenge(Challenge challenge) {
		challengeRepo.delete(challenge);
	}
	
}
