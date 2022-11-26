package persistencia;

import java.sql.*;

import negocio.Endereco;
import negocio.Pessoa;

public class PessoaDAO {

    private ConexaoPostgreSQL conexaoPostgreSQL;

    public PessoaDAO() {

        this.conexaoPostgreSQL = new ConexaoPostgreSQL();

    }

    public void inserir(Pessoa pessoa) throws SQLException {

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "insert into pessoa (nome, sobrenome) values (?, ?) RETURNING id;";
        
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        stmt.setString(1, pessoa.getNome());
        stmt.setString(2, pessoa.getSobrenome());
        
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            pessoa.setId(rs.getInt("id"));
        }
        stmt.close();
        connection.close();        
        System.out.println("PESSOA INSERIDA");

    }

    public void atualizar(Pessoa pessoa) throws SQLException {

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "UPDATE pessoa SET nome = ?, sobrenome = ? WHERE id = ?;";

        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, pessoa.getNome());
        stmt.setString(2, pessoa.getSobrenome());
        stmt.setInt(3, pessoa.getId());

        stmt.execute();
        stmt.close();
        connection.close();

        System.out.println("PESSOA ATUALIZADA");

    }

    public void remover(Pessoa p) throws SQLException {

        Connection connection = this.conexaoPostgreSQL.getConnection();

        String sql = "DELETE FROM pessoa WHERE id = ?";

        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setInt(1, p.getId());
        stmt.execute();
        stmt.close();

        p.setId(0);
        p.setEndereco(new Endereco());
        p.setNome(null);
        p.setSobrenome(null);        

        System.out.println("PESSOA REMOVIDA");

    }

    
}
