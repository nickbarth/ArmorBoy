package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    public var player:Player;
    public var enemy:Enemy;
    public var platforms:Platforms;
    public var text:FlxText;

    public function PlayState()
    {
      super();
    }

    override public function create():void
    {
      var text:FlxText = new FlxText(0, 0, 80, "Armor Boy");
      add(text);

      player = new Player(100, 100);
      add(player);

      enemy = new Enemy(200, 100);
      add(enemy);

      platforms = new Platforms();
      add(platforms);
    }

    override public function update():void
    {
      FlxG.collide(player, platforms);
      FlxG.collide(enemy, platforms);
      FlxG.collide(player, enemy);
      super.update();
    }
  }
}
