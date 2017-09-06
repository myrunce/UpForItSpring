package com.myron.UpForIt.controllers;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myron.UpForIt.models.Challenge;
import com.myron.UpForIt.models.CompletedChallenge;
import com.myron.UpForIt.models.Role;
import com.myron.UpForIt.models.UncompletedChallenge;
import com.myron.UpForIt.models.User;
import com.myron.UpForIt.services.ChallengeService;
import com.myron.UpForIt.services.CompletedService;
import com.myron.UpForIt.services.UncompletedService;
import com.myron.UpForIt.services.UserService;
import com.myron.UpForIt.validator.UserValidator;

@Controller
public class UFIController {
	private UserService userService;
    private UserValidator userValidator;
    private ChallengeService challengeService;
    private CompletedService completedService;
    private UncompletedService uncompletedService;
     
    
    public UFIController(UserService userService, UserValidator userValidator, ChallengeService challengeService, CompletedService completedService, UncompletedService uncompletedService) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.challengeService = challengeService;
        this.completedService = completedService;
        this.uncompletedService = uncompletedService;
    }
    
	@PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, RedirectAttributes redirectAttrs) {
        // NEW
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "loginPage.jsp";
        }
        else {
        	userService.saveWithUserRole(user);
        	redirectAttrs.addFlashAttribute("message", "Account Created!");
        	return "redirect:/login";
        }
    }


	@RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model, @Valid @ModelAttribute("user") User user) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successfull!");
        }
        return "loginPage.jsp";
    }
	
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model, HttpSession session) {
        String username = principal.getName();
        User theUser = userService.findByUsername(username);
        Challenge userChallenge = theUser.getChallenge();
        model.addAttribute("currentUser", userService.findByUsername(username));
        model.addAttribute("challenge", userChallenge);
        return "homePage.jsp";
    }
    
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        model.addAttribute("users", userService.findAll());
        return "adminPage.jsp";
    }
    
    @PostMapping("/saveChallenge")
    public String saveChallenge(@RequestParam("challenge") String challenge, Principal principal) {
    	String username = principal.getName();
    	User theUser = userService.findByUsername(username);
    	Challenge theChallenge = new Challenge(challenge, theUser);
    	theUser.setChallenge(theChallenge);
    	userService.updateUser(theUser);
    	challengeService.saveChallenge(theChallenge);
    	return "redirect:/";
    }
    
    @PostMapping("/saveCompleted")
    public String saveCompleted(@ModelAttribute("completed") CompletedChallenge completed, Principal principal, RedirectAttributes redirectAttrs) {
    	String username = principal.getName();
    	User theUser = userService.findByUsername(username);
    	completed.setUser(theUser);
    	List<CompletedChallenge> allCompleted = theUser.getCompletedChallenges();
    	allCompleted.add(completed);
    	theUser.setCompletedChallenges(allCompleted);
    	Challenge challenge = theUser.getChallenge();
    	challenge = null;
    	theUser.setChallenge(challenge);
    	completedService.saveCompleted(completed);
    	userService.updateUser(theUser);
    	redirectAttrs.addFlashAttribute("message", "Groovy! you finished a challenge! you finished " + theUser.getCompletedChallenges().size() + " challenge(s)!");
    	return "redirect:/";
    }
    
    @PostMapping("/saveUncompleted")
    public String saveUncompleted(@ModelAttribute("uncompleted") UncompletedChallenge uncompleted, Principal principal, RedirectAttributes redirectAttrs) {
    	String username = principal.getName();
    	User theUser = userService.findByUsername(username);
    	uncompleted.setUser(theUser);
    	List<UncompletedChallenge> allUncompleted = theUser.getUnompletedChallenges();
    	allUncompleted.add(uncompleted);
    	theUser.setUnompletedChallenges(allUncompleted);
    	Challenge challenge = theUser.getChallenge();
    	challenge = null;
    	theUser.setChallenge(challenge);
    	uncompletedService.saveUncompleted(uncompleted);
    	userService.updateUser(theUser);
    	redirectAttrs.addFlashAttribute("message", "Wack you didn't finish a challenge... you did not finish " + theUser.getUnompletedChallenges().size() + " challenge(s)!");
    	return "redirect:/";
    }
    
    @RequestMapping("/completed")
    public String allCompleted(Model model, Principal principal) {
    	String username = principal.getName();
    	User theUser = userService.findByUsername(username);
    	List<CompletedChallenge> allCompleted = theUser.getCompletedChallenges();
    	model.addAttribute("completed", allCompleted);
    	return "completed.jsp";
    }
    
    @RequestMapping("/uncompleted")
    public String allUncompleted(Model model, Principal principal) {
    	String username = principal.getName();
    	User theUser = userService.findByUsername(username);
    	List<UncompletedChallenge> allUncompleted = theUser.getUnompletedChallenges();
    	model.addAttribute("uncompleted", allUncompleted);
    	return "uncompleted.jsp";
    }
    
}
