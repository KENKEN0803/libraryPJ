package Pack;

public class bookBean {
    private String b_id;
    private String b_name;
    private String b_author;
    private String b_publisher;
    private String b_genre;
    private String b_ISBN;
    private String b_call_number;
    private String reserve_date;
    private String return_date;
    private int cnt;
    private int rent_tf;
    private String loginId;
    private String member_mem_id;
    private int countReservedId;

    public int getCountReservedId() {
        return countReservedId;
    }

    public void setCountReservedId(int countReservedId) {
        this.countReservedId = countReservedId;
    }

    public String getMember_mem_id() {
        return member_mem_id;
    }

    public void setMember_mem_id(String member_mem_id) {
        this.member_mem_id = member_mem_id;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public int getRent_tf() {
        return rent_tf;
    }

    public void setRent_tf(int rent_tf) {
        this.rent_tf = rent_tf;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public String getB_call_number() {
        return b_call_number;
    }

    public void setB_call_number(String b_call_number) {
        this.b_call_number = b_call_number;
    }

    public String getReserve_date() {
        return reserve_date;
    }

    public void setReserve_date(String reserve_date) {
        this.reserve_date = reserve_date;
    }

    public String getReturn_date() {
        return return_date;
    }

    public void setReturn_date(String return_date) {
        this.return_date = return_date;
    }

    public String getB_id() {
        return b_id;
    }

    public void setB_id(String b_id) {
        this.b_id = b_id;
    }

    public String getB_name() {
        return b_name;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }

    public String getB_author() {
        return b_author;
    }

    public void setB_author(String b_author) {
        this.b_author = b_author;
    }

    public String getB_publisher() {
        return b_publisher;
    }

    public void setB_publisher(String b_publisher) {
        this.b_publisher = b_publisher;
    }

    public String getB_genre() {
        return b_genre;
    }

    public void setB_genre(String b_genre) {
        this.b_genre = b_genre;
    }

    public String getB_ISBN() {
        return b_ISBN;
    }

    public void setB_ISBN(String b_ISBN) {
        this.b_ISBN = b_ISBN;
    }

}
