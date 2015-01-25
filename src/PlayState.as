package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    [Embed(source="background.png")]
    public var ImgBackground:Class;
    public var player:Player;
    public var enemySpawn:Spawner;
    public var coinSpawn:Spawner;
    public var platforms:Platforms;
    public var gibs:Gibs;
    public var text:FlxText;

    public function PlayState()
    {
      super();
    }

    override public function create():void
    {
      add(new FlxSprite(0, 0, ImgBackground));

      gibs = new Gibs();
      add(gibs);

      var text:FlxText = new FlxText(0, 0, 80, "Armor Boy");
      add(text);

      player = new Player(100, 100, gibs);
      add(player);

      coinSpawn = new Spawner(1, 10, Coin, null);
      add(coinSpawn);

      enemySpawn = new Spawner(1, 10, Enemy, gibs);
      add(enemySpawn);

      platforms = new Platforms();
      add(platforms);
    }

    override public function update():void
    {
      FlxG.collide(gibs, platforms);
      FlxG.collide(player, platforms);
      FlxG.collide(enemySpawn, platforms);
      FlxG.collide(coinSpawn, platforms);
      FlxG.collide(player, enemySpawn, attacked);
      super.update();
    }

    public function attacked(p:FlxSprite, e:FlxSprite):void
    {
      if (player.frame == 4 || player.frame == 5) {
        FlxG.shake(0.02, 0.25);
        FlxG.flash(0x55ff0000,0.2);
        e.kill();
      } else {
        e.play('attack');
        p.kill();
      }
    }
  }
}
