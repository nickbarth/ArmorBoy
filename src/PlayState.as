package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    [Embed(source="ground.png")]
    public var ImgGround:Class;

    public var player:Player;
    public var platforms:FlxGroup = new FlxGroup();
    public var text:FlxText = new FlxText(0, 0, 80, "");

    public function PlayState()
    {
      super();
    }

    override public function create():void
    {
      player = new Player(100, 100);
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
      FlxG.collide(player, platforms);
      super.update();
    }
  }
}
