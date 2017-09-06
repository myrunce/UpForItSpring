package com.myron.UpForIt.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.myron.UpForIt.models.UncompletedChallenge;
import com.myron.UpForIt.models.User;

@Repository
public interface UncompletedRepo extends CrudRepository<UncompletedChallenge, Long> {
	List<UncompletedChallenge> findByUser(User user);
}
