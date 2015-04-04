package entity;

public class Players {
	public static  int PlayerID = 0;
	private String playerID;
	private String name;
	private int age;
	private String nationality;
	private double height;
	private double weight;
	private String plays;
	private double prizeMoney;
	private int rank;
	private int  points;
	public Players(String name,int age, String nationality, double height, double weight,String plays, double prizeMoney, int rank, int points)
	{
		this.playerID = "p"+  (++Players.PlayerID);
		this.name = name;
		this.nationality = nationality;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.plays = plays;
		this.prizeMoney = prizeMoney;
		this.points = points;
	}
	public String getPlayerID(){
		return this.playerID;
	}
	public String getName(){
		return this.name;
	}
	public int getAge(){
		return this.age;
	}
	public String getNationality(){
		return this.nationality;
	}
	public double getHeight(){
		return this.height;
	}
	public double getWeight(){
		return this.weight;
	}
	public String getPlays(){
		return this.plays;
	}
	public double getPrizeMoney(){
		return this.prizeMoney;
	}
	public int getRank(){
		return this.rank;
	}
	public int getPoints(){
		return this.points;
	}
}
