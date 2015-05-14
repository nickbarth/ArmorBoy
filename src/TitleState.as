package
{
  import org.flixel.*;

  public class TitleState extends FlxState
  {
    [Embed(source="Fight.mp3")] public var Music:Class;
    [Embed(source="Title.png")] public var ImgTitle:Class;
    public var muteText:FlxText;

    public function TitleState()
    {
      super();
    }

    override public function create():void
    {
      FlxG.playMusic(Music);
      add(new FlxSprite(0, 0, ImgTitle));

      muteText = new FlxText(0, FlxG.height - 16, FlxG.width, "(m)ute");
      muteText.setFormat(null, 8, 0xffffff, "right", 0);
      add(muteText);

      if (FlxG.mute) muteText.text = "un(m)ute";
      else muteText.text = "(m)ute";
    }

    override public function update():void
    {
      if (FlxG.keys.SPACE) {
        FlxG.switchState(new PlayState());
      }

      if (FlxG.keys.justPressed("M")) {
        FlxG.mute = !FlxG.mute;
        if (FlxG.mute) muteText.text = "un(m)ute";
        else muteText.text = "(m)ute";
      }

      super.update();
    }
  }
}
