package tp_codecheck.tp03;

/**
   A simulated traffic light.
*/
public class TrafficLight1
{
   private String color;
   private int reds;

   /**
      Constructs a green traffic light.
   */
   public TrafficLight1()
   {
      this.color = "green";
      this.reds = 0;
   }

   /**
      Constructs a traffic light.
      @param initialColor the initial color "green", "yellow", or "red"
   */
   public TrafficLight1(String initialColor)
   {
      this.color = initialColor;
      this.reds = initialColor == "red" ? 1 : 0;
   }

   /**
      Moves this traffic light to the next color.
   */
   public void next()
   {
      switch (this.color) {
         case "red":
            this.color = "green";
            break;
         case "green":
            this.color = "yellow";
            break;
         case "yellow":
            this.color = "red";
            this.reds += 1;
            break;
      }
   }

   /**
      Returns the current color of this traffic light.
      @return the current color
   */
   public String getColor()
   {
      return this.color;
   }

   /**
      Counts how often this traffic light has been red.
      @return the number of times this traffic light has been red
   */
   public int getReds()
   {
      return this.reds;
   }
}