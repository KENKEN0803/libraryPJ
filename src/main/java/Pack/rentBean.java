package Pack;

public class rentBean {
    private int rent_id;
    private int rent_tf;
    private String rent_date;
    private String return_date;
    private int rent_cnt;
    private String book_b_id;
    private String member_mem_id;
    private String admin_ad_id;
    int cnt;
    private String b_id;
    private String b_name;

    public String getB_name() {
        return b_name;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }

    public String getB_id() {
        return b_id;
    }

    public void setB_id(String b_id) {
        this.b_id = b_id;
    }

    public int getRent_tf() {
        return rent_tf;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public int getRent_id() {
        return rent_id;
    }

    public void setRent_id(int rent_id) {
        this.rent_id = rent_id;
    }

    public int isRent_tf() {
        return rent_tf;
    }

    public void setRent_tf(int rent_tf) {
        this.rent_tf = rent_tf;
    }

    public String getRent_date() {
        return rent_date;
    }

    public void setRent_date(String rent_date) {
        this.rent_date = rent_date;
    }

    public String getReturn_date() {
        return return_date;
    }

    public void setReturn_date(String return_date) {
        this.return_date = return_date;
    }

    public int getRent_cnt() {
        return rent_cnt;
    }

    public void setRent_cnt(int rent_cnt) {
        this.rent_cnt = rent_cnt;
    }

    public String getBook_b_id() {
        return book_b_id;
    }

    public void setBook_b_id(String book_b_id) {
        this.book_b_id = book_b_id;
    }

    public String getMember_mem_id() {
        return member_mem_id;
    }

    public void setMember_mem_id(String member_mem_id) {
        this.member_mem_id = member_mem_id;
    }

    public String getAdmin_ad_id() {
        return admin_ad_id;
    }

    public void setAdmin_ad_id(String admin_ad_id) {
        this.admin_ad_id = admin_ad_id;
    }
}
