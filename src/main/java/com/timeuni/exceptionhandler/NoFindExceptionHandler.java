package com.timeuni.exceptionhandler;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.timeuni.myexception.NoFindException;

@ControllerAdvice
public class NoFindExceptionHandler {
	
	/* 处理位找到异常 */
	@ExceptionHandler(value = {NoFindException.class})
	public ModelAndView handleNoFindException() {
		ModelAndView modelAndView = new ModelAndView("nofind");
		return modelAndView;
	}
}
