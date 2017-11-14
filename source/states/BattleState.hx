package states;

import flixel.FlxSubState;
import flixel.util.FlxColor;
import entities.animaciones.SpriteMoneda;
import entities.player.BulletOne;
import entities.player.BulletTwo;
import entities.player.PlayerOne;
import entities.player.PlayerTwo;
import flixel.FlxG;

/**
 * ...
 * @author Amaka
 */
class BattleState extends FlxSubState 
{

	private var playerOne:PlayerOne;
	private var playerTwo:PlayerTwo;
	private var bulletOne: BulletOne;
	private var bulletTwo: BulletTwo;
	private var moneda:SpriteMoneda;
	
	public function new(BGColor:FlxColor=FlxColor.BLUE) 
	{
		super(BGColor);
		playerOne = new PlayerOne(500, 500, this);
		playerTwo = new PlayerTwo(700, 700, this);
		add(playerOne);
		add(playerTwo);
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
		p.getDamage();
		B.kill();
	}
	
	public function colPTwoBullet(B:BulletOne, p:PlayerTwo):Void
	{
		p.getDamage();
		B.kill();
	}
	
}