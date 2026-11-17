package polizas.General;

import java.util.List;

public abstract interface DAO {
    
    //Metodo original de Agregar
    int create(Object obj);
    
    //Metodo original de Consultar
    List read();
    
    //Metodo original de Actualizar
    int update(Object lista);
    
    //Metodo original de Eliminar
    int delete(Object obj);
}