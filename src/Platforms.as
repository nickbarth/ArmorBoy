package
{
  import org.flixel.*;

  public class Platforms extends FlxGroup
  {
    [Embed(source="ground.png")]
    public var ImgGround:Class;

    public function Platforms()
    {
      super();

      var groundMid:FlxTileblock = new FlxTileblock(64, 192, 192, 16);
      groundMid.loadTiles(ImgGround, 16, 16, 0);
      add(groundMid);

      var groundLeft:FlxTileblock = new FlxTileblock(16, 144, 64, 16);
      groundLeft.loadTiles(ImgGround, 16, 16, 0);
      add(groundLeft);

      var groundRight:FlxTileblock = new FlxTileblock(240, 144, 64, 16);
      groundRight.loadTiles(ImgGround, 16, 16, 0);
      add(groundRight);
    }
  }
}
