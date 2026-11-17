package polizas.Clientes;

import java.awt.event.MouseAdapter;
import java.util.List;
import javax.swing.JOptionPane;

public class ClienteControl {
    private ClienteVista cv;
    private ClienteModelo cm;
    private List<Cliente> lista;

    public ClienteControl(ClienteVista clienteVista) {
        this.cv = clienteVista;
        this.cm = new ClienteModelo();
        clienteEventos();
    }

    public void clienteEventos() {
        // Consultar
        cv.btnConsultar.addActionListener(e -> {
            lista = cm.read();
            cv.actualizarVista(lista);
        });

        // Agregar
        cv.btnAgregar.addActionListener(e -> {
            String nombre = cv.txtNombre.getText();
            if (nombre.trim().isEmpty() || nombre.equals("Nombre completo")) {
                JOptionPane.showMessageDialog(cv, "Ingresa un nombre válido.", "Advertencia", JOptionPane.WARNING_MESSAGE);
                return;
            }

            Cliente c = new Cliente(
                0,
                cv.txtNombre.getText(),
                cv.txtTelefono.getText(),
                cv.txtCorreo.getText(),
                cv.txtRfc.getText(),
                cv.txtDireccion.getText(),
                cv.txtMedioContacto.getText(),
                true
            );

            int resultado = cm.create(c);
            if (resultado > 0) {
                JOptionPane.showMessageDialog(cv, "¡Cliente agregado correctamente!");
                cv.actualizarVista(cm.read());
            } else {
                JOptionPane.showMessageDialog(cv, "No se pudo agregar el cliente.", "Error", JOptionPane.ERROR_MESSAGE);
            }
        });

        // Actualizar
        cv.btnActualizar.addActionListener(e -> {
            try {
                int id = Integer.parseInt(cv.txtId.getText());
                Cliente c = new Cliente(
                    id,
                    cv.txtNombre.getText(),
                    cv.txtTelefono.getText(),
                    cv.txtCorreo.getText(),
                    cv.txtRfc.getText(),
                    cv.txtDireccion.getText(),
                    cv.txtMedioContacto.getText(),
                    true
                );

                int resultado = cm.update(c);
                JOptionPane.showMessageDialog(cv, resultado > 0 ? "Cliente actualizado correctamente" : "No se pudo actualizar");
                cv.actualizarVista(cm.read());
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(cv, "El ID debe ser un número válido", "Error", JOptionPane.ERROR_MESSAGE);
            }
        });

        // Eliminar
        cv.btnEliminar.addActionListener(e -> {
            try {
                int id = Integer.parseInt(cv.txtId.getText());
                Cliente c = new Cliente(id, "", "", "", "", "", "", true);

                int resultado = cm.delete(c);
                JOptionPane.showMessageDialog(cv, resultado > 0 ? "Cliente eliminado correctamente" : "No se pudo eliminar");
                cv.actualizarVista(cm.read());
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(cv, "El ID debe ser un número válido", "Error", JOptionPane.ERROR_MESSAGE);
            }
        });

        // Clic en la tabla para rellenar campos
        cv.tabla.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(java.awt.event.MouseEvent e) {
                int fila = cv.tabla.getSelectedRow();
                if (fila != -1) {
                    cv.txtId.setText(String.valueOf(cv.clienteModelo.getValueAt(fila, 0)));
                    cv.txtNombre.setText((String) cv.clienteModelo.getValueAt(fila, 1));
                    cv.txtTelefono.setText((String) cv.clienteModelo.getValueAt(fila, 2));
                    cv.txtCorreo.setText((String) cv.clienteModelo.getValueAt(fila, 3));
                    cv.txtRfc.setText((String) cv.clienteModelo.getValueAt(fila, 4));
                    cv.txtDireccion.setText((String) cv.clienteModelo.getValueAt(fila, 5));
                    cv.txtMedioContacto.setText((String) cv.clienteModelo.getValueAt(fila, 6));
                }
            }
        });
    }
}