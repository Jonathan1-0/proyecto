package polizas.Vehiculos;

public class Vehiculo {
    protected int idVehiculo;
    protected int idCliente; // FK hacia Cliente
    protected String marca;
    protected String submarca;
    protected String modelo;
    protected String tipoVehiculo;
    protected String numeroSerie;
    protected String placas;
    protected boolean activo;

    public Vehiculo(int idVehiculo, int idCliente, String marca, String submarca, String modelo, String tipoVehiculo, String numeroSerie, String placas, boolean activo) {
        this.idVehiculo = idVehiculo;
        this.idCliente = idCliente;
        this.marca = marca;
        this.submarca = submarca;
        this.modelo = modelo;
        this.tipoVehiculo = tipoVehiculo;
        this.numeroSerie = numeroSerie;
        this.placas = placas;
        this.activo = activo;
    }

    public int getIdVehiculo() { return idVehiculo; }
    public void setIdVehiculo(int idVehiculo) { this.idVehiculo = idVehiculo; }

    public int getIdCliente() { return idCliente; }
    public void setIdCliente(int idCliente) { this.idCliente = idCliente; }

    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }

    public String getSubmarca() { return submarca; }
    public void setSubmarca(String submarca) { this.submarca = submarca; }

    public String getModelo() { return modelo; }
    public void setModelo(String modelo) { this.modelo = modelo; }

    public String getTipoVehiculo() { return tipoVehiculo; }
    public void setTipoVehiculo(String tipoVehiculo) { this.tipoVehiculo = tipoVehiculo; }

    public String getNumeroSerie() { return numeroSerie; }
    public void setNumeroSerie(String numeroSerie) { this.numeroSerie = numeroSerie; }

    public String getPlacas() { return placas; }
    public void setPlacas(String placas) { this.placas = placas; }

    public boolean isActivo() { return activo; }
    public void setActivo(boolean activo) { this.activo = activo; }

    @Override
    public String toString() {
        return this.marca + " " + this.submarca + " (" + this.placas + ")";
    }
}