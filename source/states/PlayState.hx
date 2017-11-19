package source.states;

import entities.animaciones.SpriteMoneda;
import entities.player.BulletOne;
import entities.player.BulletTwo;
import entities.player.PlayerOne;
import entities.player.PlayerTwo;
import flixel.FlxState;
import flixel.FlxG;
import Interfaz;

class PlayState extends FlxState
{
	private var playerOne:PlayerOne;
	private var playerTwo:PlayerTwo;
	private var bulletOne: BulletOne;
	private var bulletTwo: BulletTwo;
	private var moneda:SpriteMoneda;
	private var interfaz:Interfaz;
	override public function create():Void
	{
		super.create();
		playerOne = new PlayerOne(0, 0, this);
		playerOne.screenCenter();
		playerOne.y = FlxG.camera.height - playerOne.height;
		
		playerTwo = new PlayerTwo(0, 0, this);
		playerTwo.screenCenter();
		playerTwo.y = 0;
		
		add(playerOne);
		add(playerTwo);
		
		interfaz = new Interfaz(playerOne, this);
		add(interfaz);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(!playerOne.getCanShot())
			FlxG.overlap(playerOne.getBullet(), playerTwo, colPTwoBullet);
		if(!playerTwo.getCanShot())
			FlxG.overlap(playerTwo.getBullet(), playerOne, colPOneBullet);
	}
	
	public function colPOneBullet(B:BulletTwo, p:PlayerOne):Void
	{
		p.destroy();
		B.destroy();
	}
	
	public function colPTwoBullet(B:BulletOne, p:PlayerTwo):Void
	{
		p.destroy();
		B.destroy();
	}
}