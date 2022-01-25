/*
 * To pednge this license header, choose License Headers in Project Properties.
 * To pednge this template file, choose Tools | Templates
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
import model.Pedido;

/**
 *
 * @author leand
 */
public class PedidoDAO {

    public void create(Pedido ped) {

        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("call sp_criar_pedido(?, ?, ?, ?)");
            stmt.setString(1, ped.getSituacao());
            stmt.setString(2, ped.getCliente().getPessoa().getNome());
            stmt.setString(3, ped.getPlano().getNome());
            stmt.setString(4, ped.getPagamento().getForma_pagamento());

            stmt.executeUpdate();

            JOptionPane.showMessageDialog(null, "Salvo");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao salvar: " + ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }
    }

    public List<Pedido> read() {

        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Pedido> pedidos = new ArrayList<>();

        try {
            stmt = con.prepareStatement("call sp_listar_Pedido" + " (?)");
            rs = stmt.executeQuery();

            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setSituacao(rs.getString("situacao"));
                pedido.getCliente().getPessoa().setNome(rs.getString("nome"));
                pedido.getPlano().setNome(rs.getString("plano"));
                pedido.getPagamento().setForma_pagamento(rs.getString("forma_pagamento"));
                pedidos.add(pedido);
            }
        } catch (SQLException ex) {

        } finally {
            ConnectionFactory.closeConnection(con, stmt, rs);
        }

        return pedidos;
    }

    public void update(Pedido ped) {

        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("call sp_atualizar_Pedido(?, ?, ?, ?)");
            stmt.setString(1, ped.getSituacao());
            stmt.setString(2, ped.getCliente().getPessoa().getNome());
            stmt.setString(3, ped.getPlano().getNome());
            stmt.setString(4, ped.getPagamento().getForma_pagamento());
            stmt.setInt(9, ped.getId());

            stmt.executeUpdate();

            JOptionPane.showMessageDialog(null, "Atualizado");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }
    }

    public void delete(Pedido ped) {

        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("call sp_deletar_pedido(?)");
            stmt.setInt(1, ped.getId());

            stmt.executeUpdate();

            JOptionPane.showMessageDialog(null, "Excluído");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir: " + ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }
    }
}
