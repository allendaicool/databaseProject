package entity;

public class user {
	 private String username;
     private String password;
     public boolean valid;
	
	
    
	
     public String getName() {
        return username;
			}

     public void setName(String newLastName) {
    	 username = newLastName;
			}
			

     public String getPassword() {
        return password;
	}

     public void setPassword(String newPassword) {
        password = newPassword;
	}
				
     public boolean isValid() {
        return valid;
	}

     public void setValid(boolean newValid) {
        valid = newValid;
	}	
}
