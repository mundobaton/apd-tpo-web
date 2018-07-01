package edu.uade.apd.tpo.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.uade.apd.tpo.repository.delegate.DepositoDelegate;

public class DepositoServlet extends HttpServlet {

	private static final long serialVersionUID = -1089632274085596862L;
	private DepositoDelegate delegate;
	private static final String ACTION = "action";
	private static final String REPONER = "reponer";

	@Override
	public void init() throws ServletException {
		try {
			delegate = DepositoDelegate.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.init();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter(ACTION);
		if (action.equals(REPONER)) {
			Long reposicionId = Long.parseLong(req.getParameter("repoId"));
			int cant = Integer.parseInt(req.getParameter("cant"));
			delegate.reponer(reposicionId, cant);
			resp.setStatus(HttpServletResponse.SC_OK);
		}
	}

}
