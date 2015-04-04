package entity;

public class Coaches {
      public static int coache = 0;
      private String coacheID;
      private String name;
      private int age;
      private String nationality;
      private String playerID;
      
      public Coaches(String name, int age, String nationality, String PlayerID){
    	  this.coacheID = "c"+ (++coache);
    	  this.name = name;
    	  this.age  = age ;
    	  this.nationality = nationality;
    	  this.playerID = PlayerID;
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
      public String getPlayerID(){
    	  return this.playerID;
      }
      public String getCoachID(){
    	  return this.coacheID;
      }
      public void setCoachID(String id){
    	  this.coacheID = new String(id);
      }
}
