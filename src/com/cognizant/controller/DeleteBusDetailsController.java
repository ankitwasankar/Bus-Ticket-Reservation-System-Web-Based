package com.cognizant.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cognizant.model.BusFrequencyModel;
import com.cognizant.model.BusModel;

/**
 * Servlet implementation class DeleteBusDetailsController
 */
public class DeleteBusDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBusDetailsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BusModel model=new BusModel();
		boolean success,success1;
		BusFrequencyModel model1=new BusFrequencyModel();
		String busID=request.getParameter("busid");
		model.setBusId(busID);
		model1.setBusID(busID);
		success=model.DeleteBusData();
		if(success)
		{
			response.sendRedirect("GetAddedBuses.jsp?msg=Successfully deleted the bus");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
