// I put basically the entire game in Playstate cuz I'm too lazy to make other files lmaoo
package;

import Random;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Timer;

class PlayState extends FlxState
{
	var plr:FlxSprite;
	var bg:FlxSprite;
	var paper:FlxSprite = new FlxSprite(-55, 0, AssetPaths.bock__png);
	var cursorX:Float = FlxG.mouse.x;
	var cursorY:Float = FlxG.mouse.y;
	var leftToClick:Int;
	var swagRandom:Int;
	var shiit:Bool = false;

	public var scoreBE:Int;

	var speed:Int = 12;

	var scoreFE:FlxText;

	var timerBE:Int;
	var timerFR:FlxText;

	var cutSound:FlxSound;
	var nextSound:FlxSound;

	// bock cuts
	// bock cut 1
	var bock11:FlxSprite = new FlxSprite(0, 0, AssetPaths.bock11__png);
	var bock12:FlxSprite = new FlxSprite(0, 0, AssetPaths.bock12__png);
	// bock cut 2
	var bock21:FlxSprite = new FlxSprite(0, 0, AssetPaths.bock21__png);
	var bock22:FlxSprite = new FlxSprite(0, 0, AssetPaths.bock22__png);
	// bock cut 3
	var bock31:FlxSprite = new FlxSprite(-55, 0, AssetPaths.bock31__png);
	var bock32:FlxSprite = new FlxSprite(-55, 0, AssetPaths.bock32__png);
	// bock cut 4
	var bock41:FlxSprite = new FlxSprite(-55, 0, AssetPaths.bock41__png);
	var bock42:FlxSprite = new FlxSprite(-55, 0, AssetPaths.bock42__png);

	// Cuts (Jesus)
	var cutShapes:FlxSprite = new FlxSprite(0, 0, AssetPaths.cut__png);
	var cutShapes2:FlxSprite = new FlxSprite(0, 0, AssetPaths.cut__png);
	var cutShapes3:FlxSprite = new FlxSprite(0, 0, AssetPaths.cut__png);
	var cutShapes4:FlxSprite = new FlxSprite(0, 0, AssetPaths.cut__png);
	var cutShapes5:FlxSprite = new FlxSprite(0, 0, AssetPaths.cut__png);
	var cutShapes6:FlxSprite = new FlxSprite(0, 0, AssetPaths.cut__png);
	var cutShapes7:FlxSprite = new FlxSprite(0, 0, AssetPaths.cut__png);
	var cutShapes8:FlxSprite = new FlxSprite(0, 0, AssetPaths.cut__png);
	var cutShapes9:FlxSprite = new FlxSprite(0, 0, AssetPaths.cut__png);

