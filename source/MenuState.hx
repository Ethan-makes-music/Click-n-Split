package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var startText:FlxText = new FlxText(0, 300, FlxG.width, "Start", 42);
	var name:FlxText = new FlxText(0, 150, FlxG.width, "Click & Split", 42);
	var bg:FlxSprite = new FlxSprite(0, 0);
	var amplitude:Float = 10;
	var frequency:Float = 5;
	var dir:String = "up";

	override public function create()
	{
		super.create();

		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		add(bg);
		FlxG.mouse.useSystemCursor = true;
		startText.alignment = FlxTextAlign.CENTER;
		startText.setFormat(AssetPaths.Blogger_Sans_Medium__otf, 42, FlxColor.BLACK);
		name.alignment = FlxTextAlign.CENTER;
		name.setFormat(AssetPaths.Blogger_Sans_Medium__otf, 42, FlxColor.BLACK);
		add(startText);
		add(name);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (name.y >= 150)
		{
			dir = "up";
		}
		else if (name.y <= 50)
		{
			dir = "down";
		}

		if (dir == "up")
		{
			name.y -= 3;
		}
		else if (dir == "down")
		{
			name.y += 3;
		}
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new PlayState());
		}
	}
}
