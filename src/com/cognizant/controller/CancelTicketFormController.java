package com.cognizant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.model.BookingModel;

/**
 * Servlet implementation class CancelTicketController
 */
public class CancelTicketFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelTicketFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BookingModel model = new BookingModel();
		HttpSession session = request.getSession();
		if (session.getAttribute("type")!=null) {
			String bid = request.getParameter("bookingid");
			
			if(bid==null){
				response.sendRedirect("CancelTicket.jsp?msg=BookingID can't be null&bid="+bid);
			}
			
			model.setBookingID(bid);
			System.out.println("bookingid:"+request.getParameter("bookingid"));
			model.setUserID(String.valueOf(session.getAttribute("userid")));
			System.out.println("userid:"+session.getAttribute("userid").toString());
			int i = model.deleteBookingUser();
			if(i>0){
				response.sendRedirect("CancelTicket.jsp?msg=Booking cancelled sucessfully&bid="+bid);
			}
			else{
				response.sendRedirect("CancelTicket.jsp?msg=No such Booking Id Found &bid="+bid);
			}
		} else {
			String bid = request.getParameter("bookingid");
			model.setBookingID(bid);
			model.setUserID(request.getParameter("email"));
			int i=model.deleteBookingGuest();
			if(i>0){
				response.sendRedirect("CancelTicket.jsp?msg=Booking cancelled sucessfully&bid="+bid);
			}
			else{
				response.sendRedirect("CancelTicket.jsp?msg=No such Booking Id Found &bid="+bid);
			}
		}
	}

}
