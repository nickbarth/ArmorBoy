package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    public var player:Player;
    public var spawn:EnemySpawner;
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

      spawn = new EnemySpawner();
      add(spawn);

      platforms = new Platforms();
      add(platforms);
    }

    override public function update():void
    {
      FlxG.collide(player, platforms);
      FlxG.collide(spawn, platforms);
      FlxG.collide(player, spawn, attacked);
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
        FlxG.shake();
        FlxG.flash(0xffffffff,1.5,FlxG.resetState);
      }
    }
  }
}
