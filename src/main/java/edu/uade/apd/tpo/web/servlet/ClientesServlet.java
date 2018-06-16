package edu.uade.apd.tpo.web.servlet;

import java.io.IOException;
import java.rmi.RemoteException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import edu.uade.apd.tpo.repository.AdministracionDelegate;
import edu.uade.apd.tpo.repository.stub.ClienteStub;
 
public class ClientesServlet extends HttpServlet {

	private static final long serialVersionUID = 4353196670043151151L;
	private AdministracionDelegate admDelegate;
	private static final String ACTION = "action";
	private Gson gson;

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			admDelegate = AdministracionDelegate.getInstance();
			this.gson = new Gson();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter(ACTION);
		String json = null;
		if (action.equals("list")) {
			json = gson.toJson(this.getClientes());
		}

		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(json);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	private List<ClienteStub> getClientes() throws RemoteException {
		return admDelegate.getClientes();
	}

}
