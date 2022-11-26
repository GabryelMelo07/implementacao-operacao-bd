package negocio;

public class Pessoa {

    private int id;
    private String nome;
    private String sobrenome;
    private Endereco endereco;

    public Pessoa(){
        this.endereco = new Endereco();
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }
    
    @Override
    public String toString() {
        return String.format("      %d      |       %s      |       %s      |       %s      ", this.id, this.nome, this.sobrenome, this.endereco);
    }

}
