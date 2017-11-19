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
import flixel.text.FlxText;

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
	private var levelCleared:FlxText;
	
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
				ola.animation.add("wave", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 2, true);
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
		
		playerOne = new PlayerOne(0, 0, this);
		playerTwo = new PlayerTwo(0, 0, this);
		playerOne.screenCenter();
		playerOne.y = FlxG.camera.height - playerOne.height;
		playerTwo.screenCenter();
		playerTwo.y = 0;
		playerTwo.angle = 180;
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
		collision();
		if (Reg.battleEnd)
		{
			checkEscape();
		}
		if (Reg.pOneWin)
		{
			set_bgColor(0x2200000);
			playerOne.destroy();
			playerOne.getLifeBar().destroy();
			interfaz.destroy();
			levelClearedSetUp();
			Reg.pOneWin = false;
		}
		if (Reg.pTwoWin)
		{
			set_bgColor(0x2200000);
			playerTwo.getLifeBar().destroy();
			interfaz.destroy();
			playerTwo.destroy();
			levelLostSetUp();
			Reg.pTwoWin = false;
		}
	}
	
	private function checkEscape(): Void
	{
		if (FlxG.keys.pressed.ESCAPE)
		{
			Reg.battleEnd = false;
			resetSubState();
			close();
		}
	}
	
	private function collision():Void
	{
		if (!playerOne.getCanShot())
			if(playerOne.getBullet().getImpact())
				if (FlxG.pixelPerfectOverlap(playerOne.getBullet(),playerTwo))
				{
					playerTwo.getDamage();
					playerOne.setCanShot(true);
					playerOne.getBullet().destroy();
					Reg.bulAliveOne = false;
					FlxG.sound.play(AssetPaths.hit__ogg);
				}
		if (!playerTwo.getCanShot())
			if(playerTwo.getBullet().getImpact())
				if (FlxG.pixelPerfectOverlap(playerTwo.getBullet(), playerOne))
				{
					playerOne.getDamage();
					playerTwo.setCanShot(true);
					playerTwo.getBullet().destroy();
					Reg.bulAliveTwo = false;
					FlxG.sound.play(AssetPaths.hit__ogg);
				}
	}
	
	private function levelClearedSetUp():Void 
	{
		levelCleared = new FlxText(0, FlxG.height / 2 - 32, FlxG.width, "Ganaste!!!\nHas perdido: " + (Reg.maxPlayerLife - playerOne.getLife()) + 
		" puntos de vida \nHas ganado 50 esclavos\nHas ganado 75 de oro\n(Persione Escape para Salir)", 48);
		levelCleared.screenCenter();
		levelCleared.color = FlxColor.BLACK;
		levelCleared.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.WHITE, 1, 1);
		levelCleared.alignment = FlxTextAlign.CENTER;
		levelCleared.scrollFactor.set(0, 0);
		add(levelCleared);
	}
	
	private function levelLostSetUp():Void 
	{
		levelCleared = new FlxText(0, FlxG.height / 2 - 32, FlxG.width, "Has Perdido!!!\n Perdiste todos tus recursos, naufragaste y un barco mercante te ha rescatado\nDebes recuperar tu barco y tu oro!!!\n(Persione Escape para Salir)", 48, true);
		levelCleared.screenCenter();
		levelCleared.color = FlxColor.BLACK;
		levelCleared.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.WHITE, 1, 1);
		levelCleared.alignment = FlxTextAlign.CENTER;
		levelCleared.scrollFactor.set(0, 0);
		add(levelCleared);
	}
}