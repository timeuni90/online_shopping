package com.timeuni.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeuni.bean.User;

@Controller
public class UserController {
	
	@RequestMapping(value = "/login")
	public String handleUserLoginRequest() {
		return "login";
	}
	
	@RequestMapping(value = "/user_validation")
	@ResponseBody
	public void handleUserLoginValidationRequest(@Valid User user, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			
		}
	}
	
}
