package polizas.Vehiculos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import polizas.General.Conexion;
import polizas.General.DAO;

public class VehiculoModelo extends Conexion implements DAO {

    public VehiculoModelo() {
        super();
    }

    @Override
    public List read() {
        List<Vehiculo> lista = new ArrayList<>();
        try {
            this.conectar();
            ps = cnx.prepareStatement("SELECT * FROM vehiculo");
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(new Vehiculo(
                    rs.getInt("idVehiculo"),
                    rs.getInt("idCliente"),
                    rs.getString("marca"),
                    rs.getString("submarca"),
                    rs.getString("modelo"),
                    rs.getString("tipoVehiculo"),
                    rs.getString("numeroSerie"),
                    rs.getString("placas"),
                    rs.getBoolean("activo")
                ));
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            this.close();
        }
        return lista;
    }

    @Override
    public int create(Object obj) {
        try {
            this.conectar();
            Vehiculo v = (Vehiculo) obj;
            ps = cnx.prepareStatement("INSERT INTO vehiculo (idCliente, marca, submarca, modelo, tipoVehiculo, numeroSerie, placas, activo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, v.getIdCliente());
            ps.setString(2, v.getMarca());
            ps.setString(3, v.getSubmarca());
            ps.setString(4, v.getModelo());
            ps.setString(5, v.getTipoVehiculo());
            ps.setString(6, v.getNumeroSerie());
            ps.setString(7, v.getPlacas());
            ps.setBoolean(8, true);
            return ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            this.close();
        }
        return 0;
    }

    @Override
    public int update(Object obj) {
        try {
            this.conectar();
            Vehiculo v = (Vehiculo) obj;
            ps = cnx.prepareStatement("UPDATE vehiculo SET idCliente = ?, marca = ?, submarca = ?, modelo = ?, tipoVehiculo = ?, numeroSerie = ?, placas = ? WHERE idVehiculo = ?");
            ps.setInt(1, v.getIdCliente());
            ps.setString(2, v.getMarca());
            ps.setString(3, v.getSubmarca());
            ps.setString(4, v.getModelo());
            ps.setString(5, v.getTipoVehiculo());
            ps.setString(6, v.getNumeroSerie());
            ps.setString(7, v.getPlacas());
            ps.setInt(8, v.getIdVehiculo());
            return ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            this.close();
        }
        return 0;
    }

    @Override
    public int delete(Object obj) {
        try {
            this.conectar();
            Vehiculo v = (Vehiculo) obj;
            ps = cnx.prepareStatement("DELETE FROM vehiculo WHERE idVehiculo = ?");
            ps.setInt(1, v.getIdVehiculo());
            return ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            this.close();
        }
        return 0;
    }
}