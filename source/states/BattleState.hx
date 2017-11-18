package states;

import flixel.FlxSprite;
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
	private var oceano:Array<Array<FlxSprite>>;
	private var interfaz:Interfaz;
	
	public function new(BGColor:FlxColor=FlxColor.BLUE) 
	{
		super(BGColor);
		oceano = new Array<Array<FlxSprite>>();
		for (i in 0 ... (Std.int(FlxG.camera.width/128)) +1) 
		{
			var linea = new Array<FlxSprite>();
			for (j in 0 ... (Std.int(FlxG.camera.height/128)) +1 ) 
			{
				var ola = new FlxSprite();
				ola.loadGraphic(AssetPaths.tileOceano__png,true,32,32);
				ola.animation.add("wave", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 8, true);
				ola.animation.play("wave");
				ola.scale.set(4,4);
				ola.x = i*128;
				ola.y = j*128;
				linea.push(ola);
			}
			oceano.push(linea);
		}
		for (k in 0 ... (Std.int(FlxG.camera.width/128)) +1) 
		{
			for (l in 0 ... (Std.int(FlxG.camera.height/128)) +1) 
			{
				add(oceano[k][l]);
			}
		}
		
		playerOne = new PlayerOne(500, 500, this);
		playerTwo = new PlayerTwo(700, 700, this);
		add(playerOne);
		add(playerTwo);
		Reg.playerOne = playerOne;
		Reg.playerTwo = playerTwo;
		interfaz = new Interfaz(playerOne, this);
		add(interfaz);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (!playerOne.getCanShot())
			if(playerOne.getBullet().getImpact())
				FlxG.overlap(playerOne.getBullet(), playerTwo, colPTwoBullet);
		if (!playerTwo.getCanShot())
			if(playerTwo.getBullet().getImpact())
				FlxG.overlap(playerTwo.getBullet(), playerOne, colPOneBullet);
	}
	
	public function colPOneBullet(B:BulletTwo, p:PlayerOne):Void
	{
		p.getDamage();
		playerTwo.setCanShot(true);
		B.kill();
	}
	
	public function colPTwoBullet(B:BulletOne, p:PlayerTwo):Void
	{
		p.getDamage();
		playerOne.setCanShot(true);
		B.kill();
	}
	
}