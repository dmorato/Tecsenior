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
public class Pessoa {
    
    private Integer id;
    private String nome;
    private String cep;
    private String telefone;
    private ArrayList<Login>login = new ArrayList<Login>();
    private ArrayList<Conta_financeira>conta_financeira = new ArrayList<Conta_financeira>();
    
}
