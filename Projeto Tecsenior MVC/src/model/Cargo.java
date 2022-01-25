package model;

public class Cargo {
    
    private int id;
    private String nome;
    private double salario;
    private int carga_horaria;
    private String descricao;
    
    public Cargo(int idCargo, String nome, double salario, int carga_horaria, String descricao) {
        this.id = idCargo;
        this.nome = nome;
        this.salario = salario;
        this.carga_horaria = carga_horaria;
        this.descricao = descricao;
    }

    public Cargo() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public int getCarga_horaria() {
        return carga_horaria;
    }

    public void setCarga_horaria(int carga_horaria) {
        this.carga_horaria = carga_horaria;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
}