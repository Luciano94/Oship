package source.states;

import entities.animaciones.SpriteMoneda;
import entities.player.Player;
import entities.player.PlayerOne;
import entities.player.PlayerTwo;
import flixel.FlxState;

class PlayState extends FlxState
{
	private var playerOne:Player;
	private var playerTwo:Player;
	private var moneda:SpriteMoneda;
	override public function create():Void
	{
		super.create();
		playerOne = new PlayerOne(100, 100);
		add(playerOne);
		
		//para testear weas animadas
		//moneda = new SpriteMoneda();
		//moneda.screenCenter();
		//add(moneda);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}