	override public function create()
	{
		super.create();
		FlxG.sound.playMusic(AssetPaths.music__ogg, 1, true);

		cutSound = FlxG.sound.load(AssetPaths.cutting__ogg);
		nextSound = FlxG.sound.load(AssetPaths.next__ogg);

		scoreBE = 0;
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		add(bg);
		plr = new FlxSprite(cursorX, cursorY);
		plr.loadGraphic(AssetPaths.player__png);
		plr.angle = -45;
		add(paper);
		plr.origin.x = plr.width / 2;
		plr.origin.y = plr.height / 2;
		add(plr);
		FlxG.mouse.useSystemCursor = true;
		scoreFE = new FlxText(0, 0, FlxG.width, "Score: " + Std.string(scoreBE), 42);
		scoreFE.setFormat(AssetPaths.Blogger_Sans_Medium__otf, 42, FlxColor.BLACK, FlxTextAlign.LEFT);
		timerBE = 3000;
		timerFR = new FlxText(0, 0, FlxG.width, "Time Left: " + Std.string(timerBE), 42);
		timerFR.setFormat(AssetPaths.Blogger_Sans_Medium__otf, 42, FlxColor.BLACK, FlxTextAlign.CENTER);
		add(scoreFE);
		add(timerFR);
		diffShapes();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.mouse.useSystemCursor = true;
		plr.x = FlxG.mouse.x - plr.width / 2;
		plr.y = FlxG.mouse.y - plr.height / 2;
		timerBE -= 1;
		scoreFE.text = "Score: " + Std.string(scoreBE);
		timerFR.text = "Time Left: " + Std.string(timerBE);
		clickShape();

		if (swagRandom == 1 && leftToClick <= 0)
		{
			remove(paper);
			add(bock11);
			add(bock12);
			bock11.x += speed;
			bock12.x -= speed;
			wait(1000, function()
			{
				shiit = true;
				wait(100, function()
				{
					shiit = false;
					remove(bock11);
					remove(bock12);
					bock11.x = 0;
					bock12.x = 0;
				});
			});
			if (shiit == true)
			{
				remove(plr);
				shiz();
				add(plr);
			}
		}
		else if (swagRandom == 2 && leftToClick <= 0)
		{
			remove(paper);
			add(bock21);
			add(bock22);
			bock21.x -= speed;
			bock22.x += speed;
			wait(1000, function()
			{
				shiit = true;
				wait(100, function()
				{
					shiit = false;
					remove(bock21);
					remove(bock22);
					bock21.x = 0;
					bock22.x = 0;
				});
			});
			if (shiit == true)
			{
				remove(plr);
				shiz();
				add(plr);
			}
		}
		else if (swagRandom == 3 && leftToClick <= 0)
		{
			remove(paper);
			add(bock31);
			add(bock32);
			bock31.y -= speed;
			bock32.y += speed;
			wait(1000, function()
			{
				shiit = true;
				wait(100, function()
				{
					shiit = false;
					remove(bock31);
					remove(bock32);
					bock31.y = 0;
					bock32.y = 0;
				});
			});
			if (shiit == true)
			{
				remove(plr);
				shiz();
				add(plr);
			}
		}
		else if (swagRandom == 4 && leftToClick <= 0)
		{
			remove(paper);
			add(bock41);
			add(bock42);
			bock41.y -= speed;
			bock42.y += speed;
			wait(1000, function()
			{
				shiit = true;
				wait(100, function()
				{
					shiit = false;
					remove(bock41);
					remove(bock42);
					bock41.y = 0;
					bock42.y = 0;
				});
			});
			if (shiit == true)
			{
				remove(plr);
				shiz();
				add(plr);
			}
		}

		if (timerBE <= 0)
		{
			FlxG.switchState(new EndState(scoreBE));
		}

		// Shapes for cuts
		// Average Gamejam code:
	}

	public function diffShapes()
	{
		swagRandom = Random.int(1, 4);
		cutShapes.solid = false;
		cutShapes2.solid = false;
		cutShapes3.solid = false;
		cutShapes4.solid = false;
		cutShapes5.solid = false;
		cutShapes6.solid = false;
		switch swagRandom
		{
			case 1:
				leftToClick = 5;
				// cut shape 1
				cutShapes.x = 34;
				cutShapes.y = 94;
				cutShapes.angle = -57;
				add(cutShapes);

				// cut shape 2
				cutShapes2.x = 250;
				cutShapes2.y = 220;
				cutShapes2.angle = -57;
				add(cutShapes2);

				// cut shape 3
				cutShapes3.x = 500;
				cutShapes3.y = 320;
				cutShapes3.angle = -57;
				add(cutShapes3);

				// cut shape 4
				cutShapes4.x = 750;
				cutShapes4.y = 420;
				cutShapes4.angle = -57;
				add(cutShapes4);

				// cut shape 5
				cutShapes5.x = 1000;
				cutShapes5.y = 520;
				cutShapes5.angle = -57;
				add(cutShapes5);
			case 2:
				leftToClick = 5;
				// cut shape 1
				cutShapes.x = 1000;
				cutShapes.y = 94;
				cutShapes.angle = 57;
				add(cutShapes);

				// cut shape 2
				cutShapes2.x = 740;
				cutShapes2.y = 220;
				cutShapes2.angle = 57;
				add(cutShapes2);

				// cut shape 3
				cutShapes3.x = 500;
				cutShapes3.y = 320;
				cutShapes3.angle = 57;
				add(cutShapes3);

				// cut shape 4
				cutShapes4.x = 250;
				cutShapes4.y = 420;
				cutShapes4.angle = 57;
				add(cutShapes4);

				// cut shape 5
				cutShapes5.x = 34;
				cutShapes5.y = 520;
				cutShapes5.angle = 57;
				add(cutShapes5);
			case 3:
				leftToClick = 6;
				// cut shape 1
				cutShapes.x = 460;
				cutShapes.y = 94;
				cutShapes.angle = 0;
				add(cutShapes);

				// cut shape 2
				cutShapes2.x = 460;
				cutShapes2.y = 178;
				cutShapes2.angle = 0;
				add(cutShapes2);

				// cut shape 3
				cutShapes3.x = 460;
				cutShapes3.y = 262;
				cutShapes3.angle = 0;
				add(cutShapes3);

				// cut shape 4
				cutShapes4.x = 460;
				cutShapes4.y = 346;
				cutShapes4.angle = 0;
				add(cutShapes4);

				// cut shape 5
				cutShapes5.x = 460;
				cutShapes5.y = 430;
				cutShapes5.angle = 0;
				add(cutShapes5);

				// cut shape 6
				cutShapes6.x = 460;
				cutShapes6.y = 514;
				cutShapes6.angle = 0;
				add(cutShapes6);
			case 4:
				leftToClick = 9;
				// cut shape 1
				cutShapes.x = 34;
				cutShapes.y = 300;
				cutShapes.angle = 90;
				add(cutShapes);

				// cut shape 2
				cutShapes2.x = 162;
				cutShapes2.y = 300;
				cutShapes2.angle = 90;
				add(cutShapes2);

				// cut shape 3
				cutShapes3.x = 290;
				cutShapes3.y = 300;
				cutShapes3.angle = 90;
				add(cutShapes3);

				// cut shape 4
				cutShapes4.x = 418;
				cutShapes4.y = 300;
				cutShapes4.angle = 90;
				add(cutShapes4);

				// cut shape 5
				cutShapes5.x = 546;
				cutShapes5.y = 300;
				cutShapes5.angle = 90;
				add(cutShapes5);

				// cut shape 6
				cutShapes6.x = 674;
				cutShapes6.y = 300;
				cutShapes6.angle = 90;
				add(cutShapes6);

				// cut shape 7
				cutShapes7.x = 802;
				cutShapes7.y = 300;
				cutShapes7.angle = 90;
				add(cutShapes7);

				// cut shape 8
				cutShapes8.x = 930;
				cutShapes8.y = 300;
				cutShapes8.angle = 90;
				add(cutShapes8);

				// cut shape 9
				cutShapes9.x = 1058;
				cutShapes9.y = 300;
				cutShapes9.angle = 90;
				add(cutShapes9);
		}
	}

