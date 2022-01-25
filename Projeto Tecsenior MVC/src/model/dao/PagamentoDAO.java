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
import model.Pagamento;

/**
 *
 * @author leand
 */
public class PagamentoDAO {
    
    public void create(Pagamento pag){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_criar_Pagamento(?)");
            stmt.setString(1, pag.getForma_pagamento());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Salvo");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao salvar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public List<Pagamento> read(){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        List<Pagamento> pagamentos = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement("call sp_listar_Pagamento" + " (?)");
            rs = stmt.executeQuery();
            
            while (rs.next()) {                
                Pagamento pagamento = new Pagamento();
                pagamento.setId(rs.getInt("id"));
                pagamento.setForma_pagamento(rs.getString("forma_pagamento"));
                pagamentos.add(pagamento);
            }
        } catch (SQLException ex) {
            
        }finally{
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        
        return pagamentos;
    }
    
    public void update(Pagamento pag){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_atualizar_Pagamento(?, ?)");
            stmt.setString(1, pag.getForma_pagamento());
            stmt.setInt(2, pag.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Atualizado");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public void delete(Pagamento pag){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_excluir_Pagamento(?)");
            stmt.setInt(1, pag.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Excluído");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
}
