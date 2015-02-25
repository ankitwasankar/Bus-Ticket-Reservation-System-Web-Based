package com.cognizant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.helper.Validate;
import com.cognizant.model.BusOperatorModel;
import com.cognizant.model.UserModel;

/**
 * Servlet implementation class EditProfileController
 */
public class EditProfileFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProfileFormController() {
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
		String msg = "";
		if (request.getParameter("type") == null) {
			HttpSession session = request.getSession();
			UserModel um = new UserModel();
			String fname = request.getParameter("firstname");
			String lname = request.getParameter("lastname");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String email = request.getParameter("email");
			String phone = request.getParameter("phonenumber");

			um.setFirstName(fname);
			um.setLastName(lname);
			um.setAddress(address);
			um.setCity(city);
			um.setEmail(email);
			um.setPhoneNumber(phone);
			um.setUserID(String.valueOf(session.getAttribute("userid")));
			System.out.println(String.valueOf(session.getAttribute("userid")));

			// validations here
			msg = Validate.validateUserProfile(fname, lname, address, city,
					email, phone);
			System.out.println("msg="+msg);
			if (!msg.equals("")) {
				System.out.println("msg="+msg);
				response.sendRedirect("EditProfile.jsp?msg="+msg);	
			}
			
			else{
				if (um.updateUserProfileData()) {
					msg = " Profile Updated successfully.";
				} else {
					msg = " Profile can not be updated.";
				}
				response.sendRedirect("EditProfile.jsp?msg=" + msg);
			}

		} else {
			HttpSession session = request.getSession();
			BusOperatorModel bom = new BusOperatorModel();
			
			String fname = request.getParameter("firstname");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String email = request.getParameter("email");
			String phone = request.getParameter("phonenumber");
			
			bom.setName(fname);
			bom.setAddress(address);
			bom.setCity(city);
			bom.setEmail(email);
			bom.setPhoneNumber(phone);
			bom.setOperatorID(String.valueOf(session.getAttribute("userid")));
			
			// validations here
			msg = Validate.validateBusOperatorProfile(fname, address, city,
					email, phone);
			System.out.println("msg="+msg);
			if (!msg.equals("")) {
				System.out.println("msg="+msg);
				response.sendRedirect("EditProfile.jsp?msg="+msg);	
			}
			
			else{
				if (bom.updateUserProfileData()) {
					msg = " Profile Updated successfully.";
				} else {
					msg = " Profile can not be updated.";
				}
				response.sendRedirect("EditProfile.jsp?msg=" + msg);
				
			}
		}
	}

}
