package polizas.General;

import polizas.Marcas.MarcasVista;
import javax.swing.JLabel;
import polizas.Clientes.ClienteControl;
import polizas.Clientes.ClienteVista;
import polizas.Companias.CompaniaControl;
import polizas.Companias.CompaniaVista;
import polizas.Cotizaciones.CotizacionControl;
import polizas.Cotizaciones.CotizacionVista;
import polizas.Marcas.MarcasControl;
import polizas.Polizas.PolizaControl;
import polizas.Polizas.PolizaVista;
import polizas.TiposPoliza.TipoPolizaControl;
import polizas.TiposPoliza.TipoPolizaVista;
import polizas.Usuarios.UsuarioControl;
import polizas.Usuarios.UsuarioVista;
import polizas.Vehiculos.VehiculoControl;
import polizas.Vehiculos.VehiculoVista;

public class Controlador {

    protected Bienvenida vista;
    protected MarcasVista marcasVista;

    public Controlador(Bienvenida vista) {
        this.vista = vista;
        this.eventos();
    }

    void eventos() {
        vista.mensaje.addActionListener(
            e -> vista.cl.show(vista.pc, "mensaje")
        );

        vista.home.addActionListener(e -> {
            vista.pc.add(new JLabel("Panel Home"), "home");
            vista.cl.show(vista.pc, "home");
        });

        vista.marcas.addActionListener(e -> {
            marcasVista = new MarcasVista();
            new MarcasControl(marcasVista);
            vista.pc.add(marcasVista, "mk");
            vista.cl.show(vista.pc, "mk");
        });
        
        vista.mClientes.addActionListener(e -> {
            ClienteVista clienteVista = new ClienteVista();
            new ClienteControl(clienteVista);
            vista.pc.add(clienteVista, "clientesKey");
            vista.cl.show(vista.pc, "clientesKey");
        });
        
        vista.mVehiculos.addActionListener(e -> {
            VehiculoVista vehiculoVista = new VehiculoVista();
            new VehiculoControl(vehiculoVista);
            vista.pc.add(vehiculoVista, "vehiculosKey");
            vista.cl.show(vista.pc, "vehiculosKey");
        });
        
        vista.mCompanias.addActionListener(e -> {
            CompaniaVista companiasVista = new CompaniaVista();
            new CompaniaControl(companiasVista);
            vista.pc.add(companiasVista, "companiasKey");
            vista.cl.show(vista.pc, "companiasKey");
        });
        
        vista.mTipoPoliza.addActionListener(e -> {
            TipoPolizaVista tpVista = new TipoPolizaVista();
            new TipoPolizaControl(tpVista);
            vista.pc.add(tpVista, "tipoPolizaKey");
            vista.cl.show(vista.pc, "tipoPolizaKey");
        });
        
        vista.mUsuarios.addActionListener(e -> {
            UsuarioVista uVista = new UsuarioVista();
            new UsuarioControl(uVista);
            vista.pc.add(uVista, "usuariosKey");
            vista.cl.show(vista.pc, "usuariosKey");
        });
        
        vista.mCotizaciones.addActionListener(e -> {
            CotizacionVista cVista = new CotizacionVista();
            new CotizacionControl(cVista);
            vista.pc.add(cVista, "cotizacionesKey");
            vista.cl.show(vista.pc, "cotizacionesKey");
        });
        
        vista.mPolizasSistema.addActionListener(e -> {
            PolizaVista pVista = new PolizaVista();
            new PolizaControl(pVista);
            vista.pc.add(pVista, "polizasKey");
            vista.cl.show(vista.pc, "polizasKey");
        });
        
        vista.mCoberturas.addActionListener(e -> {
            var v = new polizas.Coberturas.CoberturaVista(); 
            new polizas.Coberturas.CoberturaControl(v);
            vista.pc.add(v, "cobKey"); 
            vista.cl.show(vista.pc, "cobKey");
        });
        vista.mDetalleCob.addActionListener(e -> {
            var v = new polizas.DetalleCobertura.DetalleCoberturaVista(); 
            new polizas.DetalleCobertura.DetalleCoberturaControl(v);
            vista.pc.add(v, "detCobKey"); 
            vista.cl.show(vista.pc, "detCobKey");
        });
        vista.mPagos.addActionListener(e -> {
            var v = new polizas.Pagos.PagoVista(); 
            new polizas.Pagos.PagoControl(v);
            vista.pc.add(v, "pagoKey"); 
            vista.cl.show(vista.pc, "pagoKey");
        });
        
        vista.mCancelaciones.addActionListener(e -> {
            var v = new polizas.Cancelaciones.CancelacionVista(); 
            new polizas.Cancelaciones.CancelacionControl(v);
            vista.pc.add(v, "cancKey"); 
            vista.cl.show(vista.pc, "cancKey");
        });
        vista.mNotificaciones.addActionListener(e -> {
            var v = new polizas.Notificaciones.NotificacionVista(); 
            new polizas.Notificaciones.NotificacionControl(v);
            vista.pc.add(v, "notifKey"); 
            vista.cl.show(vista.pc, "notifKey");
        });
        vista.mDocumentos.addActionListener(e -> {
            var v = new polizas.Documentos.DocumentoVista(); 
            new polizas.Documentos.DocumentoControl(v);
            vista.pc.add(v, "docKey"); 
            vista.cl.show(vista.pc, "docKey");
        });
    }
}