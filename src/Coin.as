package
{
  import org.flixel.*;

  public class Coin extends FlxSprite
  {
    [Embed(source="Coin.png")]
    public var ImgCoin:Class;

    public function Coin(x:Number, y:Number)
    {
      super(x, y);

      loadGraphic(ImgCoin, true, true, 8, 8, true);
      addAnimation("spin", [0, 1, 2, 3], 10, true);

      maxVelocity.x = 100;
      maxVelocity.y = 100;
      acceleration.y = 1200;
      acceleration.x = 0;
    }

    override public function reset(x:Number, y:Number):void
    {
      super.reset(FlxG.random() * FlxG.width, -32);
      acceleration.x = 0;

      if (FlxG.random() * 1 >= 0.5) facing = FlxObject.RIGHT;
      else facing = FlxObject.LEFT;

      play("spin");
    }

    override public function update():void
    {
      if (y > 220) kill();
      super.update();
    }
  }
}
