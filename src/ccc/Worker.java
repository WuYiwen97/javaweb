package ccc;
public class Worker
{
	private String name=null;
	private long number;
	private double height,weight;
	public String getName()
	{return name;
	}
	/*public String getName()
  {try
     {byte b[]=name.getBytes("ISO-8859-1");
       name=new String(b);
       return name;
     }
    catch(Exception e)
    {return name;}
  }*/
	public void setName(String newName)
	{name=newName;}
	public long getNumber()
	{return number;}
	public void setNumber(long newNumber)
	{ number=newNumber;}
	public double getHeight()
	{return height;}
	public void setHeight(double newHeight)
	{height=newHeight;}
	public double getWeight()
	{return weight;}
	public void setWeight(double newWeight)
	{weight=newWeight;}
}