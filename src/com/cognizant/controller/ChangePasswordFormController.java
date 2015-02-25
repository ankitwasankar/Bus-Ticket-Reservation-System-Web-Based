package com.cognizant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.model.AdminModel;
import com.cognizant.model.BusOperatorModel;
import com.cognizant.model.UserModel;

/**
 * Servlet implementation class ChangePasswordController
 */
public class ChangePasswordFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePasswordFormController() {
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
		HttpSession session = request.getSession();
		String oldPassword = request.getParameter("oldpassword");
		String newPassword = request.getParameter("newpassword");
		String confirmPassword = request.getParameter("confirmpassword");
		String msg = "";

		if (newPassword.equals(confirmPassword)) {
			if (String.valueOf(session.getAttribute("type")).equalsIgnoreCase(
					"user")) {
				UserModel um = new UserModel();
				um.setUserID(String.valueOf(session.getAttribute("userid")));
				um.setPassword(newPassword);
				um.setOldPassword(oldPassword);

				if (um.updatePassword()) {
					msg = " Password changed successfully";
				} else {
					msg = " Old password is incorrect";
				}
				response.sendRedirect("ChangePassword.jsp?msg=" + msg);
			} else if (String.valueOf(session.getAttribute("type"))
					.equalsIgnoreCase("admin")) {
				AdminModel am = new AdminModel();
				am.setPassword(newPassword);
				String uid1 = request.getParameter("uname");
				am.setUserid(uid1);
				am.setOldPassword(oldPassword);
				System.out.println("admin password change in progress..");
				if (am.changeAdminPassword()) {
					msg = " Password changed successfully";
				} else {
					msg = " Old password is incorrect";
				}
				response.sendRedirect("ChangePassword.jsp?msg=" + msg);
			} else {
				BusOperatorModel bom = new BusOperatorModel();
				bom.setEmail(String.valueOf(session.getAttribute("email")));
				bom.setPassword(newPassword);
				bom.setOldPassword(oldPassword);
				if (bom.updatePasswordByEMail()) {
					msg = " Password changed successfully";
				} else {
					msg = " Old password is incorrect";
				}
				response.sendRedirect("ChangePassword.jsp?msg=" + msg);
			}

		} else {
			msg = " Passwords do not match";
			response.sendRedirect("ChangePassword.jsp?msg=" + msg);
		}
	}

}
