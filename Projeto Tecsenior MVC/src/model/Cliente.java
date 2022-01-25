/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


/**
 *
 * @author Diogo Santos
 */
public class Cliente {
    
    private Integer id;
    private Pessoa pessoa;

    public Cliente(Integer id, Pessoa pessoa) {
        this.id = id;
        this.pessoa = pessoa;
    }

    public Cliente(Integer id) {
        this.id = id;
    }

    public Cliente() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }
    
    
}
