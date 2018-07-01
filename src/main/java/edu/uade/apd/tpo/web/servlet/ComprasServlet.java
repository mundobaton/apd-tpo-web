package edu.uade.apd.tpo.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.uade.apd.tpo.repository.delegate.ComprasDelegate;

public class ComprasServlet extends HttpServlet {

	private static final long serialVersionUID = 2765751580286552442L;
	private static final String ACTION = "action";
	private static final String PROCESAR_OCS = "procesar-ocs";
	private static final String PROCESAR_OC = "procesar-oc";

	private ComprasDelegate delegate;

	@Override
	public void init() throws ServletException {
		try {
			delegate = ComprasDelegate.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.init();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter(ACTION);
		if (action.equals(PROCESAR_OCS)) {
			delegate.procesarOrdenesCompra();
			navigate(req, resp, "/compras/index.jsp");
		} else if (action.equals(PROCESAR_OC)) {
			Long oId = Long.parseLong(req.getParameter("oid"));
			delegate.procesarOrdenCompra(oId);
			navigate(req, resp, "/compras/index.jsp");
		}
	}
	
	private void navigate(HttpServletRequest req, HttpServletResponse resp, String url) throws IOException, ServletException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}

}
