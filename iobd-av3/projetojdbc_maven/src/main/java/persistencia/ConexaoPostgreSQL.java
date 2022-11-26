package persistencia;

import java.sql.*;

public class ConexaoPostgreSQL {
   
    public Connection getConnection(){

        String dbname = "av2";
        
        try {
                
            return DriverManager.getConnection("jdbc:postgresql://localhost:5432/" + dbname, "postgres", "postgres");
            
        } catch (SQLException e){

            System.out.println("ERRO DE CONEXAO!");

        }

        return null;

    }

}
