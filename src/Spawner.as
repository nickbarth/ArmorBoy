package
{
  import org.flixel.*;

  public class Spawner extends FlxGroup
  {
    private var _delay:Number;
    public var _timer:Number;
    public var _type:Class;

    public function Spawner(delay:Number, count:Number, type:Class, gibs:FlxEmitter)
    {
      super();

      _delay = delay;
      _type = type;
      _timer = 0;

      for (var n:Number = 0; n < count; n++)
        if (gibs == null) add(new _type(-1000, 0));
        else add(new _type(-1000, 0, gibs));

      callAll('kill');
    }

    override public function update():void
    {
      _timer += FlxG.elapsed;

      if (_timer > _delay) {
        _timer = 0;
        var spawn:FlxSprite = getFirstAvailable() as FlxSprite;
        if (spawn != null) spawn.reset(0, 0);
      }

      super.update();
    }
  }
}
