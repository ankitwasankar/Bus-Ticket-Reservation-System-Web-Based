package com.cognizant.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cognizant.model.UserModel;

/**
 * Servlet implementation class ForgotPasswordController
 */
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPasswordController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		String email = request.getParameter("email");
		String qstn = request.getParameter("secQstn");
		String ans= request.getParameter("secAns");
		
		if(type.equals("user")){
			String msg="";
			UserModel u1 = new UserModel();
			u1.setEmail(email);
			u1.setSecurityAnswer(ans);
			String pass="";
			try {
				pass = u1.checkAnswer();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(pass!= null && pass.equalsIgnoreCase("")){
				msg="No records for this email";
				response.sendRedirect("password.jsp?msg="+msg);
				
			}
			else{
				msg=pass;
				response.sendRedirect("password.jsp?msg="+msg);
			}
		}
		else{
					
		}
	}
}
