/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Manejadoras;

import Modelo.DAO.DAOorden_compra;
import Modelo.Entidades.Orden_compra;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Franco
 */
public class Manejadora_orden {

    DAOorden_compra daoOrd = new DAOorden_compra();
    private ArrayList<Orden_compra> arrayOrden = daoOrd.ObtenerCompras();

    public ArrayList<Orden_compra> getOrden() {
        return arrayOrden;
    }

    public void setArrayOrden(ArrayList<Orden_compra> arrayOrd) {
        this.arrayOrden = arrayOrd;
    }

    public String ingresarCompra(Orden_compra ord) {
        return daoOrd.ingresarOrden(ord);
    }

    public String actualizarPrecio(int cod, int precio) {
        return daoOrd.actualizarPrecio(cod, precio);
    }

    public int buscarCompra(int codigo) {
        int rs = 0000;
        for (int i = 0; i < arrayOrden.size(); i++) {
            try {
                if (codigo == arrayOrden.get(i).getCodigo_compra()) {
                    return arrayOrden.get(i).getCodigo_compra();
                } else {
                    rs = 0;
                }
            } catch (Exception e) {
                rs = 0000404;
            }

        }
        return rs + codigo;

    }

    public Orden_compra devolverCompraCompleta(int codigo) {
        ArrayList<Orden_compra> arrayO = daoOrd.ObtenerCompras();

        for (int i = 0; i < arrayO.size(); i++) {
            if (arrayO.get(i).getCodigo_compra() == codigo) {
                return arrayO.get(i);
            }
        }
        return null;
    }

    public ArrayList<Orden_compra> listaComprasPorCodigo(int cod) {
        ArrayList<Orden_compra> arrayC = daoOrd.ObtenerCompras();
        ArrayList<Orden_compra> arrayO = new ArrayList<>();
        for (int i = 0; i < arrayC.size(); i++) {
            if (arrayC.get(i).getCodigo_compra() == cod) {
                arrayO.add(arrayC.get(i));
            }
        }

        return arrayO;
    }

    public ArrayList<Orden_compra> listaComprasPorRUT(String rut) {
        ArrayList<Orden_compra> arrayC = new ArrayList<>();

        for (int i = 0; i < arrayOrden.size(); i++) {
            if (arrayOrden.get(i).getCliente_rut_emp().compareToIgnoreCase(rut) == 0) {
                arrayC.add(arrayOrden.get(i));
            }
        }

        return arrayC;
    }

    public int cantidadDeOrdenes(String rut) {
        int contador = 0;
        for (int i = 0; i < arrayOrden.size(); i++) {
            if (arrayOrden.get(i).getCliente_rut_emp().compareToIgnoreCase(rut) == 0) {
                contador += 1;
            }
        }
        return contador;
    }

    public String asignarFactura(int codigo_factura, int codigo_compra) {
        return daoOrd.asignarFactura(codigo_factura, codigo_compra);
    }

    public String asignarFacturaMultiple(int codigo_factura, String rut) {
        return daoOrd.asignarFacturaMultiple(codigo_factura, rut);
    }

    public ArrayList<Orden_compra> listaDeComprasPorFactura(int cod_fact) {
        ArrayList<Orden_compra> arrayC = daoOrd.ObtenerCompras();

        for (int i = 0; i < arrayOrden.size(); i++) {
            if (arrayOrden.get(i).getFACTURA_cod_factura() == cod_fact) {
                arrayC.add(arrayOrden.get(i));
            }
        }

        return arrayC;
    }

    public int cantidadDias(int cod_compra) {
        int dias = 0;
        for (int i = 0; i < arrayOrden.size(); i++) {
            if (arrayOrden.get(i).getCodigo_compra() == cod_compra) {

                Date fechaUltimaSincro = arrayOrden.get(i).getF_inicio();
                Date fechaActual = arrayOrden.get(i).getF_fin();

                dias = (int) ((fechaActual.getTime() - fechaUltimaSincro.getTime()) / 86400000);

            }
        }

        return dias;
    }

    public int valorTodas(int cod_factura) {
        ArrayList<Orden_compra> arrayC = listaDeComprasPorFactura(cod_factura);
        int acumulador = 0;
        for (int i = 0; i < arrayC.size(); i++) {
            acumulador += arrayC.get(i).getPrecio_total();
        }
        return acumulador;
    }

}
