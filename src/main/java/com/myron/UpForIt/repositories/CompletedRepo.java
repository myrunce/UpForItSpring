package com.myron.UpForIt.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.myron.UpForIt.models.CompletedChallenge;
import com.myron.UpForIt.models.User;

@Repository
public interface CompletedRepo extends CrudRepository<CompletedChallenge, Long> {
	List<CompletedChallenge> findByUser(User user);
}
