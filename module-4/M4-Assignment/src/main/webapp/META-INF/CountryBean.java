package beans;

import java.io.Serializable;

public class CountryBean implements Serializable {
	private static final long serialVersionUID = 1L;
    private String country;
    private String location;
    private String highlight;
    private long population;
    private String language;

    public CountryBean() {}

    public CountryBean(String country, String location, String highlight, long population, String language) {
        this.country = country;
        this.location = location;
        this.highlight = highlight;
        this.population = population;
        this.language = language;
    }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getHighlight() { return highlight; }
    public void setHighlight(String highlight) { this.highlight = highlight; }

    public long getPopulation() { return population; }
    public void setPopulation(long population) { this.population = population; }

    public String getLanguage() { return language; }
    public void setLanguage(String language) { this.language = language; }
}
