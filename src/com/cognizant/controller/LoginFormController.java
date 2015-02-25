package com.cognizant.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.PasswdUserDatabase;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.cognizant.helper.Validate;
import com.cognizant.model.AdminModel;
import com.cognizant.model.BusOperatorModel;
import com.cognizant.model.UserModel;

public class LoginFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final public static Logger logger = Logger
	.getLogger(LoginFormController.class);
	public LoginFormController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String userName = request.getParameter("username");
		String userPassword = request.getParameter("password");
		String type = request.getParameter("type");

		logger.setLevel(Level.INFO);
		
		// form validation
		String errorMessage = Validate.validateLogin(userName, userPassword);
		if (!errorMessage.equalsIgnoreCase("")) {
			if(type.equalsIgnoreCase("user")){
				response.sendRedirect("index.jsp?msg="+errorMessage);
			}
			else if(type.equalsIgnoreCase("busoperator")){
				response.sendRedirect("BusOperatorLogin.jsp?msg="+errorMessage);
			}
			else{
				response.sendRedirect("AdminLogin.jsp?msg="+errorMessage);
			}
		}
		else{
			logger.info(userName + " type:" + type + " validation Successful");
	
			if (type.equalsIgnoreCase("busoperator")) {
				String msg = "";
				BusOperatorModel bom = new BusOperatorModel();
				bom.setEmail(request.getParameter("username"));
				bom.setPassword(request.getParameter("password"));
				try {
					if (bom.selectLoginData()) {
						HttpSession session = request.getSession();
						session.setAttribute("email", userName);
						session.setAttribute("type", type);
						String userid = "";
						userid = bom.getUserIDFromEmail(userName);
						session.setAttribute("userid", userid);
						logger.info(userid + " : session set and logged in ");
						response.sendRedirect("indexBusOperator.jsp");
					} else {
						msg = msg + " User password is incorrect";
						response.sendRedirect("BusOperatorLogin.jsp?msg=" + msg);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else if (type.equalsIgnoreCase("admin")) {
	
				AdminModel am = new AdminModel();
				am.setUserid(userName);
				am.setPassword(userPassword);
				Boolean login = false;
				try {
					login = am.selectAdminLogin();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (login == true) {
					HttpSession session = request.getSession();
					session.setAttribute("email", userName);
					session.setAttribute("userid", userName);
					logger.info(userName);
					session.setAttribute("type", type);
					logger.info(userName + " : session set and logged in ");
					response.sendRedirect("indexAdmin.jsp");
				}else{
					String msg = " Username password not match..";
					response.sendRedirect("index.jsp?msg=" + msg);
				}
	
			} else if (type.equalsIgnoreCase("user")) {
				UserModel um = new UserModel();
				um.setEmail(userName);
				um.setPassword(userPassword);
				Boolean login = false;
				try {
					login = um.selectLoginData1();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (login == true) {
					HttpSession session = request.getSession();
					session.setAttribute("email", userName);
					session.setAttribute("type", type);
					String userid = "";
					try {
						userid = um.getUserIDFromEmail(userName);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					session.setAttribute("userid", userid);
					logger.info(userid + " : session set and logged in ");
					response.sendRedirect("indexUser.jsp");
				}
				else{
					String msg = " Username password not match..";
					response.sendRedirect("index.jsp?msg=" + msg);
				}
			}
		}
	}
}