	public function clickShape()
	{
		if (plr.overlaps(cutShapes) && FlxG.mouse.justPressed)
		{
			remove(cutShapes);
			scoreBE += 1;
			cutSound.play();
			leftToClick -= 1;
		}
		else if (plr.overlaps(cutShapes2) && FlxG.mouse.justPressed)
		{
			remove(cutShapes2);
			scoreBE += 1;
			cutSound.play();
			leftToClick -= 1;
		}
		else if (plr.overlaps(cutShapes3) && FlxG.mouse.justPressed)
		{
			remove(cutShapes3);
			scoreBE += 1;
			cutSound.play();
			leftToClick -= 1;
		}
		else if (plr.overlaps(cutShapes4) && FlxG.mouse.justPressed)
		{
			remove(cutShapes4);
			scoreBE += 1;
			cutSound.play();
			leftToClick -= 1;
		}
		else if (plr.overlaps(cutShapes5) && FlxG.mouse.justPressed)
		{
			remove(cutShapes5);
			scoreBE += 1;
			cutSound.play();
			leftToClick -= 1;
		}
		else if (plr.overlaps(cutShapes6) && FlxG.mouse.justPressed)
		{
			remove(cutShapes6);
			scoreBE += 1;
			cutSound.play();
			leftToClick -= 1;
		}
		else if (plr.overlaps(cutShapes7) && FlxG.mouse.justPressed)
		{
			remove(cutShapes7);
			scoreBE += 1;
			cutSound.play();
			leftToClick -= 1;
		}
		else if (plr.overlaps(cutShapes8) && FlxG.mouse.justPressed)
		{
			remove(cutShapes8);
			scoreBE += 1;
			cutSound.play();
			leftToClick -= 1;
		}
		else if (plr.overlaps(cutShapes9) && FlxG.mouse.justPressed)
		{
			remove(cutShapes9);
			scoreBE += 1;
			cutSound.play();
			leftToClick -= 1;
		}
		if (scoreBE < 0)
		{
			scoreBE = 0;
		}
	}

	public function shiz()
	{
		add(paper);
		remove(cutShapes);
		remove(cutShapes2);
		remove(cutShapes3);
		remove(cutShapes4);
		remove(cutShapes5);
		remove(cutShapes6);
		remove(cutShapes7);
		remove(cutShapes8);
		remove(cutShapes9);
		nextSound.play();
		diffShapes();
	}

	function wait(milliseconds:Int, callback:Void->Void):Void
	{
		Timer.delay(callback, milliseconds);
	}
}
