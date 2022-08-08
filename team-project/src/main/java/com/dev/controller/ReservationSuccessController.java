package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Controller;
import com.dev.common.Utils;
import com.dev.service.ReservationService;

public class ReservationSuccessController implements Controller {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReservationService reservationService = ReservationService.getInstance();
		int result = reservationService.insertReservation(req.getParameter("memberId"), Integer.parseInt(req.getParameter("hotelId")), req.getParameter("checkIn"), req.getParameter("checkOut"), Integer.parseInt(req.getParameter("totalPrice")));
		
		req.setAttribute("success", result);
		
		Utils.forward(req, resp, "reservation/reservationSuccess.tiles");
	}
}
