package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    [Embed(source="AmorBoy.png")]
    public var ImgPlayer:Class;

    [Embed(source="ground.png")]
    public var ImgGround:Class;

    public var player:FlxSprite;
    public var platforms:FlxGroup = new FlxGroup();
    public var text:FlxText = new FlxText(0, 0, 80, "");

    public function PlayState()
    {
      super();
    }

    override public function create():void
    {
      player = new FlxSprite(100, 100);
      player.loadGraphic(ImgPlayer, true, true, 16, 16, true);
      player.addAnimation("walk", [0, 1, 2, 3], 10, true);
      player.addAnimation("attack", [4, 5], 10, false);
      player.play("walk");
      player.maxVelocity.x = 100;
      player.maxVelocity.y = 100;
      player.acceleration.y = 1200;
      add(player);

      var text:FlxText = new FlxText(0, 0, 80, "Armor Boy");
      add(text);

      var groundMid:FlxTileblock = new FlxTileblock(64, 192, 192, 16);
      groundMid.loadTiles(ImgGround, 16, 16, 0);
      platforms.add(groundMid);

      var groundLeft:FlxTileblock = new FlxTileblock(16, 144, 64, 16);
      groundLeft.loadTiles(ImgGround, 16, 16, 0);
      platforms.add(groundLeft);

      var groundRight:FlxTileblock = new FlxTileblock(240, 144, 64, 16);
      groundRight.loadTiles(ImgGround, 16, 16, 0);
      platforms.add(groundRight);

      add(platforms);
    }

    override public function update():void
    {
      if (FlxG.keys.LEFT) {
        player.acceleration.x = -500;
        player.facing = FlxObject.LEFT;
      }

      if (FlxG.keys.RIGHT) {
        player.acceleration.x = 500;
        player.facing = FlxObject.RIGHT;
      }

      if (FlxG.keys.UP) {
        player.acceleration.y = 500;
        player.facing = FlxObject.RIGHT;
      }

      if (FlxG.keys.SPACE) {
        player.maxVelocity.x = 0;
        player.maxVelocity.x = 0;
        player.play("attack");
      }

      if (player.finished) {
        player.maxVelocity.x = 100;
        player.play("walk");
      }

      FlxG.collide(player, platforms);

      super.update();
    }
  }
}
