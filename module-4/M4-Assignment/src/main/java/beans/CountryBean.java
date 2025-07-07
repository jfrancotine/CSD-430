//Jose Franco
//06/10/2025
//Module 4 Assignment


// defining class
package beans;

// importing Serializable to allow the bean to be saved and restored as an object
import java.io.Serializable;

// JavaBean class that holds data about a country
public class CountryBean implements Serializable {
	private static final long serialVersionUID = 1L;

    // declaring private fields representing different attributes of a country
    private String country;
    private String location;
    private String highlight;
    private long population;
    private String language;

    // constructor required for JavaBean compliance
    public CountryBean() {}

    // constructor for initializing the bean with values
    public CountryBean(String country, String location, String highlight, long population, String language) {
        this.country = country;
        this.location = location;
        this.highlight = highlight;
        this.population = population;
        this.language = language;
    }

    // getter and setter for country
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }

    // getter and setter for location
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }

    // Getter and setter for highlight
    public String getHighlight() {
        return highlight;
    }
    public void setHighlight(String highlight) {
        this.highlight = highlight;
    }

    // Getter and setter for population
    public long getPopulation() {
        return population;
    }
    public void setPopulation(long population) {
        this.population = population;
    }

    // Getter and setter for language
    public String getLanguage() {
        return language;
    }
    public void setLanguage(String language) {
        this.language = language;
    }
}



