package persistencia;

import java.sql.*;
import negocio.*;

public class EnderecoDAO {
    
    private ConexaoPostgreSQL conexaoPostgreSQL;

    public EnderecoDAO() {

        this.conexaoPostgreSQL = new ConexaoPostgreSQL();

    }

    public void inserir(Pessoa p) throws SQLException {

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "UPDATE pessoa SET rua = ?, bairro = ?, complemento = ?, numero = ? WHERE id = ?;";

        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, p.getEndereco().getRua());
        stmt.setString(2, p.getEndereco().getBairro());
        stmt.setString(3, p.getEndereco().getComplemento());
        stmt.setString(4, p.getEndereco().getNumero());
        stmt.setInt(5, p.getId());

        stmt.execute();
        stmt.close();
        connection.close();

        System.out.println("ENDEREÇO INSERIDO");

    }

    public void atualizar(Endereco endereco, int id) throws SQLException {

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "UPDATE pessoa SET rua = ?, bairro = ?, complemento = ?, numero = ? WHERE id = ?;";

        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, endereco.getRua());
        stmt.setString(2, endereco.getBairro());
        stmt.setString(3, endereco.getComplemento());
        stmt.setString(4, endereco.getNumero());
        stmt.setInt(5, id);

        stmt.execute();
        stmt.close();
        connection.close();

        System.out.println("ENDEREÇO ATUALIZADO");

    }

    public void remover(Pessoa p) throws SQLException {

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "UPDATE pessoa SET rua = null, bairro = null, complemento = null, numero = null WHERE id = ?;";

        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setInt(1, p.getId());
        stmt.execute();
        stmt.close();
        connection.close();
        p.setEndereco(new Endereco());

        System.out.println("ENDEREÇO REMOVIDO");
    }

}
