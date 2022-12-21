package persistencia;

import java.sql.*;

public class ConexaoPostgreSQL {
   
    public Connection getConnection(){

        String dbname = "cinema";
        
        try {
                
            return DriverManager.getConnection("jdbc:postgresql://localhost:5432/" + dbname, "estagiario", "123");
            
        } catch (SQLException e){

            System.out.println("ERRO DE CONEXAO!");

        }

        return null;

    }

}
