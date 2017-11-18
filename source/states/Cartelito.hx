package states;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;

/**
 * ...
 * @author Tomás Mugetti
 */
class Cartelito extends FlxSprite 
{
	private var estado:MapState;
	private var texto:FlxText;
	private var exitButton:FlxButton;
	private var irButton:FlxButton;
	private var siBtn:FlxButton;
	private var noBtn:FlxButton;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, _estado:MapState) 
	{
		super(X, Y, SimpleGraphic);
		this.visible = false;
		this.setSize(500,300);
		estado = _estado;
		
		if (this.y + this.height> FlxG.camera.height) 
		{
			this.y -= (FlxG.camera.height - this.height);
		}
		if (this.x + this.width > FlxG.camera.width) 
		{
			this.x -= (FlxG.camera.width - this.width);
		}
		if (this.x < 0) 
		{
			this.x = 0;
		}
		if (this.y < 0) 
		{
			this.y = 0;
		}
		
		texto = new FlxText(this.x, this.y, 700, "Tardaras 1 hora(s) en llegar", 50);
		estado.add(texto);
		
		exitButton = new FlxButton(this.x + texto.width, this.y + texto.height, "", cerrar);
		exitButton.loadGraphic(AssetPaths.cancelar__png);
		exitButton.x -= exitButton.width;
		estado.add(exitButton);
		
		irButton = new FlxButton(this.x, this.y + texto.height, "", ad);
		irButton.loadGraphic(AssetPaths.ir__png);
		//irButton.x += irButton.width / 2;
		estado.add(irButton);
		
		
	}
	
	private function cerrar():Void
	{
		estado.ahoraSePuede();
		estado.remove(texto);
		estado.remove(exitButton);
		estado.remove(irButton);
		estado.remove(siBtn);
		estado.remove(noBtn);
		estado.remove(this);
		destroy();
	}
	private function ad():Void
	{
		texto.text = "¿Ver una publicidad para reducir 30 minutos de viaje?";
		
		siBtn = new FlxButton(irButton.x, irButton.y, "", irAd);
		siBtn.loadGraphic(AssetPaths.si__png);
		irButton.destroy();
		siBtn.y += siBtn.height;
		estado.add(siBtn);
		
		noBtn = new FlxButton(exitButton.x, exitButton.y, "", ir);
		noBtn.loadGraphic(AssetPaths.no__png);
		exitButton.destroy();
		noBtn.y += noBtn.height;
		estado.add(noBtn);
	}
	
	private function irAd():Void
	{
		estado.ir(true);
		estado.openSubState(new AdSubState());
		cerrar();
	}
	private function ir():Void
	{
		estado.ir(false);
		cerrar();
	}
}