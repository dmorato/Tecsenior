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
import model.Conta_financeira;

/**
 *
 * @author leand
 */
public class Conta_financeiraDAO {
    public void create(Conta_financeira cof){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_criar_Conta_financeira(?, ?, ?)");
            stmt.setInt(1, cof.getAgencia());
            stmt.setInt(2, cof.getConta());
            stmt.setString(3, cof.getInstituicao());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Salvo");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao salvar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public List<Conta_financeira> read(){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        List<Conta_financeira> conta_financeiras = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement("call sp_listar_Conta_financeira" + " (?)");
            rs = stmt.executeQuery();
            
            while (rs.next()) {                
                Conta_financeira conta_financeira = new Conta_financeira();
                conta_financeira.setId(rs.getInt("id"));
                conta_financeira.setAgencia(rs.getInt("agencia"));
                conta_financeira.setConta(rs.getInt("salario"));
                conta_financeira.setInstituicao(rs.getString("instituicao"));
                conta_financeiras.add(conta_financeira);
            }
        } catch (SQLException ex) {
            
        }finally{
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        
        return conta_financeiras;
    }
    
    public void update(Conta_financeira cof){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_atualizar_Conta_financeira(?, ?, ?)");
            stmt.setInt(1, cof.getAgencia());
            stmt.setInt(2, cof.getConta());
            stmt.setString(3, cof.getInstituicao());
            stmt.setInt(4, cof.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Atualizado");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public void delete(Conta_financeira cof){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_deletar_conta_financeira(?)");
            stmt.setInt(1, cof.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Excluído");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
}
