package apresentacao;

import java.sql.SQLException;
import negocio.*;
import persistencia.*;

public class Main {
  public static void main(String[] args) throws SQLException {
    
    Pessoa pessoa = new Pessoa();
    pessoa.setNome("Jonatan");
    pessoa.setSobrenome("Menezes");
    new PessoaDAO().inserir(pessoa);
    
    pessoa.setId(2);
    pessoa.setNome("Priscila");
    pessoa.setSobrenome("Vieira");
    new PessoaDAO().atualizar(pessoa);

    Endereco endereco = new Endereco();
    endereco.setRua("Gen. Neto");
    endereco.setBairro("Centro");
    endereco.setComplemento("Rua da praca Tamandare");
    endereco.setNumero("154");
    pessoa.setEndereco(endereco);
    new EnderecoDAO().inserir(pessoa);
    
    new EnderecoDAO().remover(pessoa);

    new PessoaDAO().remover(pessoa);

    System.out.println(pessoa.toString());
    
  }

}