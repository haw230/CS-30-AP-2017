import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)
import java.util.ArrayList;

/**
 * The Deck class represents a shuffled deck of cards.
 * It provides several operations including
 *      initialize, shuffle, deal, and check if empty.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
 
public class Deck extends Actor
{
    /**
     * deck contains all the cards in the deck.
     */
    private ArrayList <Card> deck;
    private int size; //have to keep track of actualy deck (since cards aren't deleted, this is the deprecation index)
    /**
     * Creates a new Deck instance.
     * It pairs each element of ranks with each element of suits,
     * and produces one of the corresponding card.
     * @param ranks is an array containing all of the card ranks.
     * @param suits is an array containing all of the card suits.
     * @param values is an array containing all of the card point values.
     */
    public Deck(String [] ranks, String[] suits, int values[])
    {
        /* *** TO BE IMPLEMENTED IN ACTIVITY 2 *** */
        this.deck = new ArrayList <Card>(suits.length * ranks.length);
        for(int i = 0; i < suits.length; i++) {
            for(int j = 0; j < ranks.length; j++) {
                //System.out.println((int)(j));
                this.deck.add(new Card(ranks[j], suits[i], values[j]));
                //System.out.println(deck.get(deck.size() - 1).toString());
            }
        }
        this.size = deck.size();
        this.shuffle();
       // this.printDeck();
    }
    
        /**
     * Determines if this deck is empty (no undealt cards).
     * @return true if this deck is empty, false otherwise.
     */
    public boolean isEmpty()
    {
        /* *** TO BE IMPLEMENTED IN ACTIVITY 2 *** */
        return (this.size == 0); //stop 
    }
    /**
     * size is the number of not-yet-dealt cards.
     * Cards are dealt from the top (highest index) down.
     * The next card to be dealt is at size - 1.
     */
    public int size()
    {
        /* *** TO BE IMPLEMENTED IN ACTIVITY 2 *** */
        return this.size;
    }
    /**
     * Randomly permute the given collection of cards
     * and reset the size to represent the entire deck.
     */
    public void shuffle()
    {
         /* *** TO BE IMPLEMENTED IN ACTIVITY 4 *** */
         for(int i = this.size - 1; i > 0; i--) {
             int r = (int)(Math.random() * i);
             Card temp = deck.get(r);
             deck.set(r, deck.get(i));
             deck.set(i, temp);
         }
    }
    /**
     * Deals a card from this deck.
     * @return the card just dealt, or null if all the cards have been
     *         previously dealt.
     */
    public Card deal()
    {
            /* *** TO BE IMPLEMENTED IN ACTIVITY 2 *** */
        if(this.isEmpty()) {
            return null;
        } else{
            this.size--; //account for dealt card
            //System.out.println(this.size);
            return this.deck.get(this.size); //deck size - 1 is index of last card
        }
    }

    public void printDeck() { //prints out deck
        for(int i = 0; i < this.deck.size(); i++) {
            System.out.println(this.deck.get(i).toString());
        }
    }
     /**
     * Act - do whatever the Deck wants to do. This method is called whenever
     * the 'Act' or 'Run' button gets pressed in the environment.
     */
    public void act() 
    {
        // Add your action code here.
    }    
}