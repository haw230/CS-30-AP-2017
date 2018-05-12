import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.util.*;

/**
 * Write a description of class Player here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ElevensBoard extends Actor
{
    /**
     * Act - do whatever the Player wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */
    boolean init = true;
    ArrayList <Card> playerHand = new ArrayList<Card> (9);
    ArrayList<Integer> hasClicked = new ArrayList<Integer>();

    Deck myDeck;

    public ElevensBoard(Deck theDeck)
    {
       this.myDeck = theDeck;
    }

    public boolean containsPairSum11(ArrayList <Card> hand){
       for(int i = 0; i < hand.size() - 1; i++) {
           for(int j = i + 1; j < hand.size(); j++) {
               if(hand.get(j).getValue() + hand.get(i).getValue() == 11) {
                   return true;
                }
            }
        }
        return false;

    }

    public boolean containsJQK(ArrayList <Card> hand){
        boolean hasJ = false;
        boolean hasQ = false;
        boolean hasK = false;
        if(hand.size() > 2) {
            for(int i = 0; i < hand.size(); i++) {
                 if(hand.get(i).getRank() == "jack") {
                        hasJ = true;
                 } else if(hand.get(i).getRank() == "queen") {
                        hasQ = true;
                 } else if(hand.get(i).getRank() == "king") {
                        hasK = true;
                 }
            }
        }
        return (hasJ && hasQ && hasK);
    }

    public ArrayList getSelected(){ //good
        ArrayList <Card> selectHand = new ArrayList <Card>();
        for(int i = 0; i < playerHand.size(); i++) {
            if(playerHand.get(i).clicked() == true) {
                selectHand.add(playerHand.get(i));
                this.hasClicked.add(i);
                //System.out.println(this.hasClicked);
            }
        }
        return selectHand;

    }

    public boolean validSelect(){
        ArrayList <Card> selectHand = getSelected();
        if((selectHand.size() == 2 && containsPairSum11(selectHand)) || (selectHand.size() == 3 && containsJQK(selectHand))) {
            return true;
        }
        return false;
    }
    public boolean emptyHand()
    {
       /* Implemented in Activity 7 */
       for(int i = 0; i < this.playerHand.size(); i++) {
           if(this.playerHand.get(i).getRank() != "general") {
               return false;
            }
        }
        return true;
    }

    public boolean validHand()
    {
      if(containsPairSum11(this.playerHand) || containsJQK(this.playerHand)) {
          return true;
        }
      return false;
    }

    public void replaceSelected()
    { 
       /* Implemented in Activity 7 */
       
       for(int i = 0; i < this.hasClicked.size(); i++) {
           int clickedCard = this.hasClicked.get(i);
           getWorld().removeObject(this.playerHand.get(clickedCard));
           if(!myDeck.isEmpty()) {
               this.playerHand.set(clickedCard, this.myDeck.deal());
               getWorld().addObject(playerHand.get(clickedCard), 73/2 + 73 * clickedCard, 300);
            } else{
               //String cardRank, String cardSuit, int cardPointValue
               this.playerHand.set(clickedCard, new Card("general", "general", 0));
            }
           
       }
       //System.out.println(Arrays.toString(playerHand.toArray()));
    }

    public void dealMyCards(){
        Card tcard;

        for (int i=0; i< 9; i++)
        {              
            if (myDeck != null)
            {
                tcard = myDeck.deal();
                if (tcard != null){
                    playerHand.add(tcard);
                    getWorld().addObject((Card)playerHand.get(i), 73/2 + (i*73), 300);
                }
            }
        }
    }
    
    // set selected on the first 11 and then exit - assumes one exists
    public void playPairSum11(ArrayList <Card> hand){ 
       for(int i = 0; i < hand.size() - 1; i++) {
           for(int j = i + 1; j < hand.size(); j++) {
               if(hand.get(j).getValue() + hand.get(i).getValue() == 11) {
                   hand.get(j).setClicked(true);
                   hand.get(i).setClicked(true);
                   /*try{
                       Thread.sleep(5000);
                    } catch(InterruptedException e){
                       e.printStackTrace();
                    }*/
                   //getSelected();
                   //replaceSelected();
                   return;
                }
            }
        }
    }
    // set selected on the first JQK - assumes on exists
    public void playJQK(ArrayList <Card> hand) {
        if(containsJQK(hand)) {
            findJQK(hand, "king");
            findJQK(hand, "queen");
            findJQK(hand, "jack");
            return;
        }
    }
    
    private void findJQK(ArrayList <Card> hand, String face) {
        for(int i = 0; i < hand.size(); i++) {
            if(hand.get(i).getRank() == face) {
                hand.get(i).setClicked(true);
                return;
            }
        }
    }
    // check if it is a valid hand - if it contains a JQK play it, else if it contains an 11, play it
    public void playHand() {
            Greenfoot.delay(60);
            getSelected();
            replaceSelected();
    }
    // sets all cards to selected=false
    public void clearHand() {
        this.hasClicked = new ArrayList<Integer>();
        for(int i = 0; i < playerHand.size(); i++) {
            playerHand.get(i).setClicked(false);
        }
    }
    

    public void act() 
    {
    }    
}