package com.myron.UpForIt.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.myron.UpForIt.models.Challenge;


@Repository
public interface ChallengeRepo extends CrudRepository<Challenge, Long> {

}
