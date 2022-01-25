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
import model.Plano;
import model.Plano;

/**
 *
 * @author leand
 */
public class PlanoDAO {
    
    public void create(Plano pla){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_criar_Plano(?, ?, ?)");
            stmt.setString(1, pla.getNome());
            stmt.setDouble(2, pla.getMensalidade());
            stmt.setString(3, pla.getDescricao());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Salvo");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao salvar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public List<Plano> read(){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        List<Plano> planos = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement("call sp_listar_Plano" + " (?)");
            rs = stmt.executeQuery();
            
            while (rs.next()) {                
                Plano plano = new Plano();
                
                plano.setId(rs.getInt("id"));
                plano.setNome(rs.getString("nome"));
                plano.setMensalidade(rs.getDouble("mensalidade"));
                plano.setDescricao(rs.getString("descricao"));
                planos.add(plano);
            }
        } catch (SQLException ex) {
            
        }finally{
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        
        return planos;
    }
    
    public void update(Plano pla){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_atualizar_plano(?, ?, ?)");
            stmt.setString(1, pla.getNome());
            stmt.setDouble(2, pla.getMensalidade());
            stmt.setString(3, pla.getDescricao());
            stmt.setInt(4, pla.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Atualizado");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public void delete(Plano pla){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_excluir_Plano(?)");
            stmt.setInt(1, pla.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Excluído");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
}
