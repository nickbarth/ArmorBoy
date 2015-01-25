package
{
  import org.flixel.*;

  public class Coins extends FlxEmitter
  {
    public function Coins()
    {
      super();

      setXSpeed(-150, 150);
      setYSpeed(-200, -100);
      setRotation(0, 0);
      gravity = 350;
      bounce = 0.5;

      for(var i:int = 0; i < 40; i++)
        add(new Coin());
    }
  }
}
