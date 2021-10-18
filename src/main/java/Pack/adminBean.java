package Pack;

public class adminBean {
    String ad_id;
    String ad_pass;
    int ad_num;
    Boolean infoCheck = false;

    public Boolean getInfoCheck() {
        return infoCheck;
    }

    public void setInfoCheck(Boolean infoCheck) {
        this.infoCheck = infoCheck;
    }

    public adminBean() {

    }

    public String getAd_id() {
        return ad_id;
    }

    public void setAd_id(String ad_id) {
        this.ad_id = ad_id;
    }

    public String getAd_pass() {
        return ad_pass;
    }

    public void setAd_pass(String ad_pass) {
        this.ad_pass = ad_pass;
    }

    public int getAd_num() {
        return ad_num;
    }

    public void setAd_num(int ad_num) {
        this.ad_num = ad_num;
    }

}
