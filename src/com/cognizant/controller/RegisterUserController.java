package com.cognizant.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.model.UserModel;

/**
 * Servlet implementation class RegisterUserController
 */
public class RegisterUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterUserController() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String firstName = request.getParameter("fName");
		String lastName = request.getParameter("lName");
		String city = request.getParameter("city");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String sq = request.getParameter("sq");
		String sa = request.getParameter("sa");
		
		UserModel um = new UserModel();
		um.setEmail(username);
		um.setPassword(password);
		um.setFirstName(firstName);
		um.setLastName(lastName);
		um.setCity(city);
		um.setAddress(address);
		um.setPhoneNumber(phoneNumber);
		um.setSecurityAnswer(sa);
		um.setSecurityQuestion(sq);
		
		try {
			if(um.insertRegistrationData()){
				System.out.println(username+"::registration successful\nAuto login into dashboard");
				
				/* ----- login into dash-board ------ */
				Boolean login=false;
				try {
					login = um.selectLoginData1();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (login == true) {
					HttpSession session = request.getSession();
					session.setAttribute("email", username);
					session.setAttribute("type", "user");
					String userid = "";
					try {
						userid = um.getUserIDFromEmail(username);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					session.setAttribute("userid", userid);
					System.out.println(userid + " : session set and logged in ");
					response.sendRedirect("indexUser.jsp");
				}
				/* ----- login complete ------ */
			}
			else{
				System.out.println(username+"::registration not successful");
				String msg = "Registration not sucessful. Try after some time.";
				response.sendRedirect("RegisterUser.jsp?msg="+msg);
			}
		} catch (SQLException e) {
			System.out.println(username+"::registration not successful thrown by exception");
			String msg = "Registration not sucessful. Try after some time.";
			response.sendRedirect("RegisterUser.jsp?msg="+msg);
		}

	}

}
