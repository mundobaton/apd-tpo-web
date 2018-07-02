package edu.uade.apd.tpo.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.uade.apd.tpo.repository.delegate.FacturacionDelegate;

public class FacturacionServlet extends HttpServlet {

	private static final long serialVersionUID = 2561960437404457527L;
	private FacturacionDelegate delegate;
	private static final String ACTION = "action";
	private static final String FACTURAR = "facturar";
	private static final String PAGAR_FACTURA = "pagarFactura";

	@Override
	public void init() throws ServletException {
		try {
			delegate = FacturacionDelegate.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.init();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter(ACTION);
		if (action.equals(FACTURAR)) {
			Long pedidoId = Long.parseLong(req.getParameter("pid"));
			delegate.facturar(pedidoId);
			navigate(req, resp, "/facturacion/pedido.jsp?pedidoId=" + pedidoId + "&result=success");
		}
		if(action.equals(PAGAR_FACTURA)){
			Long facturaId = Long.parseLong(req.getParameter("fid"));
			Long clienteId = Long.parseLong(req.getParameter("cid"));
			float importe = Float.parseFloat(req.getParameter("importe"));
			delegate.pagarFactura(facturaId, importe, clienteId);
			navigate(req, resp, "/facturacion/factura.jsp?fid=" + facturaId + "&result=success");
		}
	}

	private void navigate(HttpServletRequest req, HttpServletResponse resp, String url)
			throws IOException, ServletException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}
}
