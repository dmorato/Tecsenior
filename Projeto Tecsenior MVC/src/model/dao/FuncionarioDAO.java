/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import model.Funcionario;

/**
 *
 * @author leand
 */
public class FuncionarioDAO {
    
    public void create(Funcionario fun){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_criar_funcionario(?, ?)");
            stmt.setString(1, fun.getPessoa().getNome());
            stmt.setString(2, fun.getCargo().getNome());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Salvo");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao salvar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public List<Funcionario> read(){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        List<Funcionario> funcionarios = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement("call sp_listar_Funcionario" + " (?)");
            rs = stmt.executeQuery();
            
            while (rs.next()) {                
                Funcionario funcionario = new Funcionario();
                funcionario.getPessoa().setNome(rs.getString("nome"));
                funcionario.getCargo().setNome(rs.getString("nome"));
                funcionarios.add(funcionario);
            }
        } catch (SQLException ex) {
            
        }finally{
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        
        return funcionarios;
    }
    
    public void update(Funcionario fun){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_atualizar_Funcionario(?, ?)");
            stmt.setString(1, fun.getPessoa().getNome());
            stmt.setString(2, fun.getCargo().getNome());
            stmt.setInt(3, fun.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Atualizado");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public void delete(Funcionario fun){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_deletar_funcionario(?)");
            stmt.setInt(1, fun.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Excluído");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
}
