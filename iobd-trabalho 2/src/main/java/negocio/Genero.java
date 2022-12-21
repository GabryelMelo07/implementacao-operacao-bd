package negocio;

public class Genero {

    private int id;
    private String descricao;

    public Genero(String descricao) {
        this.descricao = descricao;
    }

    public int getId() {
        return id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public String toString() {
        return String.format("   DESCRICAO:   %s", this.descricao);
    }

}
