package model;

public class Cargo {
    
    private int idCargo;
    private String nome;
    private double salario;
    private int carga_horaria;
    private String descricao;

    public Cargo(int idCargo, String nome, double salario, int carga_horaria, String descricao) {
        this.idCargo = idCargo;
        this.nome = nome;
        this.salario = salario;
        this.carga_horaria = carga_horaria;
        this.descricao = descricao;
    }
    
    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
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
