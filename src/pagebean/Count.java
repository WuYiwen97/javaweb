package pagebean;

import java.io.Serializable;

public class Count implements Serializable
{
	private int count=0;
  	public void setCount(int c)
  	{
  		this.count=c;
  	}
  	public int getCount()
  	{
  		return count;
  	}
  	public void increment()
  	{
  		count++;
  	}
}
