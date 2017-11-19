package states;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;
import source.states.MenuState;
import flixel.FlxG;

/**
 * ...
 * @author tu mami
 */
class MapState extends FlxState 
{
	private var fondo:FlxSprite;
	private var exitButton:FlxButton;
	private var sePuede:Bool;
	private var clickX:Float;
	private var clickY:Float;
	private var barquito:FlxSprite;
	private var tiempoText:FlxText;
	private var horas:Int;
	private var minutos:Int;
	private var segundos:Int;
	private var contador:Float;
	private var contar:Bool;
	private var distX:Float;
	private var distY:Float;
	private var cruz:FlxSprite;
	private var siBtn:FlxButton;
	private var noBtn:FlxButton;
	private var adTxt:FlxText;
	private var adBool:Bool;
	public function new() 
	{
		super();
		sePuede = true;
		clickX = 0;
		clickY = 0;
		contador = 0;
		horas = 1;
		minutos = 0;
		segundos = 20;
		adBool = true;
		
		contar = false;
		tiempoText = new FlxText(0, 0, 0, "", 20);
		tiempoText.visible = false;
		fondo = new FlxSprite();
		fondo.loadGraphic(AssetPaths.islas__png);
		add(fondo);
		
		//FlxG.sound.playMusic();
		
		exitButton = new FlxButton("", salir);
		exitButton.loadGraphic(AssetPaths.salir__png);
		exitButton.updateHitbox();
		exitButton.x = camera.width - exitButton.width - 50;
		exitButton.y = camera.height - exitButton.height - 50;
		add(exitButton);
		
		barquito = new FlxSprite(568, 873);
		barquito.loadGraphic(AssetPaths.Player_One__png);
		barquito.scale.set(0.1, 0.1);
		barquito.updateHitbox();
		barquito.x += barquito.width;
		barquito.y -= barquito.height;
		add(barquito);
		
		cruz = new FlxSprite();
		cruz.loadGraphic(AssetPaths.cruz__png);
		cruz.visible = false;
		add(cruz);
		
		add(tiempoText);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (!FlxG.mouse.overlaps(exitButton) && FlxG.mouse.justPressed) 
		{
			cartelito();
		}
		contando(elapsed);
		if (horas <= 0 && minutos <= 30 && adBool) 
		{
			adBool = false;
			adTxt = new FlxText(0, 0, 700, "¿Ver una publicidad para llegar ahora?", 50);
			add(adTxt);
			
			siBtn = new FlxButton(adTxt.x, adTxt.y + adTxt.height, "", verAd);
			siBtn.loadGraphic(AssetPaths.si__png);
			add(siBtn);
			
			noBtn = new FlxButton(siBtn.x + adTxt.width, siBtn.y, "", cerrarAd);
			noBtn.x -= noBtn.width;
			noBtn.loadGraphic(AssetPaths.no__png);
			add(noBtn);
		}
		if (horas <= 0 && minutos <= 0 && segundos <=0) 
		{
			contar = false;
			horas = 1;
			tiempoText.visible = false;
			llegar();
		}
		
	}			
	private function llegar():Void
	{
		FlxG.sound.music.stop();
		openSubState(new BattleState());
	}
	private function salir():Void
	{
		FlxG.switchState(new MenuState());
	}
	
	private function cartelito():Void
	{
		if (sePuede) 
		{
			sePuede = false;
			clickX = FlxG.mouse.x;
			clickY = FlxG.mouse.y;
			var cartelito:Cartelito;
			cartelito = new Cartelito(clickX, clickY,null, this);
			add(cartelito);
		}
		
	}
	public function ahoraSePuede():Void
	{
		sePuede = true;
	}
	
	public function ir(ad:Bool):Void
	{
		cruz.x = clickX - (cruz.width / 2);
		cruz.y = clickY - (cruz.height / 2);
		cruz.visible = true;
		
		contar = true;
		var angulo:Float;
		distX = clickX - barquito.x;
		distY = clickY - barquito.y;
		angulo = (Math.atan2(distY, distX) * 57.2958) + 90;
		barquito.angle = angulo;
		
		if (ad)
		{
			horas = 0;
			minutos = 30;
			barquito.x += (distX / 2);
			barquito.y += (distY / 2);
		}
	}
	private function contando(elapsed:Float):Void
	{
		if (contar) 
		{
			
			contador += elapsed;
			if (contador >= 1) 
			{
				contador = 0;
				segundos--;
				acercar();
				if (segundos<0) 
				{
					segundos = 59;
					minutos--;
					if (minutos< 0) 
					{
						horas--;
						minutos = 59;
						if (horas<0) 
						{
							horas = 0;
						}
					}
				}
			}
			tiempoText.visible = true;
			tiempoText.text = Std.string(horas) + ":" + Std.string(minutos) + ":" + Std.string(segundos);
			tiempoText.x = barquito.x;
			tiempoText.y = (barquito.y - tiempoText.height) - 5;
		}
	}
	
	private function acercar():Void
	{
		barquito.x += distX / 3600;
		barquito.y += distY / 3600;
	}
	private function verAd():Void
	{
		openSubState(new AdSubState());
		horas = 0;
		minutos = 0;
		segundos = 5;
		cerrarAd();
	}
	private function cerrarAd():Void
	{
		remove(adTxt);
		remove(siBtn);
		remove(noBtn);
	}
}