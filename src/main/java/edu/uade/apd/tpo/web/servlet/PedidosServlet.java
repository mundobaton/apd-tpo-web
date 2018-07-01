package edu.uade.apd.tpo.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.uade.apd.tpo.repository.delegate.AdministracionDelegate;
import edu.uade.apd.tpo.repository.dto.ClienteDTO;

public class PedidosServlet extends HttpServlet {

	private static final long serialVersionUID = 7381584467599488503L;
	private AdministracionDelegate delegate;
	private static final String ACTION = "action";
	private static final String CREAR_PEDIDO = "crear-pedido";
	private static final String ARTICULOS = "articulos";
	private static final String CALLE = "calle";
	private static final String NUMERO = "numero";
	private static final String PROVINCIA = "provincia";
	private static final String CIUDAD = "ciudad";
	private static final String COD_POSTAL = "codigoPostal";
	
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
			ClienteDTO cliente = (ClienteDTO) req.getSession().getAttribute("cliente");
			String calle = req.getParameter(CALLE);
			int numero = Integer.parseInt(req.getParameter(NUMERO));
			String provincia = req.getParameter(PROVINCIA);
			String ciudad = req.getParameter(CIUDAD);
			String codPostal = req.getParameter(COD_POSTAL);
			Long pedidoId = delegate.crearPedido(cliente.getId(), calle, numero, ciudad, provincia, codPostal);
			
			String[] arr = req.getParameterValues("articulos");
			for(int i = 0; i < arr.length; i++) {
				String[] subArr = arr[i].split(",");
				Long articuloId = Long.parseLong(subArr[0]);
				int cant = Integer.parseInt(subArr[1]);
				delegate.agregarItemPedido(pedidoId, articuloId, cant);
			}
			delegate.finalizarCargaItems(pedidoId);
			navigate(req, resp, "/admin/congrats.jsp?pedidoId=" + pedidoId);
		}
	}
	
	private void navigate(HttpServletRequest req, HttpServletResponse resp, String url) throws IOException, ServletException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}
	
}
