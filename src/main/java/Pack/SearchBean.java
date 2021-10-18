package Pack;

public class SearchBean {
    private String input;
    private String start;
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInput() {
        return input;
    }

    public void setInput(String input) {
        this.input = input;
    }

    public int getStart() { // 인트로 변환!
        return Integer.parseInt(start);
    }

    public void setStart(String start) {
        this.start = start;
    }
}
