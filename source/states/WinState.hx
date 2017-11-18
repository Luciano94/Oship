package states;

import flixel.FlxSubState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class WinState extends FlxSubState 
{
	
	private var levelCleared:FlxText;

	public function new(BGColor:FlxColor=0x2200000) 
	{
		super(BGColor);
		levelClearedSetUp();
	}
	
	private function levelClearedSetUp():Void 
	{
		levelCleared = new FlxText(0, FlxG.height / 2 - 32, FlxG.width, "Level Cleared", 14, true);
		levelCleared.color = FlxColor.GREEN;
		levelCleared.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.WHITE, 1, 1);
		levelCleared.alignment = FlxTextAlign.CENTER;
		levelCleared.scrollFactor.set(0, 0);
		add(levelCleared);
	}
}