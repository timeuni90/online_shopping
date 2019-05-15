package com.timeuni.mybean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SendMessage {
	private String fromId;
	private String message;
	@JsonFormat(pattern = "HH:mm")
	private Date time;
	private String name;
	private String image;

	public String getFromId() {
		return fromId;
	}

	public void setFromId(String fromId) {
		this.fromId = fromId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}
