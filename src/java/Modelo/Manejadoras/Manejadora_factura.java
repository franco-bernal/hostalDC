/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;


import Modelo.DAO.DAOfacturas;
import Modelo.Entidades.Factura;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author Franco
 */
public class Manejadora_factura {
    
    
    
    DAOfacturas dao_fac = new DAOfacturas();

    private ArrayList<Factura> arrayFac = dao_fac.ObtenerFacturas();

    public ArrayList<Factura> getFactura() {
        return arrayFac;
    }

    public void setArrayFactura(ArrayList<Factura> arrayFac) {
        this.arrayFac = arrayFac;
    }

    /*
    ingresar
     */
    public String ingresarFactura(Factura fac) {
            if (fac != null) {
                return dao_fac.ingresarFactura(fac);
            } else {
                return "null";
            }
    }

    
     public Factura obtenerFacturaPorCod(int cod){
        for(int i = 0 ;i<arrayFac.size();i++){
            if(arrayFac.get(i).getCod_factura()==cod){
                return arrayFac.get(i);
            }
        }
        return null;
    }

     public int maxIdFactura(){
         return arrayFac.size()+1;
     }
    
     public Date fecha_vencimiento(Date f_emicion){
         Calendar calendar= Calendar.getInstance();
         calendar.setTime(f_emicion);
         calendar.add(Calendar.DAY_OF_YEAR, 15);
         java.sql.Date sqlDate = convert(calendar.getTime());
         return sqlDate;
     }
     
     private static java.sql.Date convert(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }
  
    
}
