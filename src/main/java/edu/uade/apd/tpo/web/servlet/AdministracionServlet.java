package edu.uade.apd.tpo.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.uade.apd.tpo.repository.delegate.AdministracionDelegate;
import edu.uade.apd.tpo.repository.dto.ClienteDTO;
import edu.uade.apd.tpo.repository.exception.RemoteBusinessException;

public class AdministracionServlet extends HttpServlet {

	private static final long serialVersionUID = -862292540372719884L;
	private AdministracionDelegate administracionDelegate;
	private static final String ACTION = "action";
	private static final String LOGIN_CLIENTE = "login-cliente";
	private static final String EMAIL = "email";
	private static final String PASSWORD = "password";
	private static final String CLIENTE = "cliente";

	@Override
	public void init() throws ServletException {
		try {
			administracionDelegate = AdministracionDelegate.getInstance();
			super.init();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter(ACTION);
		if (action.equals(LOGIN_CLIENTE)) {
			String email = req.getParameter(EMAIL);
			String password = req.getParameter(PASSWORD);
			try {
				ClienteDTO cliente = administracionDelegate.loginCliente(email, password);
				HttpSession session = req.getSession(true);
				session.setAttribute(CLIENTE, cliente);

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
				dispatcher.forward(req, resp);
			} catch (RemoteBusinessException be) {
				// TODO manejo de error cuando no existe el cliente
			}
		}
	}

}
