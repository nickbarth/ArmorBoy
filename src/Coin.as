package
{
  import org.flixel.*;

  public class Coin extends FlxParticle
  {
    [Embed(source="Coin.png")] public var ImgCoin:Class;

    public function Coin()
    {
      super();

      loadGraphic(ImgCoin, true, false, 8, 8);
      addAnimation("spin", [0, 1, 2, 3], 10, true);
      exists = false;
      play("spin");
    }

    override public function update():void
    {
      if (y > 240) kill();
      super.update();
    }
  }
}
