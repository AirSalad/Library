package  
{
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxDelay;
	
	public class WizardEnemy extends Enemy
	{
		//[Embed(source = '../assets/WIZARD.png')] 
		//public var wizardPNG:Class;
		
		public var wizardMC:MovieClip;
			
		public function WizardEnemy(eLevel:int):void
		{
			super("Wizard", "Homing Ranged", "Basic", eLevel, (eLevel * 10), eLevel, (eLevel * 10), (eLevel * 10));
			wizardMC = new Wizard;
			
			//loadGraphic(wizardPNG, false, true, 116, 118);
			loadMovieClip(wizardMC, 118, 128, true,true);
		}
	
	}
}