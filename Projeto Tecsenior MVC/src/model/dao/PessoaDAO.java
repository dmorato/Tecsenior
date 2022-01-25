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
import model.Pessoa;

/**
 *
 * @author leand
 */
public class PessoaDAO {
    
    public void create(Pessoa pes){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_criar_pessoa(?, ?, ?, ?, ?)");
            stmt.setString(1, pes.getNome());
            stmt.setString(2, pes.getCep());
            stmt.setString(3, pes.getTelefone());
            stmt.setInt(4, pes.getConta_financeira().getId());
            stmt.setInt(5, pes.getLogin().getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Salvo");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao salvar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public List<Pessoa> read(){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        List<Pessoa> pessoas = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement("call sp_listar_Pessoa" + " (?)");
            rs = stmt.executeQuery();
            
            while (rs.next()) {                
                Pessoa pessoa = new Pessoa();
                pessoa.setId(rs.getInt("id"));
                pessoa.setNome(rs.getString("nome"));
                pessoa.setCep(rs.getString("cep"));
                pessoa.setTelefone(rs.getString("telefone"));
                pessoa.getConta_financeira().setId(rs.getInt("conta_financeira"));
                pessoa.getLogin().setId(rs.getInt("login"));
                pessoas.add(pessoa);
            }
        } catch (SQLException ex) {
            
        }finally{
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        
        return pessoas;
    }
    
    public void update(Pessoa pes){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_atualizar_Pessoa(?, ?, ?, ?, ?, ?)");
            stmt.setString(1, pes.getNome());
            stmt.setString(2, pes.getCep());
            stmt.setString(3, pes.getTelefone());
            stmt.setInt(4, pes.getConta_financeira().getId());
            stmt.setInt(5, pes.getLogin().getId());
            stmt.setInt(6, pes.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Atualizado");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public void delete(Pessoa pes){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_deletar_pessoa(?)");
            stmt.setInt(1, pes.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Excluído");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
}
