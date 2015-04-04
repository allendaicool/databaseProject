package entity;

public class Tournaments {

	  public static int id = 0;
	  private String name;
	  private String year;
	  private String place;
	  private String surface;
	  private String category;
	  private double prizeMoney;
	  private String championID;
	  
	  public Tournaments(String name, String year, String place, String surface, String category,double prizeMoney, String championID){
		  this.championID = "t" + (++id);
		  this.name = name ;
		  this.year = year;
		  this.place = place;
		  this.surface = surface;
		  this.category = category;
		  this.prizeMoney = prizeMoney;
		  this.championID = championID;
	  }
	  
	  public String getName(){
		  return this.name;
	  }
	  
	  public String getYear(){
		  return this.year;
	  }
	  
	  public String getPlace(){
		  return this.place;
	  }
	  
	  public String getSurface(){
		  return this.surface;
	  }
	  
	  public String getCategory(){
		  return this.category;
	  }
	  
	  public double getPrizeMoney(){
		  return this.prizeMoney;
	  }
	  public String getChampionID(){
		  return this.championID;
	  }
}
