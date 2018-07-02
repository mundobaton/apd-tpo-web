package edu.uade.apd.tpo.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.uade.apd.tpo.repository.delegate.AdministracionDelegate;
import edu.uade.apd.tpo.repository.dto.ClienteDTO;
import edu.uade.apd.tpo.repository.dto.UsuarioDTO;
import edu.uade.apd.tpo.repository.exception.RemoteBusinessException;

public class AdministracionServlet extends HttpServlet {

	private static final long serialVersionUID = -862292540372719884L;
	private AdministracionDelegate administracionDelegate;
	private static final String ACTION = "action";
	private static final String LOGIN_CLIENTE = "login-cliente";
	private static final String LOGIN_USUARIO = "login-usuario";
	private static final String EMAIL = "email";
	private static final String PASSWORD = "password";
	private static final String CLIENTE = "cliente";
	private static final String USUARIO = "usuario";
	private static final String LOGOUT = "logout";
	private static final String LEGAJO = "legajo";
	private static final String ERROR = "error";

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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter(ACTION);
		if(action.equals(LOGOUT)) {
			HttpSession session = req.getSession();
			session.invalidate();
			navigate(req, resp, "/index.jsp");
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
				navigate(req, resp, "/index.jsp");
			} catch (RemoteBusinessException be) {
				req.setAttribute("error", be.getMessage());
				navigate(req, resp, "/admin/login.jsp");
			}
		} else if(action.equals(LOGIN_USUARIO)) {
			String legajo = req.getParameter(LEGAJO);
			String password = req.getParameter(PASSWORD);
			try {
				UsuarioDTO usuario = administracionDelegate.loginUsuario(legajo, password);
				HttpSession session = req.getSession(true);
				session.setAttribute(USUARIO, usuario);
				navigate(req, resp, "/index.jsp");
			} catch (RemoteBusinessException be) {
				req.setAttribute("error", be.getMessage());
				navigate(req, resp, "/admin/admlogin.jsp");
			}
		}
		
	}
	
	private void navigate(HttpServletRequest req, HttpServletResponse resp, String url) throws IOException, ServletException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}

}
