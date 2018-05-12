import greenfoot.*;  // (World, Actor, GreenfootImage, Greenfoot and MouseInfo)

/**
 * Write a description of class Button here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Button extends Label
{
private String name;
    /* 
     * Button is a label - only values of "REPLACE"
     *  and "RESTART" are implemented.
     */

    public Button(String str)
    {
        super(str, 24); 
        name=str;
                     
    }

    public void act(){
	if (Greenfoot.mouseClicked(this))
	{
	if (name.equals("RESTART"))
	((Board)getWorld()).restart();
	if (name.equals("REPLACE"))
	((Board)getWorld()).replace();
	if (name.equals("AUTO"))
	((Board)getWorld()).automate();
	if(name.equals("HINT"))
	((Board)getWorld()).hint();
	}}

}