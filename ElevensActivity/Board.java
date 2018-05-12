import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.util.*;
/**
 * Write a description of class Board here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Board extends World
{
    String [] ranks = {"king","queen", "jack", "ace","2","3","4","5","6","7","8","9","10"};
    String [] suits = {"hearts", "clubs", "spades", "diamonds"};
    int [] values = {0,0,0,1,2,3,4,5,6,7,8,9,10};

    public Deck myDeck;
    public ElevensBoard eb;
    public String txt = "";

    Label lab;
    Label auto;
    
    boolean autoSwitch = false;
    //public ElevensBoard myHand;
    /**
     * Constructor for objects of class Board.
     * 
     */

    public Board()
    {    
        // Create a new world with 600x400 cells with a cell size of 1x1 pixels.
        super(657, 400, 1); 
        startGame();
        //cardTester();
        prepare();
    }

    /**
     * Prepare the world for the start of the program. That is: create the initial
     * objects and add them to the world.
     */

    public void cardTester()
    {

        Card card = new Card("king", "diamonds", 0);
        addObject(card,100,241);
        Card card2 = new Card("2", "spades", 2);
        addObject(card2,244,246);
        Card card3 = new Card("2", "hearts", 2);
        addObject(card3,405,251);
    }

    public void deckTester()
    {
        Card nextCard;
        myDeck = new Deck(ranks, suits, values);
        nextCard = myDeck.deal();
        while (nextCard != null)
        {
            addObject(nextCard, 300, 200);
            nextCard = myDeck.deal();
        }
        myDeck.shuffle();
    }
    /* Start Game - create the deck & the elevensBoard, add them to the world, 
    * add the text to the game using Label and then add the Restart and Replace Buttons and 
    * an error message Label.
    * then dealMyCards() from the Elevens Board 
    * 
    */
    public void startGame(){ 
        Label replace = new Button("REPLACE");
        Label restart = new Button("RESTART");
        auto = new Button("AUTO");
        Label hint = new Button("HINT");
        addObject(replace, 250, 100);
        addObject(restart, 450, 100);
        addObject(auto, 250, 50);
        addObject(hint, 450, 50);
        addText("Pick two cards that add up to 11 OR JQK and click replace.");
        myDeck = new Deck(ranks, suits, values);
        myDeck.shuffle();
        eb = new ElevensBoard(myDeck);

        addObject(eb, -100, -100);
        for(int i = 0; i < 9; i++) {
            eb.playerHand.add(myDeck.deal());
            addObject(eb.playerHand.get(i), 73/2 + 73 * i, 300);
        }
        if(!eb.validHand()) {
            addText("Game Over! There are no valid replacements.");
            Greenfoot.stop();
        }
    }
    /* 
    *  Restart - empties the world. Then calls startGame()
    */
    public void restart(){
       removeObjects(getObjects(null));
       startGame();
    }
    /* 
    * Replace - replaces the cards if it is a valid selection, error message for invalid selection, then checks for win or lose 
    */
    public void replace(){
        if(eb.validSelect()) {
            eb.replaceSelected();
            addText("");
        } else{
            addText("Invalid selection");
        }
        eb.hasClicked = new ArrayList<Integer>();
        if(eb.emptyHand()) {
            addText("You win!");
            Greenfoot.stop();
        } else if(!eb.validHand()) {
            addText("Game Over! No more cards can be replaced.");
            Greenfoot.stop();
        }
    }
    
    public void addText(String txt) {
            removeObject(lab);
            lab = new Label(txt, 25);
            addObject(lab, 330, 150);
    }
    
    public void automate() {
        if(autoSwitch) {
            autoSwitch = false;
            addText("Auto stopped. Pick two cards that add up to 11 OR JQK and click replace.");
        } else{
            autoSwitch = true;
            addText("Automation mode initiated. Click anywhere to stop.");
        }
    }
    
    public void hint() {
        eb.hasClicked = new ArrayList<Integer>();
        if(eb.containsJQK(eb.playerHand)) {
            eb.playJQK(eb.playerHand);
        } else if(eb.containsPairSum11(eb.playerHand)) {
            eb.playPairSum11(eb.playerHand);
        }
    }

    /**
     * Prepare the world for the start of the program.
     * That is: create the initial objects and add them to the world.
     */
    private void prepare()
    {
        Card card = new Card("10", "spades", 10);
        addObject(card,422,83);
        card.setLocation(402,289);
        card.setLocation(41,312);
        card.setLocation(485,298);
        removeObject(card);
    }
    
    public void act() {
           if(autoSwitch) {
            eb.clearHand();
            eb.playPairSum11(eb.playerHand);
            eb.playHand();
            eb.clearHand();
            eb.playJQK(eb.playerHand);
            eb.playHand();
            if(eb.emptyHand()) {
                addText("You win!");
                autoSwitch = false;
            }else if(!eb.validHand()) {
                addText("Game Over! No more cards can be replaced.");
                autoSwitch = false;
            }
        }
    }
}

