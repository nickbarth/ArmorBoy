package
{
  import org.flixel.*;

  public class PlayState extends FlxState
  {
    [Embed(source="background.png")]
    public var ImgBackground:Class;
    public var player:Player;
    public var enemySpawn:Spawner;
    public var platforms:Platforms;
    public var gibs:Gibs;
    public var coins:Coins;
    public var text:FlxText;
    public var score:Number;
    public var scoreText:FlxText;
    public var top:Number;
    public var topText:FlxText;

    public function PlayState()
    {
      super();
    }

    override public function create():void
    {
      add(new FlxSprite(0, 0, ImgBackground));

      coins = new Coins();
      add(coins);

      gibs = new Gibs();
      add(gibs);

      var text:FlxText = new FlxText(18, 0, 80, "Armor Boy");
      add(text);

      player = new Player(100, 100, gibs);
      add(player);

      enemySpawn = new Spawner(1, 10, Enemy, gibs, coins);
      add(enemySpawn);

      platforms = new Platforms();
      add(platforms);

      score = 0;
      scoreText = new FlxText(FlxG.width/2-50, 0, 100);
      scoreText.alignment = "center";
      scoreText.text = "0";
      add(scoreText);

      top = FlxG.score ? FlxG.score : 0;
      topText = new FlxText(FlxG.width-50, 0, 50);
      topText.alignment = "center";
      topText.text = top.toString();
      add(topText);
    }

    override public function update():void
    {
      FlxG.collide(coins, platforms);
      FlxG.collide(gibs, platforms);
      FlxG.collide(enemySpawn, platforms);
      FlxG.overlap(player, enemySpawn, attacked);
      FlxG.overlap(player, coins, collected);
      FlxG.collide(player, platforms);
      super.update();
    }

    public function attacked(p:FlxSprite, e:FlxSprite):void
    {
      if (player.frame == 4 || player.frame == 5) {
        FlxG.shake(0.02, 0.25);
        FlxG.flash(0x55ff0000,0.2);
        e.kill();
      } else {
        if (score > top) FlxG.score = score;
        e.play('attack');
        p.kill();
      }
    }

    public function collected(p:FlxSprite, c:FlxSprite):void
    {
      if (c.health > 0.5) {
        FlxG.flash(0x22ffff00, 0.04);
        score += 10;
        scoreText.text = score.toString();
        if (score > top) topText.text = score.toString();
        c.kill();
      }
    }
  }
}
