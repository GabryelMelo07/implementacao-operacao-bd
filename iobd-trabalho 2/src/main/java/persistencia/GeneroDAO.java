package persistencia;

import java.sql.*;
import java.util.ArrayList;

import negocio.*;

public class GeneroDAO {

    private ConexaoPostgreSQL conexaoPostgreSQL;

    public GeneroDAO() {
        this.conexaoPostgreSQL = new ConexaoPostgreSQL();
    }

    public void inserir(Genero genero) throws SQLException {

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "insert into genero (descricao) values (?) RETURNING id;";

        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, genero.getDescricao());

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            genero.setId(rs.getInt("id"));
        }
        stmt.close();
        connection.close();

    }

    public void remover(Genero genero) throws SQLException {

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "BEGIN; UPDATE filme SET genero = NULL WHERE genero = ?; DELETE FROM genero WHERE id = ?; COMMIT;";

        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setInt(1, genero.getId());
        stmt.setInt(2, genero.getId());
        stmt.execute();
        stmt.close();

        System.out.println("GENERO EXCLUIDO.");

    }

    public ArrayList<Genero> listar() throws SQLException {

        ArrayList<Genero> vetGenero = new ArrayList<>();

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "SELECT * FROM genero;";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        ResultSet rs = preparedStatement.executeQuery();

        while (rs.next()) {
            Genero genero = new Genero(rs.getString("descricao"));
            genero.setId(rs.getInt("id"));
            vetGenero.add(genero);
        }
        connection.close();
        return vetGenero;
    }    
}
