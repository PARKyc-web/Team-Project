package com.dev.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.service.HotelService;

public class MainController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		
		
		RequestDispatcher rd = req.getRequestDispatcher("main/main.tiles");		
		rd.forward(req, resp);
	}	
}
