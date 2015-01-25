package
{
  import org.flixel.*;

  public class Spawner extends FlxGroup
  {
    private var _delay:Number;
    private var _doubleTimer:Number;
    public var _timer:Number;
    public var _type:Class;

    public function Spawner(delay:Number, count:Number, type:Class, gibs:FlxEmitter, coins:FlxEmitter)
    {
      super();

      _delay = delay;
      _type = type;
      _timer = 0;
      _doubleTimer = 0;

      for (var n:Number = 0; n < count; n++)
        if (gibs == null) add(new _type(-1000, 0));
        else add(new _type(-1000, 0, gibs, coins));

      callAll('kill');
    }

    override public function update():void
    {
      _timer += FlxG.elapsed;

      if (_timer > _delay) {
        _timer = 0;
        _doubleTimer += 1;
        var spawn:FlxSprite = getFirstAvailable() as FlxSprite;
        if (spawn != null) spawn.reset(0, 0);
      }

      if (_doubleTimer == 20) {
        _doubleTimer = 0;
        _delay = _delay / 2;
      }

      super.update();
    }
  }
}
