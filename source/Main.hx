package;

import flixel.FlxGame;
import openfl.display.Sprite;
import source.states.MenuState;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(1920, 1080, MenuState));
	}
}