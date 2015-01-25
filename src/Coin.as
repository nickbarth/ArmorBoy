package
{
  import org.flixel.*;

  public class Coin extends FlxParticle
  {
    [Embed(source="Coin.png")] public var ImgCoin:Class;

    public function Coin()
    {
      super();

      health = 0;
      loadGraphic(ImgCoin, true, false, 8, 8);
      addAnimation("spin", [0, 1, 2, 3], 10, true);
      exists = false;
    }

    override public function update():void
    {
      health += FlxG.elapsed;
      if (y > 240) kill();
      super.update();
    }

    override public function onEmit():void
    {
      health = 0;
      elasticity = 0.8;
      drag = new FlxPoint(4, 0);
      play("spin");
    }
  }
}
