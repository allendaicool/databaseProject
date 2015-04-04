package entity;

public class Sponsor {
	
	private String CorporationID;
	private String PlayerID;
	private double fees;
	
	public Sponsor(String cid , String pid, double fee){
		this.fees = fee;
		this.PlayerID = pid;
		this.CorporationID = cid;
	}
	
	public String getPid (){
		return this.PlayerID;
	}
	
	public double getFee(){
		return this.fees;
	}
	
	public String getCid(){
		return this.CorporationID;
	}
}
