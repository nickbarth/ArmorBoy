package
{
  import org.flixel.*;

  public class Player extends FlxSprite
  {
    [Embed(source="AmorBoyWithFire.png")]
    public var ImgPlayer:Class;
    public var jumpMax:Number = 0;
    public var attackMax:Number = 0;
    public var emitter:FlxEmitter;

    public function Player(x:Number, y:Number, gibs:FlxEmitter)
    {
      super(x, y);

      loadGraphic(ImgPlayer, true, true, 16, 16, true);
      addAnimation("walk", [0, 1, 2, 3], 10, true);
      addAnimation("attack", [4, 5], 10, false);
      addAnimation("jump", [8, 9], 10, false);
      addAnimation("fall", [9], 10, false);

      maxVelocity.x = 100;
      maxVelocity.y = 100;
      acceleration.y = 1200;
      emitter = gibs;
      jumpMax = 1;

      play("walk");
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

      if (FlxG.keys.UP && jumpMax == 0) {
        jumpMax = 1;
        maxVelocity.y = 2000;
        maxVelocity.x = 50;
        acceleration.y = -2000;
        play("jump");
      }

      if (attackMax != 0)
        attackMax += FlxG.elapsed;

      if (attackMax > 1.5)
        attackMax = 0;

      if (FlxG.keys.SPACE && attackMax == 0) {
        velocity.x = 200;
        maxVelocity.x = 900;
        maxVelocity.y = 900;
        acceleration.y = 2000;
        acceleration.x = 2000;
        attackMax = 1;

        if (facing == FlxObject.LEFT) {
          acceleration.x = acceleration.x * -1;
          velocity.x = velocity.x * -1;
        }

        play("attack");
      }

      if (finished && acceleration.y > 0) {
        maxVelocity.x = 100;
        play("walk");
      }

      if (finished && acceleration.y < 0) {
        jumpMax = 1;
        acceleration.y = 1200;
        play("fall");
      }

      if (isTouching(FlxObject.DOWN)) {
        if (acceleration.x == 0)
          acceleration.x = 500;

        jumpMax = 0;
      }

      if (y > 220) kill();
      super.update();
    }

    override public function kill():void {
      emitter.at(this);
      emitter.start(true, 3, 0, 20);
      FlxG.shake();
      FlxG.flash(0xffffffff, 1.5, FlxG.resetState);
      super.kill();
    }
  }
}
