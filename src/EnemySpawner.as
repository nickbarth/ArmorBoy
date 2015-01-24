package
{
  import org.flixel.*;

  public class EnemySpawner extends FlxGroup
  {
    public const DELAY:Number = 1;
    public const COUNT:Number = 10;
    public var timer:Number = 0;

    public function EnemySpawner(gibs:FlxEmitter)
    {
      super();

      for (var i:int = 0; i < COUNT; i++) 
        add(new Enemy(-1000, 0, gibs));
      callAll('kill');
    }

    override public function update():void
    {
      timer += FlxG.elapsed;

      if (timer > DELAY) {
        timer = 0;
        var enemy:Enemy = getFirstAvailable(Enemy) as Enemy;
        if (enemy != null) enemy.spawn();
      }

      super.update();
    }
  }
}
