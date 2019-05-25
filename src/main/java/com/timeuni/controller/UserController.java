package com.timeuni.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.timeuni.bean.User;
import com.timeuni.mybean.NewUser;
import com.timeuni.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	/* 登录视图 */
	@RequestMapping(value = "/login")
	public String handleUserLoginRequest() {
		return "login";
	}

	/* 用户登录验证 */
	@RequestMapping(value = "/user_validation", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> handleUserLoginValidationRequest(@Valid User user, BindingResult bindingResult,
			HttpSession session) {
		return userService.userLoginValidation(user, bindingResult, session);
	}
	
	/* 退出登录 */
	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String handleQuitRequest(HttpSession session) {
		session.removeAttribute("userId");
		return "redirect:/login";
	}
	
	/* 注册视图 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String handleUserRegisterReqeust() {
		return "register";
	}
	
	/* 注册验证 */
	@RequestMapping(value = "/register_validation", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> handleUserRegisterValidation(@Valid NewUser newUser, BindingResult result) {
		return userService.userRegisterValidation(newUser, result);
	}
	
}
