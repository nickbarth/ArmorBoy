package
{
  import org.flixel.*;

  public class Player extends FlxSprite
  {
    [Embed(source="AmorBoy.png")]
    public var ImgPlayer:Class;
    public var jumpMax:Number = 0;

    public function Player(x:Number, y:Number)
    {
      super(x, y);
      loadGraphic(ImgPlayer, true, true, 16, 16, true);
      addAnimation("walk", [0, 1, 2, 3], 10, true);
      addAnimation("attack", [4, 5], 10, false);
      addAnimation("jump", [8, 9], 10, false);
      addAnimation("fall", [9], 10, false);
      play("walk");
      maxVelocity.x = 100;
      maxVelocity.y = 100;
      acceleration.y = 1200;
    }

    override public function update():void
    {
      if (FlxG.keys.LEFT) {
        acceleration.x = -500;
        facing = FlxObject.LEFT;
      }

      if (FlxG.keys.RIGHT) {
        acceleration.x = 500;
        facing = FlxObject.RIGHT;
      }

      if (FlxG.keys.UP && jumpMax < 0.50) {
        jumpMax += FlxG.elapsed;
        acceleration.y = -500;
        play("jump");
      }

      if (FlxG.keys.SPACE) {
        maxVelocity.x = 0;
        play("attack");
      }

      if (finished && acceleration.y > 0) {
        maxVelocity.x = 100;
        play("walk");
      }

      if (finished && acceleration.y < 0) {
        acceleration.y = 1200;
        play("fall");
      }

      if (isTouching(FlxObject.DOWN)) {
        jumpMax = 0;
      }

      super.update();
    }
  }
}
