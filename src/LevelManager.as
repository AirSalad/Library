package  
{
	/*
		Level Manager

		Handles levels and spawning of enemies

	*/

	import org.flixel.FlxBasic;
	import org.flixel.FlxGroup;

	import org.flixel.plugin.photonstorm.FlxDelay;

	public class LevelManager extends FlxGroup
	{

		public var levelConfig:Array;
		public var currentState:Array;

		//wave status flags
		public static const WAVE_STATUS_SPAWNING:int = 0;
		public static const WAVE_STATUS_RUNNING:int = 1;
		public static const WAVE_STATUS_FINISHING:int = 2;
		public static const WAVE_STATUS_COMPLETED:int = 3;

		
		public function LevelManager(config, state):void
		{			
			super();

			//If a current state (savegame) is provided use this to overwrite default state

			//default state
			currentState.level = 0;
			currentState.wave = 0;
			currentState.waveStatus = WAVE_STATUS_SPAWNING;

			//extending default state with provided state
			if (typeof state === 'undefined')
			{
				trace('LevelManager :: LevelManager() :: No state provided.');
			}
			else
			{
				for (var i:String in state)
				{
				    currentState[i] = state[i]; 
				}
			}

			/*
				config contains the following keys

				waves: Associative arrays of enemy waves
				e.g Array({type: "Bat", element: null, amount: 1, level: 1, delay: 0})

				levelWaves: An array of levels (key) to array of wave keys
				e.g Array(Array(0, 3, 2), Array(0, 3, 4))
				
			*/

			//default config
			levelConfig.spawningDelay = new FlxDelay(3000);
			levelConfig.finishingDelay = new FlxDelay(3000);

			//extending default config with provided config
			if (typeof config === 'undefined')
			{
				trace('LevelManager :: LevelManager() :: No config provided.');
			}
			else
			{
				for (var i:String in config)
				{
				   levelConfig[i] = config[i]; 
				}
			}

			config.spawningDelay.start();

		}
		
		public function addEnemies():void
		{
			for (var i:int in levelWaves[currentState.level])
			{
				var wave:Array = waves[levelWaves[currentState.level][i]];

				if (typeof wave !== 'undefined')
				{
					for (var j:int = 0;j < wave.amount;j++)
					{

						add(new Enemy(wave.type, wave.element, wave.level));

						var enemy:Enemy = getFirstAvailable(Enemy);
						
						enemy.spawn(enemy.delay);
					
					}
				}
			}
		}
		
		override public function update():void
		{
			super.update();

			switch (currentState.waveStatus)
			{

				case WAVE_STATUS_RUNNING:

					if (countLiving() === 0)
					{
						var numWaves:int = levelConfig.waves[currentState.level].length;

						//next wave
						if ((currentState.wave + 1) < numWaves)
						{
							clear();
							
							currentState.wave++;

							addEnemies();
						}
						else
						{
							clear();

							currentState.waveStatus = WAVE_STATUS_FINISHING;

							levelConfig.finishingDelay.start();
						}
					}

					break;
				case WAVE_STATUS_FINISHING:
					
					if (levelConfig.finishingDelay.hasExpired)
					{
						currentState.waveStatus = WAVE_STATUS_COMPLETED;
					}

					break;
				case WAVE_STATUS_COMPLETED:

					var numLevels:int = levelConfig.levelWaves.length;

					if ((currentState.level + 1) < numLevels)
					{
						//next level
						currentState.level++;
						currentState.wave = 0;
						currentState.waveStatus === WAVE_STATUS_SPAWNING;

						config.spawningDelay.start();
					}
					else if ((currentState.level + 1) === numLevels)
					{
						//game completed
					}

					break;
				case WAVE_STATUS_SPAWNING:
				default:

					if (levelConfig.spawningDelay.hasExpired)
					{
						addEnemies();

						currentState.waveStatus === WAVE_STATUS_RUNNING;
					}

					break;

			}
		}
	}

}