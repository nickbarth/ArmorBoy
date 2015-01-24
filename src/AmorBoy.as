package {
  import org.flixel.*;

  [SWF(width="640", height="480", backgroundColor="#000000")]
  public class AmorBoy extends FlxGame
  {
    public function AmorBoy()
    {
      FlxG.debug=true;
      super(320, 240, PlayState, 2);
    }
  }
}
