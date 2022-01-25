/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Diogo Santos
 */
public class Chamado {

    private Integer idChamado;
    private String descricao;
    private String status;
    private Date emissao;
    private Date conclusao;
    private String tipo_chamado;
    private ArrayList<Funcionario>funcionario = new ArrayList<Funcionario>();
    private ArrayList<Tec_Terceiro>tec_terceiro = new ArrayList<Tec_Terceiro>();
    private ArrayList<Cliente>cliente = new ArrayList<Cliente>();


    
}
