package tech.codingclub.helix.entity;
public class WikiResult {

    public String getQuery() {
        return query;
    }

    public String getResult() {
        return result;
    }

    public String getImage_url() {
        return image_url;
    }

    private String query;
    private String result;
    private String image_url;
    public WikiResult(String query, String result, String image_url) {
        this.query = query;
        this.result = result;
        this.image_url = image_url;
    }




}

