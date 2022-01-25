/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author Diogo Santos
 */
public class Chamado {

    private int id;
    private String descricao;
    private String status;
    private Date emissao;
    private Date conclusao;
    private String tipo_chamado;
    private Funcionario funcionario ;
    private Tecnico_Terceirizado tecnico_terceirizado;
    private Cliente cliente;

    public int getId() {
        return id;
    }

    public void setId(int idChamado) {
        this.id = idChamado;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getEmissao() {
        return emissao;
    }

    public void setEmissao(Date emissao) {
        this.emissao = emissao;
    }

    public Date getConclusao() {
        return conclusao;
    }

    public void setConclusao(Date conclusao) {
        this.conclusao = conclusao;
    }

    public String getTipo_chamado() {
        return tipo_chamado;
    }

    public void setTipo_chamado(String tipo_chamado) {
        this.tipo_chamado = tipo_chamado;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    public Tecnico_Terceirizado getTecnico_terceirizado() {
        return tecnico_terceirizado;
    }

    public void setTecnico_terceirizado(Tecnico_Terceirizado tecnico_terceirizado) {
        this.tecnico_terceirizado = tecnico_terceirizado;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    
}
