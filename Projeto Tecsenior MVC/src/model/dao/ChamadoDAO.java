/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import model.Chamado;

/**
 *
 * @author leand
 */
public class ChamadoDAO {
       
    public void create(Chamado cha){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_criar_chamado(?, ?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, cha.getDescricao());
            stmt.setString(2, cha.getStatus());
            stmt.setDate(3, (Date) cha.getEmissao());
            stmt.setDate(4, (Date) cha.getConclusao());
            stmt.setString(5, cha.getTipo_chamado());
            stmt.setString(6, cha.getFuncionario().getPessoa().getNome());
            stmt.setString(7, cha.getTecnico_terceirizado().getPessoa().getNome());
            stmt.setString(8, cha.getCliente().getPessoa().getNome());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Salvo");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao salvar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public List<Chamado> read(){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        List<Chamado> chamados = new ArrayList<>();
        
        try {
            stmt = con.prepareStatement("call sp_listar_Chamado" + " (?)");
            rs = stmt.executeQuery();
            
            while (rs.next()) {                
                Chamado chamado = new Chamado();
                chamado.setDescricao(rs.getString("descricao"));
                chamado.setStatus(rs.getString("status"));
                chamado.setEmissao(rs.getDate("emissao"));
                chamado.setConclusao(rs.getDate("conclusao"));
                chamado.setTipo_chamado(rs.getString("tipo_chamado"));
                chamado.getFuncionario().getPessoa().setNome(rs.getString("nome"));
                chamado.getTecnico_terceirizado().getPessoa().setNome(rs.getString("nome"));
                chamado.getCliente().getPessoa().setNome(rs.getString("nome"));
                chamados.add(chamado);
            }
        } catch (SQLException ex) {
            
        }finally{
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
        
        return chamados;
    }
    
    public void update(Chamado cha){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_atualizar_Chamado(?, ?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, cha.getDescricao());
            stmt.setString(2, cha.getStatus());
            stmt.setDate(3, (Date) cha.getEmissao());
            stmt.setDate(4, (Date) cha.getConclusao());
            stmt.setString(5, cha.getTipo_chamado());
            stmt.setString(6, cha.getFuncionario().getPessoa().getNome());
            stmt.setString(7, cha.getTecnico_terceirizado().getPessoa().getNome());
            stmt.setString(8, cha.getCliente().getPessoa().getNome());
            stmt.setInt(9, cha.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Atualizado");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
    
    public void delete(Chamado cha){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = con.prepareStatement("call sp_deletar_chamado(?)");
            stmt.setInt(1, cha.getId());
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Excluído");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir: " + ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
}
