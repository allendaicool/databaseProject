package entity;

public class Referee {
    public static int ID = 0;
    private String name;
    private String refereeId;
    
    public Referee(String name){
    	this.name = name;
    	this.refereeId = "r"+(++ID);
    }
    
    public  String getName(){
    	return this.name;
    }
    
    public String getRefereeId(){
    	return this.refereeId;
    }
    
    public void setRefereeId(String id){
    	this.refereeId = new String(id);
    }
}
