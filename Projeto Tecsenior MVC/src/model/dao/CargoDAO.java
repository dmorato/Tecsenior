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
import model.Cargo;

/**
 *
 * @author leand
 */
public class CargoDAO {
    
    public void create(Cargo car){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_criar_Cargo(?, ?, ?, ?)");
            stmt.setString(1, car.getNome());
            stmt.setDouble(2, car.getSalario());
            stmt.setInt(3, car.getCarga_horaria());
            stmt.setString(4, car.getDescricao());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Salvo");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao salvar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public List<Cargo> read(){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        List<Cargo> cargos = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement("call sp_listar_Cargo" + " (?)");
            rs = stmt.executeQuery();
            
            while (rs.next()) {                
                Cargo cargo = new Cargo();
                cargo.setId(rs.getInt("id"));
                cargo.setNome(rs.getString("nome"));
                cargo.setSalario(rs.getDouble("salario"));
                cargo.setCarga_horaria(rs.getInt("carga_horaria"));
                cargo.setDescricao(rs.getString("descricao"));
                cargos.add(cargo);
            }
        } catch (SQLException ex) {
            
        }finally{
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        
        return cargos;
    }
    
    public void update(Cargo car){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_atualizar_Cargo(?, ?, ?, ?)");
            stmt.setString(1, car.getNome());
            stmt.setDouble(2, car.getSalario());
            stmt.setInt(3, car.getCarga_horaria());
            stmt.setString(4, car.getDescricao());
            stmt.setInt(5, car.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Atualizado");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public void delete(Cargo car){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_excluir_Cargo(?)");
            stmt.setInt(1, car.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Excluído");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
}
