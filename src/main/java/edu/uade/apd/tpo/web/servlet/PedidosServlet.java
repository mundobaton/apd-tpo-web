package edu.uade.apd.tpo.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.uade.apd.tpo.repository.delegate.AdministracionDelegate;

public class PedidosServlet extends HttpServlet {

	private static final long serialVersionUID = 7381584467599488503L;
	private AdministracionDelegate delegate;
	private static final String ACTION = "action";
	private static final String CREAR_PEDIDO = "crear-pedido";
	
	@Override
	public void init() throws ServletException {
		try {
			delegate = AdministracionDelegate.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.init();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter(ACTION);
		if(action.equals(CREAR_PEDIDO)) {
			
		}
	}
	
	
}
