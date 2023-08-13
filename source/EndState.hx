package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class EndState extends FlxState
{
	private var scoreBE:Int;
	var pState:PlayState;
	var score:FlxText;
	var restart:FlxText;
	var bg:FlxSprite;

	override public function create()
	{
		super.create();
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		add(bg);
		score = new FlxText(0, 250, FlxG.width, "Score: " + Std.string(scoreBE), 42);
		score.setFormat(AssetPaths.Blogger_Sans_Medium__otf, 42, FlxColor.BLACK, FlxTextAlign.CENTER);
		restart = new FlxText(0, 420, FlxG.width, "Press space to restart", 42);
		restart.setFormat(AssetPaths.Blogger_Sans_Medium__otf, 42, FlxColor.BLACK, FlxTextAlign.CENTER);
		add(score);
		add(restart);
		FlxG.mouse.useSystemCursor = true;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new PlayState());
		}
	}

	public function new(score:Int)
	{
		super();
		scoreBE = score;
	}
}
