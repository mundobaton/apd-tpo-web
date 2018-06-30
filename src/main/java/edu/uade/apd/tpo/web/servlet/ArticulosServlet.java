package edu.uade.apd.tpo.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import edu.uade.apd.tpo.repository.delegate.DepositoDelegate;
import edu.uade.apd.tpo.repository.dto.ArticuloDTO;
import edu.uade.apd.tpo.repository.exception.RemoteBusinessException;

public class ArticulosServlet extends HttpServlet {

	private DepositoDelegate delegate;
	private Gson gson;

	@Override
	public void init() throws ServletException {
		try {
			delegate = DepositoDelegate.getInstance();
			this.gson = new Gson();
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.init();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");
		if (action.equals("list")) {
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write(this.getArticulos());
		}

		super.doGet(req, resp);
	}

	private String getArticulos() throws RemoteBusinessException {
		List<ArticuloDTO> articulos = delegate.getArticulos();
		return gson.toJson(articulos);
	}

}
