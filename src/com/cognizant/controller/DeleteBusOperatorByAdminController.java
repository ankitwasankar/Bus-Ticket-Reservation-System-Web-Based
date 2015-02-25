package com.cognizant.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cognizant.model.BusOperatorModel;

/**
 * Servlet implementation class DeleteBusOperatorByAdminController
 */
public class DeleteBusOperatorByAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBusOperatorByAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BusOperatorModel model=new BusOperatorModel();
		String operatorID=request.getParameter("operatorid");
		model.setOperatorID(operatorID);
		model.deleteOperatorAccountFromAdmin();
		response.sendRedirect("DeleteBusOperatorByAdmin.jsp?msg=operator deleted successfully");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
