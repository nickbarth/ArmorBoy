package
{
  import org.flixel.*;

  public class TitleState extends FlxState
  {
    [Embed(source="Fight.mp3")] public var Music:Class;
    [Embed(source="Title.png")] public var ImgTitle:Class;

    public function TitleState()
    {
      super();
    }

    override public function create():void
    {
      FlxG.playMusic(Music);
      add(new FlxSprite(0, 0, ImgTitle));
    }

    override public function update():void
    {
      if (FlxG.keys.SPACE) {
        FlxG.switchState(new PlayState());
      }

      super.update();
    }
  }
}
