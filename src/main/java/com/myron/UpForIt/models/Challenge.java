package com.myron.UpForIt.models;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Challenges")
public class Challenge {
	@Id
	@GeneratedValue
	private Long id;
	private String theChallenge;
	@OneToOne(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
	
	public Challenge() {
		
	}
	
	public Challenge(String challenge, User user) {
		this.theChallenge = challenge;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTheChallenge() {
		return theChallenge;
	}

	public void setTheChallenge(String theChallenge) {
		this.theChallenge = theChallenge;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
