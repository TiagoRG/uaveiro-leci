package tp_codecheck.tp03;

/**
   A simulated traffic light.
*/
public class TrafficLight2
{
   private int steps;

   /**
      Constructs a green traffic light.
   */
   public TrafficLight2()
   {
      this.steps = 0;
   }

   /**
      Constructs a traffic light.
      @param initialColor the initial color "green", "yellow", or "red"
   */
   public TrafficLight2(String initialColor)
   {
      switch (initialColor) {
         case "green":
            this.steps = 0;
            break;
         case "yellow":
            this.steps = 1;
            break;
         case "red":
            this.steps = 2;
            break;
      }
   }

   /**
      Moves this traffic light to the next color.
   */
   public void next()
   {
      steps++;
   }

   /**
      Returns the current color of this traffic light.
      @return the current color
   */
   public String getColor()
   {
      int rem = (this.steps + 1) % 3;
      if (rem == 0)
         return "red";
      else if (rem == 1)
         return "green";
      else
         return "yellow";
   }

   /**
      Counts how often this traffic light has been red.
      @return the number of times this traffic light has been red
   */
   public int getReds()
   {
      return (this.steps + 1) / 3;
   }
}