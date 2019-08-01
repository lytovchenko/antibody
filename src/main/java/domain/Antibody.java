package domain;

public class Antibody {

    private int id;
    private String antigen;
    private String produced;
    private String company;
    private String catalog;
    private String location;
    private String box;
    private String details;

    public Antibody(String antigen, String produced, String company, String catalog, String location, String box, String details) {

        this.antigen = antigen;
        this.produced = produced;
        this.company = company;
        this.catalog = catalog;
        this.location = location;
        this.box = box;
        this.details = details;
    }

    public Antibody(int id, String antigen, String produced, String company, String catalog, String location, String box, String details) {
        this.id = id;
        this.antigen = antigen;
        this.produced = produced;
        this.company = company;
        this.catalog = catalog;
        this.location = location;
        this.box = box;
        this.details = details;
    }

    public Antibody() {

        this.antigen = "0";
        this.produced = "0";
        this.company = "0";
        this.catalog = "0";
        this.location = "0";
        this.box = "0";
        this.details = "0";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAntigen() {
        return antigen;
    }

    public void setAntigen(String antigen) {
        this.antigen = antigen;
    }

    public String getProduced() {
        return produced;
    }

    public void setProduced(String produced) {
        this.produced = produced;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getCatalog() {
        return catalog;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getBox() {
        return box;
    }

    public void setBox(String box) {
        this.box = box;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @Override
    public String toString() {
        return "Antibody{" +
                "id=" + id +
                ", antigen='" + antigen + '\'' +
                ", produced='" + produced + '\'' +
                ", company='" + company + '\'' +
                ", catalog='" + catalog + '\'' +
                ", location='" + location + '\'' +
                ", box='" + box + '\'' +
                ", details='" + details + '\'' +
                '}';
    }
}

