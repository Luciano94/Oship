package source.states;

import entities.player.Player;
import entities.player.PlayerOne;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var playerOne:Player;
	private var playerTwo:Player;
	override public function create():Void
	{
		super.create();
		playerOne = new PlayerOne(100, 100);
		add(playerOne);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}