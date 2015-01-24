package
{
  import org.flixel.*;

  public class Enemy extends FlxSprite
  {
    [Embed(source="OrgeBoy.png")]
    public var ImgEnemy:Class;

    public function Enemy(x:Number, y:Number)
    {
      super(x, y);
      loadGraphic(ImgEnemy, true, true, 16, 16, true);
      addAnimation("walk", [0, 1, 2, 3], 10, true);
      addAnimation("attack", [4, 5], 10, false);
      addAnimation("jump", [8, 9], 10, false);
      addAnimation("fall", [9], 10, false);

      maxVelocity.x = 100;
      maxVelocity.y = 100;
      acceleration.y = 1200;
    }

    public function spawn():void
    {
      super.reset(FlxG.random() * FlxG.width, -32);
      play("walk");
    }

    override public function update():void
    {
      super.update();
    }
  }
}
