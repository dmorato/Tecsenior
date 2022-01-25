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
import model.Tecnico_Terceirizado;

/**
 *
 * @author leand
 */
public class Tecnico_TerceirizadoDAO {
    
    public void create(Tecnico_Terceirizado tec){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_criar_tecnico_terceirizado(?, ?, ?)");
            stmt.setString(1, tec.getEspecializacacao());
            stmt.setString(2, tec.getEscabilidade());
            stmt.setString(3, tec.getPessoa().getNome());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Salvo");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao salvar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public List<Tecnico_Terceirizado> read(){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        List<Tecnico_Terceirizado> tecnico_terceirizados = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement("call sp_listar_Tecnico_terceirizado" + " (?)");
            rs = stmt.executeQuery();
            
            while (rs.next()) {                
                Tecnico_Terceirizado tecnico_terceirizado = new Tecnico_Terceirizado();
                tecnico_terceirizado.setEspecializacacao(rs.getString("especializacao"));
                tecnico_terceirizado.setEscabilidade(rs.getString("escabilidade"));
                tecnico_terceirizado.getPessoa().setNome(rs.getString("nome"));
                tecnico_terceirizados.add(tecnico_terceirizado);
            }
        } catch (SQLException ex) {
            
        }finally{
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        
        return tecnico_terceirizados;
    }
    
    public void update(Tecnico_Terceirizado tec){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_atualizar_Tecnico_terceirizado(?, ?, ?)");
            stmt.setString(1, tec.getEspecializacacao());
            stmt.setString(2, tec.getEscabilidade());
            stmt.setString(3, tec.getPessoa().getNome());
            stmt.setInt(4, tec.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Atualizado");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public void delete(Tecnico_Terceirizado tec){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_deletar_tecnico_terceirizado(?)");
            stmt.setInt(1, tec.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Excluído");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
}
