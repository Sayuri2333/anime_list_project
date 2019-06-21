package bean;
public class Usr {
    private String username = "";
    private String usernumber = "";
    private String usergender= "";
    private String userpassword = "";

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public String getUsergender() {
        return usergender;
    }

    public String getUsernumber() {
        return usernumber;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUsergender(String usergender) {
        this.usergender = usergender;
    }

    public void setUsernumber(String usernumber) {
        this.usernumber = usernumber;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }
}
