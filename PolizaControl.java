package polizas.Polizas;

import java.awt.event.MouseAdapter;
import java.util.List;
import javax.swing.JOptionPane;

public class PolizaControl {
    private PolizaVista pv;
    private PolizaModelo pm;
    private List<PolizaEntidad> lista;

    public PolizaControl(PolizaVista polizaVista) {
        this.pv = polizaVista;
        this.pm = new PolizaModelo();
        polizaEventos();
    }

    public void polizaEventos() {
        // Consultar
        pv.btnConsultar.addActionListener(e -> {
            lista = pm.read();
            pv.actualizarVista(lista);
        });

        // Agregar
        pv.btnAgregar.addActionListener(e -> {
            try {
                String numPoliza = pv.txtNumeroPoliza.getText();
                if (numPoliza.trim().isEmpty()) {
                    JOptionPane.showMessageDialog(pv, "Ingresa un número de póliza válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                    return;
                }

                int idCot = Integer.parseInt(pv.txtIdCotizacion.getText());
                int idVeh = Integer.parseInt(pv.txtIdVehiculo.getText());
                int idCom = Integer.parseInt(pv.txtIdCompania.getText());
                int idUsu = Integer.parseInt(pv.txtIdUsuario.getText());
                int idTip = Integer.parseInt(pv.txtIdTipo.getText());
                
                String txtAnt = pv.txtIdPolizaAnterior.getText();
                Integer idAnt = (txtAnt.isEmpty() || txtAnt.equals("0")) ? null : Integer.parseInt(txtAnt);
                
                double prima = Double.parseDouble(pv.txtPrimaTotal.getText());

                PolizaEntidad p = new PolizaEntidad(
                    0, numPoliza, idCot, idVeh, idCom, idUsu, idTip, idAnt,
                    pv.txtFechaEmision.getText(),
                    pv.txtFechaInicio.getText(),
                    pv.txtFechaVencimiento.getText(),
                    prima,
                    pv.txtEstatus.getText()
                );

                int resultado = pm.create(p);
                if (resultado > 0) {
                    JOptionPane.showMessageDialog(pv, "¡Póliza registrada correctamente!");
                    pv.actualizarVista(pm.read());
                } else {
                    JOptionPane.showMessageDialog(pv, "No se pudo registrar. Verifica los IDs foráneos.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(pv, "Verifica que los campos numéricos sean correctos.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        });

        // Actualizar
        pv.btnActualizar.addActionListener(e -> {
            try {
                int idPol = Integer.parseInt(pv.txtIdPoliza.getText());
                int idCot = Integer.parseInt(pv.txtIdCotizacion.getText());
                int idVeh = Integer.parseInt(pv.txtIdVehiculo.getText());
                int idCom = Integer.parseInt(pv.txtIdCompania.getText());
                int idUsu = Integer.parseInt(pv.txtIdUsuario.getText());
                int idTip = Integer.parseInt(pv.txtIdTipo.getText());
                
                String txtAnt = pv.txtIdPolizaAnterior.getText();
                Integer idAnt = (txtAnt.isEmpty() || txtAnt.equals("0")) ? null : Integer.parseInt(txtAnt);
                
                double prima = Double.parseDouble(pv.txtPrimaTotal.getText());

                PolizaEntidad p = new PolizaEntidad(
                    idPol, pv.txtNumeroPoliza.getText(), idCot, idVeh, idCom, idUsu, idTip, idAnt,
                    pv.txtFechaEmision.getText(),
                    pv.txtFechaInicio.getText(),
                    pv.txtFechaVencimiento.getText(),
                    prima,
                    pv.txtEstatus.getText()
                );

                int resultado = pm.update(p);
                JOptionPane.showMessageDialog(pv, resultado > 0 ? "Actualizado correctamente" : "No se pudo actualizar");
                pv.actualizarVista(pm.read());
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(pv, "Verifica los formatos numéricos", "Error", JOptionPane.ERROR_MESSAGE);
            }
        });

        // Eliminar
        pv.btnEliminar.addActionListener(e -> {
            try {
                int idPol = Integer.parseInt(pv.txtIdPoliza.getText());
                PolizaEntidad p = new PolizaEntidad(idPol, "", 0, 0, 0, 0, 0, null, "", "", "", 0.0, "");

                int resultado = pm.delete(p);
                JOptionPane.showMessageDialog(pv, resultado > 0 ? "Eliminado correctamente" : "No se pudo eliminar");
                pv.actualizarVista(pm.read());
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(pv, "El ID debe ser un número válido", "Error", JOptionPane.ERROR_MESSAGE);
            }
        });

        // Clic en la tabla
        pv.tabla.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(java.awt.event.MouseEvent e) {
                int fila = pv.tabla.getSelectedRow();
                if (fila != -1) {
                    pv.txtIdPoliza.setText(String.valueOf(pv.polizaModelo.getValueAt(fila, 0)));
                    pv.txtNumeroPoliza.setText((String) pv.polizaModelo.getValueAt(fila, 1));
                    pv.txtIdCotizacion.setText(String.valueOf(pv.polizaModelo.getValueAt(fila, 2)));
                    pv.txtIdVehiculo.setText(String.valueOf(pv.polizaModelo.getValueAt(fila, 3)));
                    pv.txtIdCompania.setText(String.valueOf(pv.polizaModelo.getValueAt(fila, 4)));
                    pv.txtIdUsuario.setText(String.valueOf(pv.polizaModelo.getValueAt(fila, 5)));
                    pv.txtIdTipo.setText(String.valueOf(pv.polizaModelo.getValueAt(fila, 6)));
                    
                    Object ant = pv.polizaModelo.getValueAt(fila, 7);
                    pv.txtIdPolizaAnterior.setText(ant != null ? String.valueOf(ant) : "");
                    
                    pv.txtFechaEmision.setText((String) pv.polizaModelo.getValueAt(fila, 8));
                    pv.txtFechaInicio.setText((String) pv.polizaModelo.getValueAt(fila, 9));
                    pv.txtFechaVencimiento.setText((String) pv.polizaModelo.getValueAt(fila, 10));
                    pv.txtPrimaTotal.setText(String.valueOf(pv.polizaModelo.getValueAt(fila, 11)));
                    pv.txtEstatus.setText((String) pv.polizaModelo.getValueAt(fila, 12));
                }
            }
        });
    }
}
