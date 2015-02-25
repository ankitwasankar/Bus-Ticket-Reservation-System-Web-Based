package com.cognizant.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.model.UserModel;

/**
 * Servlet implementation class DeleteUserController
 */
public class DeleteUserFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phoneNumber=request.getParameter("phonenumber");
		String passWord=request.getParameter("password");
	
		HttpSession session=request.getSession();
		String eMail=String.valueOf(session.getAttribute("email"));
		
		UserModel model=new UserModel();
		ResultSet rs=null;
		model.setEmail(eMail);
		model.setPassword(passWord);
		try
		{
		rs=model.selectLoginData();
		
		while(rs.next())
		{
			String userId=rs.getString(1);
			if(rs.getString(7).equals(phoneNumber))
			{
				model.setUserID(userId);
				Boolean i =model.deleteUserAccount();
				if(i){
					response.sendRedirect("index.jsp?msg=your account deleted succcessfully");
				}else{
					response.sendRedirect("DeleteUser.jsp?msg=Error Occured");
				}
			}
			else
			{
				response.sendRedirect("DeleteUser.jsp?msg=Invalid Details");
				
			}
		}
		response.sendRedirect("DeleteUser.jsp?msg=Invalid Details");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
