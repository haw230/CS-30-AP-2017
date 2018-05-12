import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Card represents a playing card.
 *
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Card extends Actor
{
    private int value;
    private String rank;
    private String suit;
    private boolean clicked;

    /**
     * Creates a newCard instance.
     *
     * @param cardRank  aString value
     *                  containing the rank of the card
     * @param cardSuit  aString value
     *                  containing the suit of the card
     * @param cardPointValue anint value
     *                  containing the point value of the card
     */
    public Card(String cardRank, String cardSuit, int cardPointValue)
    {
        /* *** TO BE IMPLEMENTED IN ACTIVITY 1 *** */
        //setImage(filename created from CardRand and CardSuit);
        this.value = cardPointValue;
        this.rank = cardRank;
        this.suit = cardSuit;
        //System.out.println(this.rank + this.suit + ".GIF");
        if(this.rank != "general") {
            this.setImage(new GreenfootImage(this.rank + this.suit + ".GIF"));
        }
    }

    /**
     * Accesses thisCard's rank.
     * @return thisCard's rank.
     */
    public String getRank()
    {
        /* *** TO BE IMPLEMENTED IN ACTIVITY 1 *** */
        return this.rank;
    }

    /**
     * Accesses thisCard's suit.
     * @return thisCard's suit.
     */
    public String getSuit()
    {
        /* *** TO BE IMPLEMENTED IN ACTIVITY 1 *** */
        return this.suit;
    }

    /**
     * Accesses thisCard's point value.
     * @return thisCard's point value.
     */
    public int getValue()
    {
        /* *** TO BE IMPLEMENTED IN ACTIVITY 1 *** */
        return this.value;
    }

    /** Compare this card with the argument.
     * @param otherCard the other card to compare to this
     * @return true if the rank, suit, and point value of this card
     *              are equal to those of the argument;
     *         false otherwise.
     */
    public boolean  cardEqual(Card testCard)
    {
        /* *** TO BE IMPLEMENTED IN ACTIVITY 1 *** */
        if(this.value == testCard.value && this.rank == testCard.rank && this.suit == testCard.suit) {
            return true;
        } 
        return false;
    }

    /**
     * Converts the rank, suit, and point value into a string in the format
     *     "[Rank] of [Suit] (point value = [PointValue])".
     * This provides a useful way of printing the contents
     * of aDeck in an easily readable format or performing
     * other similar functions.
     *
     * @return aString containing the rank, suit,
     *         and point value of the card.
     */
    @Override
    public String toString()
    {
        /* *** TO BE IMPLEMENTED IN ACTIVITY 1 *** */
        return (this.rank + " of " + this.suit + " point value = " + Integer.toString(this.value));
    }
    
    public boolean clicked() {
        return this.clicked;
    }
    
    public void setClicked(boolean bool) {
        this.clicked = bool;
        if(this.clicked) {
            setImage(new GreenfootImage(this.rank + this.suit + "S.GIF"));
        } else{
            this.setImage(new GreenfootImage(this.rank + this.suit + ".GIF"));
        }
    }

    public void act() 
    {
        /* *** TO BE IMPLEMENTED Later *** */
        if(Greenfoot.mouseClicked(this)) {
            if(clicked) {
                setClicked(false);
            } else{
                setClicked(true);
            }
        }
    }
}
