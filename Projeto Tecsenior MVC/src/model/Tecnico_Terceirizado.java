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
public class Tecnico_Terceirizado {
    
    private Integer id;
    private String especializacacao;
    private String escabilidade;
    private Pessoa pessoa;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEspecializacacao() {
        return especializacacao;
    }

    public void setEspecializacacao(String especializacacao) {
        this.especializacacao = especializacacao;
    }

    public String getEscabilidade() {
        return escabilidade;
    }

    public void setEscabilidade(String escalabilidade) {
        this.escabilidade = escalabilidade;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }
    
    
}
