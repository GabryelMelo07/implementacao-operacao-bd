package negocio;

public class Filme {

    private int id;
    private String titulo;
    private String sinopse;
    private Genero genero;

    public Filme(String titulo, String sinopse, Genero genero) {
        this.titulo = titulo;
        this.sinopse = sinopse;
        this.genero = genero;
    }

    public int getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getSinopse() {
        return sinopse;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return String.format("   ID:   %d   |    TITULO:   %s   |   SINOPSE:   %s   |   GENERO:   %s   ", this.id, this.titulo, this.sinopse, this.genero);
    }
    
}
