package entity;

public class Corporation {
     private static int CorporationID = 0 ;
     private String name;
     private String corporrationStrID;
     
     public Corporation(String name){
    	 this.name = name;
    	 this.corporrationStrID = "s" + (++CorporationID);
     }
     
     public String getName(){
    	 return this.name;
     }
     
     public String getCorporationID (){
    	 return this.corporrationStrID;
     }
     
     public void setCorporationID(String id){
    	 this.corporrationStrID = new String(id);
     }
}
