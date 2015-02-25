package com.cognizant.library;

import java.sql.ResultSet;

public class IDGenerator {
	// generate unique User Id
	public String generateId(String column, String table) {
		String Id = null;
		String temp = null;
		String temp1 = null;
		String reject = table;
		String replace = "";
		int number;
		int max = 0;
		String table1;

		DBConnector dbc = new DBConnector();
		ResultSet rs = null;

		String query = "select " + column + " from " + table + " order by "
				+ column;
		try {
			rs = dbc.fireExecuteQuery(query);
			while (rs.next()) {
				// System.out.println(rs.getString(1));
				temp = rs.getString(1);
				temp1 = temp.replaceAll(reject, replace);
				number = Integer.parseInt(temp1);
				if (number > max) {
					max = number;
				}

			}
			dbc.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		if (temp == null) {
			Id = table;
			Id += "1";
		} else {

			max = max + 1;
			Id = table + max;

		}
		
		/*
		
		if (table.equals("busoperator")) {
			table1 = "operatorhistory";
		} else {
			table1 = table + "history";
		}

		String query1 = "select " + column + " from " + table1 + " order by "
				+ column;
		while (true) {
			rs = dbc.fireExecuteQuery(query1);
			boolean result = false;
			try {
				while (rs.next()) {
					if (rs.getString(1).equals(Id)) {
						result = true;
						break;
					}

				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			if (result) {
				max = max + 1;
				Id = table + max;

			} else {
				break;
			}
		}

	*/
		return Id;
	}
}
