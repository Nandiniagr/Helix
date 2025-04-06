package tech.codingclub.helix.entity;

public class Tweet {

    public String message;
    public Long id;
    public Long created_at;
    public Long author_id;

    public Tweet(String message,Long id,Long created_at, Long author_id) {
        this.id = id;
        this.created_at = created_at;
        this.message = message;
        this.author_id = author_id;
    }
    public String getMessage() {
        return message;
    }


    public Tweet() {
    }
}
