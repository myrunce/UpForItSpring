package com.myron.UpForIt.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="UncompletedChallenges")
public class UncompletedChallenge {
	
	@Id
	@GeneratedValue
	private Long id;
	private String completedChallenge;
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
	
	public UncompletedChallenge() {
		
	}
	
	public UncompletedChallenge(String uncompleted) {
		this.completedChallenge = uncompleted;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCompletedChallenge() {
		return completedChallenge;
	}

	public void setCompletedChallenge(String completedChallenge) {
		this.completedChallenge = completedChallenge;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
