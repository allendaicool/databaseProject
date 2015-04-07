package dao;

import java.util.Date;

public class player_opponent {
	public String playerName;
	public String opponentName;
    public Date matchDate;
    public String environment;
    public String score;
    
    public player_opponent(String playerName, String opponentName, Date matchDate, String environment,String score){
    	this.playerName = playerName;
    	this.opponentName = opponentName;
    	this.matchDate = matchDate;
    	this.environment = environment;
    	this.score = score;
    }
}
