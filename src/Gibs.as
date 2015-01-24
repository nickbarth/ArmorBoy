package
{
  import org.flixel.*;

  public class Gibs extends FlxEmitter
  {
    [Embed(source="Gibs.png")]
    public var ImgGibs:Class;

    public function Gibs()
    {
      super();

      setXSpeed(-150, 150);
      setYSpeed(-200, 0);
      setRotation(-720, -720);
      gravity = 350;
      bounce = 0.5;
      makeParticles(ImgGibs, 100, 10, true, 0.5);
    }
  }
}
