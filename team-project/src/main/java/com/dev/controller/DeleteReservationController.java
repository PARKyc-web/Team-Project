package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.ReservationService;

public class DeleteReservationController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 int reservationId = Integer.parseInt(req.getParameter("reservationId"));
		 
		 ReservationService rvService = ReservationService.getInstance();
		 rvService.deleteReservation(reservationId);
		
		Utils.forward(req, resp, "myPage/deleteReservation.tiles");		
	}
	
}