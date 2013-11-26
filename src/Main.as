package {
	import org.flixel.*;
	
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
	public class Main extends FlxGame {
		public var gameConfig:GameConfig;
		
		public function Main(){			
			super(800, 600, MenuState, 1, 60, 24, true);
			
			//TODO Do not forget to disable debugger >.>
			forceDebugger = true;
			//FlxG.debug = true;
			
			//add(GameConfig.playerConfig);
			gameConfig = new GameConfig;
			
			trace(GameConfig._basicVar);
		}
	}
}