package edu.uade.apd.tpo.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.uade.apd.tpo.repository.delegate.DespachoDelegate;

public class DespachoServlet extends HttpServlet {

	private static final long serialVersionUID = -986507554187241662L;
	private static final String ACTION = "action";
	private static final String DESPACHAR = "despachar";
	private DespachoDelegate delegate;
	
	@Override
	public void init() throws ServletException {
		try {
			delegate = DespachoDelegate.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.init();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter(ACTION);
		if(action.equals(DESPACHAR)) {
			Long pedidoId = Long.parseLong(req.getParameter("pid"));
			delegate.despacharPedido(pedidoId);
			navigate(req, resp, "despacho/pedido.jsp?result=success");
		}
	}

	private void navigate(HttpServletRequest req, HttpServletResponse resp, String url) throws IOException, ServletException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}
}
