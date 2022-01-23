    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tecsenior.Model;

import java.util.ArrayList;

/**
 *
 * @author Diogo Santos
 */
public class Pedido {
    
    private Integer id_Pedido;
    private String Situacao;
    private ArrayList<Cliente>Cliente = new ArrayList<Cliente>();
    private ArrayList<Plano>Plano = new ArrayList<Plano>();
    private ArrayList<Pagamento>Pagamento = new ArrayList<Pagamento>();
    
    
}
