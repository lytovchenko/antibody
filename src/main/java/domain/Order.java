package domain;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Order {

    private int id;
    private String dateRequested;
    private String person;
    private String item;
    private String amount;
    private String company;
    private String catalog;
    private Boolean isOrdered = false;
    private String dateOrdered;
    private Boolean isDelivered = false;
    private String dateDelivered;
    private String url;

    public Order(int id, String dateRequested, String person, String item, String amount, String company, String catalog, Boolean isOrdered, String dateOrdered, Boolean isDelivered, String dateDelivered, String url) {
        this.id = id;
        this.dateRequested = dateRequested;
        this.person = person;
        this.item = item;
        this.amount = amount;
        this.company = company;
        this.catalog = catalog;
        this.isOrdered = isOrdered;
        this.dateOrdered = dateOrdered;
        this.isDelivered = isDelivered;
        this.dateDelivered = dateDelivered;
        this.url = url;
    }

    public Order(String dateRequested, String person, String item, String amount, String company, String catalog, Boolean isOrdered, String dateOrdered, Boolean isDelivered, String dateDelivered, String url) {
        this.dateRequested = dateRequested;
        this.person = person;
        this.item = item;
        this.amount = amount;
        this.company = company;
        this.catalog = catalog;
        this.isOrdered = isOrdered;
        this.dateOrdered = dateOrdered;
        this.isDelivered = isDelivered;
        this.dateDelivered = dateDelivered;
        this.url = url;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDateRequested() {
        return dateRequested;
    }

    public void setDateRequested(String dateRequested) {
        this.dateRequested = dateRequested;
    }

    public String getPerson() {
        return person;
    }

    public void setPerson(String person) {
        this.person = person;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
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

    public Boolean getOrdered() {
        return isOrdered;
    }

    public void setOrdered(Boolean ordered) {
        isOrdered = ordered;
    }

    public String getDateOrdered() {
        return dateOrdered;
    }

    public void setDateOrdered(String dateOrdered) {
        this.dateOrdered = dateOrdered;
    }

    public Boolean getDelivered() {
        return isDelivered;
    }

    public void setDelivered(Boolean delivered) {
        isDelivered = delivered;
    }

    public String getDateDelivered() {
        return dateDelivered;
    }

    public void setDateDelivered(String dateDelivered) {
        this.dateDelivered = dateDelivered;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", dateRequested=" + dateRequested +
                ", person='" + person + '\'' +
                ", item='" + item + '\'' +
                ", amount='" + amount + '\'' +
                ", company='" + company + '\'' +
                ", catalog='" + catalog + '\'' +
                ", isOrdered=" + isOrdered +
                ", dateOrdered=" + dateOrdered +
                ", isDelivered=" + isDelivered +
                ", dateDelivered=" + dateDelivered +
                ", url='" + url + '\'' +
                '}';
    }
}
