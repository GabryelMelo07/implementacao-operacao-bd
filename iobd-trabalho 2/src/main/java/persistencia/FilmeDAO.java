package persistencia;

import java.sql.*;

import negocio.*;

public class FilmeDAO {

    private ConexaoPostgreSQL conexaoPostgreSQL;

    public FilmeDAO() {
        this.conexaoPostgreSQL = new ConexaoPostgreSQL();
    }

    public void inserir(Filme filme) throws SQLException {

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "insert into filme (titulo, sinopse, genero) values (?, ?, ?) RETURNING id;";

        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, filme.getTitulo());
        stmt.setString(2, filme.getSinopse());
        stmt.setInt(3, filme.getGenero().getId());

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            filme.setId(rs.getInt("id"));
        }

        stmt.close();
        connection.close();
        
        System.out.println("FILME INSERIDO");

    }

    public void remover(Filme filme) throws SQLException {

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "DELETE FROM filme WHERE id = ?";

        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setInt(1, filme.getId());
        stmt.execute();
        stmt.close();

        System.out.println("FILME REMOVIDO");

    }
    
}
