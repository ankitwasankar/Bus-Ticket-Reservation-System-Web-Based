package com.cognizant.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.model.BusModel;
import com.cognizant.model.BusOperatorModel;
import com.cognizant.model.PaymentModel;
import com.cognizant.model.UserModel;

/**
 * Servlet implementation class DeleteBusOperatorController
 */
public class DeleteBusOperatorFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBusOperatorFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phoneNumber=request.getParameter("phonenumber");
		String passWord=request.getParameter("password");
		PrintWriter out=response.getWriter();
		HttpSession session = request.getSession();
		String eMail=String.valueOf(session.getAttribute("email"));

		BusOperatorModel model=new BusOperatorModel();
		BusModel model1=new BusModel();
		PaymentModel model2=new PaymentModel();
		ResultSet rs=null;
		ResultSet rs1=null;
		model.setEmail(eMail);
		model.setPassword(passWord);
		
		try{
			Integer.parseInt(phoneNumber);
		}
		catch(Exception e){
			response.sendRedirect("DeleteBusOperator.jsp?msg=expected numeric value");
		}
		
		
		try
		{
		rs=model.selectLoginData1();
		
		if(!rs.next()){
			response.sendRedirect("DeleteBusOperator.jsp?msg=Invalid details");
		}
		else{
			rs.beforeFirst();
		while(rs.next())
		{
			String busoperatorId=rs.getString(1);
			model2.setOperatorID(busoperatorId);
			if(rs.getString(6).equals(phoneNumber))
			{
				
				boolean result=model.deleteOperatorAccount();
				System.out.println("Result:"+result);
				rs1=model1.ViewBusData();
				while(rs1.next())
				{
					model1.setBusId(rs1.getString(1));
					model1.DeleteBusData();
				}
				boolean result2=model2.deletePaymentData();
				System.out.println("result2:"+result2);
				response.sendRedirect("");
			}
			else
			{
				
				out.print("Sorry.Invalid Credentials!");
			}
		}
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
