package apresentacao;

import java.sql.SQLException;
import java.util.ArrayList;

import negocio.*;
import persistencia.*;

public class Main {
  public static void main(String[] args) throws SQLException {

    // ==========================ACESSO NEGADO PARA O USUARIO ESTAGIARIO========================== \\
    
    // Genero aventura = new Genero("Aventura");    
    // new GeneroDAO().inserir(aventura);
    // aventura.setId(1);

    // Filme drdolittle = new Filme("Dr. Dolittle", "O Dr. Dolittle vive com uma variedade de animais exóticos e conversa com eles diariamente.", aventura);
    // new FilmeDAO().inserir(drdolittle);
    
    //new GeneroDAO().remover(aventura);

    // ==========================ACESSO PERMITIDO PARA O USUARIO ESTAGIARIO========================== \\
    
    ArrayList<Genero> vetGenero = new GeneroDAO().listar();
    for (Genero genero : vetGenero) {
      System.out.println(genero);
    }

  }
}