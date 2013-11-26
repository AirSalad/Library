package  
{
	//import Math.*;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.plugin.photonstorm.FlxDelay;
	
	import flash.utils.getTimer;

	public class EnemyManager extends FlxGroup
	{
		[Embed(source = '../assets/bullet.png')]
		private var bulletPNG:Class;
		public var eNormalBulletA:FlxWeapon;
		
		private var lastReleased:int;
		private var releaseRate:int = 1000;
		private var randomNum:Number = 1;
		private var summoningDelay:FlxDelay;
		private var finnishingDelay:FlxDelay;
		
		private var enemyBatNum:uint = 1;
		private var enemyRodentNum:uint = 1;
		private var enemySkullNum:uint = 1;
		private var enemySlimeNum:uint = 1;
		private var enemyWizardNum:uint = 1;
		private var enemyWolfNum:uint = 1;
		
		public var currentLevel:int = 0;
		public var currentWave:int = 0;
		public var maxWaves:uint = 0;
		public var waveLength:uint = 0;
		public var waveTotal:uint = 0;
		public var waveEvent:String = "Summoning";
		public var currentLevelWaves:int = 0;
		
		
		//private var level1WaveSize:Array = [6, 12];
		
		//private var BatNumber:int;
		//private var RodentNumber:int;
		//private var SkullNumber:int;
		//private var SlimeNumber:int;
		//private var WizardNumber:int;
		//private var WolfNumber:int;
		
		
		
		//private var enemyWave1a:Array = ["Bat", "Rodent", "Skull", "Slime", "Wizard", "Wolf"];
		//private var enemyWave1a:Array = [[1, 1], [1, 1], [1, 1], [1, 1], [1, 1], [1, 1]];
		
		//private var enemyWave1b:Array = [[1, 3], [1, 1], [1, 2], [1, 1], [1, 2], [1, 1]];
		
		//TYPE/ELEMENT/AMOUNT/LEVEL/DELAY
		//ELEMENTS = NONE, WIND, ICE, FIRE, LIGHTNING, EARTH
		//TYPES    = BAT, RODENT, SKULL, SLIME, WIZARD, WOLF
		//LEVELS   = 1, 2, 3
		
		//addEnemies(enemyGroup::enemies);
			
		
		
		private var enemyWaveOneA:Array = new Array
			( 
			{ type: "Bat", element: "None", amount: 1, level: 1, delay: 0 },
			{ type: "Rodent", element: "None", amount: 1, level: 1, delay: 0 },
			{ type: "Skull", element: "None", amount: 1, level: 1, delay: 0 },
			{ type: "Slime", element: "None", amount: 1, level: 1, delay: 0 },
			{ type: "Wizard", element: "None", amount: 1, level: 1, delay: 0 },
			{ type: "Wolf", element: "None", amount: 1, level: 1, delay: 0 } 
			);
			
		private var enemyWaveOneB:Array = new Array
			( 
			{ type: "Slime", element: "None", amount: 1, level: 1, delay: 0 },
			{ type: "Wolf", element: "None", amount: 2, level: 1, delay: 0 }
			);
			
		//private var enemyWave1a:Array = new Array
		//	( add(new Enemy("Bat", "None", 1, 1, 0)));
			
			//private var enemyWave1a:Array = new Array
			//( new Enemy("Bat", "None", 1, 1, 0));
			
		
		//private var enemyWave1a:Array = [5,1,1,1,1,1];
		//private var enemyWave1b:Array = [1,1,1,1,1,1];
		
		//TODO Look at calculating the total enemies per wave instead of entering it in manually
		private var enemyLevelOne:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelTwo:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelThree:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelFour:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelFive:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelSix:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelSeven:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelEight:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelNine:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelTen:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelEleven:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		private var enemyLevelTwelve:Array = new Array({total: 6, array:enemyWaveOneA}, {total: 3, array:enemyWaveOneB});
		
		
		private var gameLevelArray:Array = new Array
		( { totalWaves: 1, waveArray: enemyLevelOne },//Level 1
		{totalWaves: 1, waveArray: enemyLevelTwo },//Level 2
		{totalWaves: 1, waveArray: enemyLevelThree },//Level 3
		{totalWaves: 1, waveArray: enemyLevelFour },//Level 4
		{totalWaves: 1, waveArray: enemyLevelFive },//Level 5
		{totalWaves: 1, waveArray: enemyLevelSix },//Level 6
		{totalWaves: 1, waveArray: enemyLevelSeven },//Level 7
		{totalWaves: 1, waveArray: enemyLevelEight },//Level 8
		{totalWaves: 1, waveArray: enemyLevelNine },//Level 9
		{totalWaves: 1, waveArray: enemyLevelTen },//Level 10
		{totalWaves: 1, waveArray: enemyLevelEleven },//Level 11
		{totalWaves: 1, waveArray: enemyLevelTwelve }//Level 12
		);
		
		private var i:int = 0;
		private var e:int = 0;
		private var j:int = 0;
		private var k:int = 0;
		
		public function EnemyManager() 
		{
			super();
			
			//waveEvent = "Summoning";
			//enemyLevel1 = new Array({total: 6, array:enemyWave1a}, {total: 6, array:enemyWave1b});
			
			summoningDelay = new FlxDelay(500);
			finnishingDelay = new FlxDelay(500);
			summoningDelay.start();

		}
		
		public function addEnemies(waveEnemyTotal:int, currentWaveArray:Array):void
		{
			waveLength = waveEnemyTotal;
			waveTotal = waveEnemyTotal;
			
			
			
			for (i = 0; i < currentWaveArray.length; i++)
			{
				//for (k = 0; k < currentWaveArray[i].length; k++) {
				//trace("key=" + currentWaveArray[i].amount);
				//}
				
				
				//trace("Current enemy array :" + currentWaveArray[i].type);
				for (j = 0; j < currentWaveArray[i].amount; j++)
				{
					add(new Enemy(currentWaveArray[i].type,
								  currentWaveArray[i].element,
								  currentWaveArray[i].level));
					//release(currentWaveArray[i]);
					
					var enemy:Enemy = Enemy(getFirstAvailable(Enemy));
					
					if (enemy)
					{
						enemy.launch(currentWaveArray[i].delay);
					}
					//trace("Enemy Launched :" + currentWaveArray[i].type);
				}
			}
			
			/*if (BatNumber > 0)
			{
				for (i = 0; i < BatNumber; i++)
				{
					add(new BatEnemy(1));
					release("Bat");
				}
			}
			if (RodentNumber > 0)
			{
				for (i = 0; i < RodentNumber; i++)
				{
					add(new RodentEnemy(1));
					release("Rodent");
				}
			}
			if (SkullNumber > 0)
			{
				for (i = 0; i < SkullNumber; i++)
				{
					add(new SkullEnemy(1));
					release("Skull");
				}
			}
			if (SlimeNumber > 0)
			{
				for (i = 0; i < SlimeNumber; i++)
				{
					add(new SlimeEnemy(1));
					release("Slime");
				}
			}
			if (WizardNumber > 0)
			{
				for (i = 0; i < WizardNumber; i++)
				{
					add(new WizardEnemy(1));
					release("Wizard");
				}
			}
			if (WolfNumber > 0)
			{
				for (i = 0; i < WolfNumber; i++)
				{
					add(new WolfEnemy(1));
					release("Wolf");
				}
			}*/
			waveEvent = "Running";
			
		}
		
		/*public function release(enemyType:String):void
		{
			if (enemyType == "Bat")
			{
				var bat:BatEnemy = BatEnemy(getFirstAvailable(BatEnemy));
			
				if (bat)
				{
					bat.launch();
				}
			}
			else if (enemyType == "Rodent")
			{
				var rodent:RodentEnemy = RodentEnemy(getFirstAvailable(RodentEnemy));
			
				if (rodent)
				{
					rodent.launch();
				}
			}
			else if (enemyType == "Skull")
			{
				var skull:SkullEnemy = SkullEnemy(getFirstAvailable(SkullEnemy));
			
				if (skull)
				{
					skull.launch();
				}
			}
			else if (enemyType == "Slime")
			{
				var slime:SlimeEnemy = SlimeEnemy(getFirstAvailable(SlimeEnemy));
			
				if (slime)
				{
					slime.launch();
				}
			}
			else if (enemyType == "Wizard")
			{
				var wizard:WizardEnemy = WizardEnemy(getFirstAvailable(WizardEnemy));
			
				if (wizard)
				{
					wizard.launch();
				}
			}
			else if (enemyType == "Wolf")
			{
				var wolf:WolfEnemy = WolfEnemy(getFirstAvailable(WolfEnemy));
			
				if (wolf)
				{
					wolf.launch();
				}
			}
			
		}*/
		
		override public function update():void
		{
			super.update();
			if (finnishingDelay.hasExpired && waveEvent == "Finnishing")
			{
				levelFinnished();
			}
			if (summoningDelay.hasExpired && waveEvent == "Summoning")
			{
				//switch (currentLevel)
				//{
				//	case 1:
				//trace("Enemies summoned");
					maxWaves = gameLevelArray[currentLevel].totalWaves + 1;
					addEnemies(gameLevelArray[currentLevel].waveArray[currentWave].total, gameLevelArray[currentLevel].waveArray[currentWave].array);
					//trace("Enemies summoned: " + enemyLevel1[currentLevel].total + ","+ enemyLevel1[currentLevel].array);
				//	break;
				//}
				
			}
			if (waveEvent == "Running" && waveLength == 0)
			{
				if (currentWave < gameLevelArray[currentLevel].totalWaves)
				{
					clear();
					currentWave++;
					addEnemies(gameLevelArray[currentLevel].waveArray[currentWave].total, gameLevelArray[currentLevel].waveArray[currentWave].array);
				}
				else if (currentWave == gameLevelArray[currentLevel].totalWaves && waveEvent=="Running")
				{
					clear();
					currentWave = 0;
					waveEvent = "Finnishing";
					//finnishingDelay.callback(levelFinnished);
					finnishingDelay.start();
				}
			}
			/*	if (waveEvent == "Summoning")//currentLevel == 1 && 
				{
					currentWaveTotal = 0;
					for (i = 0; i < enemyWave1a.length; i++)
					{
						currentWaveTotal += enemyWave1a[i];
					}
					addEnemies(currentWaveTotal, enemyWave1a[0], enemyWave1a[1], enemyWave1a[2], enemyWave1a[3], enemyWave1a[4], enemyWave1a[5]);
				}
				if (waveLength == 0 && waveEvent == "Running" && currentWave == "enemyWave1a")
				{
					waveEvent = "Summoning";
					currentWave = "enemyWave1b";
					currentWaveTotal = 0;
					//waveTotal = 0;
					//waveLength = 0;
					for (i = 0; i < enemyWave1b.length; i++)
					{
						currentWaveTotal += enemyWave1b[i];
					}
					addEnemies(currentWaveTotal, enemyWave1b[0], enemyWave1b[1], enemyWave1b[2], enemyWave1b[3], enemyWave1b[4], enemyWave1b[5]);
				}
				if (waveLength == 0 && waveEvent == "Running" && currentWave == "enemyWave1b")
				{
					waveEvent = "Completed";
					//GameConfig._waveEvent = "Completed";
					//PlayState.changeStates();
				}
			}*/
			
		}
		
		private function levelFinnished():void
		{			
			waveEvent = "Completed";
		}
		//ENEMY REACTION FUNCTIONS
		public function bulletHitEnemy(bullet:FlxObject, enemy:FlxObject):void
		{
			enemy.hurt(bullet.damage);
			
			trace("Bullet hit enemy");
			bullet.kill();
			FlxG.score += bullet.damage;
		}
		
		public function bulletPierceEnemy(bullet:FlxObject, enemy:FlxObject):void
		{
			enemy.hurt(bullet.damage);
			FlxG.score += bullet.damage;
		}
		
		public function bulletExplodeEnemy(bullet:FlxObject, enemy:FlxObject):void
		{
			trace("Rocket Exploded");
			Registry.bulletCenter.x = bullet.x;
			Registry.bulletCenter.y = bullet.y;
			enemy.hurt(bullet.damage);
			Registry.playerBullets.explosionWeapon.fireAtPosition(enemy.x, enemy.y);
			FlxG.score += bullet.damage;
			bullet.kill();
		}
		
		public function bulletBombExplodeEnemy(bullet:FlxObject, enemy:FlxObject):void
		{
			trace("Rocket Exploded");
			Registry.bulletCenter.x = bullet.x;
			Registry.bulletCenter.y = bullet.y;
			enemy.hurt(bullet.damage);
			Registry.playerBullets.bombExplosionWeapon.fireAtPosition(enemy.x, enemy.y);
			FlxG.score += bullet.damage;
			bullet.kill();
		}
		
	}

}