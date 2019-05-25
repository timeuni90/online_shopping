package com.timeuni.mybean;

import javax.validation.constraints.NotEmpty;

public class NewUser {
	@NotEmpty(message = "请输入姓名")
	private String name;
	@NotEmpty(message = "请输入账号")
	private String username;
	@NotEmpty(message = "请输入密码")
	private String password;
	@NotEmpty(message = "请确认密码")
	private String confirmPassword;
	
	@Override
	public String toString() {
		return "NewUser [name=" + name + ", username=" + username + ", password=" + password + ", confirmPassword="
				+ confirmPassword + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
}
