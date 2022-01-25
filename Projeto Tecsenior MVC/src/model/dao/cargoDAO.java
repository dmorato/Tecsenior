/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leand
 */
public class cargoDAO {
    
    public void create(){
        
        Connection c = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
                
        try {
            stmt = c.prepareStatement("");
            
            
        } catch (SQLException ex) {
            Logger.getLogger(cargoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
