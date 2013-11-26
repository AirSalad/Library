package  
{
	import flash.display.BitmapDataChannel;
	import org.flixel.*;
	import flash.net.*;
	
	//import org.osflash.signals.Signal;
	
	public class GameConfig
	{
		//public static var stars:Starfield = new Starfield;
		//public static var background:Background = new Background;
		//public static var playerCenter:centerPoint = new centerPoint;
		//public static var orb:Orb = new Orb;
		//public static var enemies:EnemyManager = new EnemyManager;
		//public static var enemyBullets:EnemyBulletManager = new EnemyBulletManager;
		//public static var player:Player = new Player;
		//public static var playerBullets:BulletManager = new BulletManager;
		//public static var playerBullets:BulletManager = new BulletManager;
		//public static var playerDetails:PlayerConfig = new PlayerConfig;
		
		//GENERAL VARS
		public static var _basicVar:String = "Testing String 1";
		public static var _volumeMusic:int = 1;
		public static var _volumeSFX:int = 1;
		public static var _currentState:String = "None";
		//LEVEL VARS
		public static var _currentLevel:int = 1;
		public static var _currentWave:String = "";
		//public static var _level1Wave
		public static var _maxLevel:int = 1;
		//public static var _waveEvent:String = "Summoning";
		
		//PLAYER VARS
		public static var _currentGold:int = 1000;
		public static var _maxGold:int = 1000;
		public static var _currentUpgrades:Array = [1, 1, 1, 1, 1, 1];
		public static var _equipmentOwned:Array = [true, false, false, false, false, false, false, false, false, false, false, false];
		public static var _equipmentLevels:Array = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
		public static var _equipmentLevelMax:Array = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5];
		public static var _equipmentExp:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		
		public static var BasicExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var FlameExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var GravityExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var KnockbackExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var LaserExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var MeleeExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var MineExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var PierceExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var RapidExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var RocketExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var ShotgunExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		public static var SpreadExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		
		public static var _equipmentExpNeeded:Array;
		public static var _cheatsEnabled:Boolean = false;
		
		
		
		public static var extraExp:int = 0;
		
		//public static var _primaryTitle:String;
		//public static var _secondaryTitle:String;
		
		public static var _primaryId:int = 0;
		public static var _primaryTitle:String = "";
		/*public static var _primaryObject:Object = { wId:int,
													wType:String,
													wDamage:int,
													wFireRate:int,
													wVelocity:int,
													wMaxSpeed:int,
													wCurrentExp:int,
													wCurrentLevel:int};*/
		public static var _secondaryId:int = 0;
		public static var _secondaryTitle:String = "";
		
		public function GameConfig() 
		{
			_equipmentExpNeeded = new Array(BasicExpNeeded[_equipmentLevels[0]],
													   FlameExpNeeded[_equipmentLevels[1]], 
													   GravityExpNeeded[_equipmentLevels[2]],
													   KnockbackExpNeeded[_equipmentLevels[3]],
													   LaserExpNeeded[_equipmentLevels[4]],
													   MeleeExpNeeded[_equipmentLevels[5]],
													   MineExpNeeded[_equipmentLevels[6]],
													   PierceExpNeeded[_equipmentLevels[7]],
													   RapidExpNeeded[_equipmentLevels[8]], 
													   RocketExpNeeded[_equipmentLevels[9]],
													   ShotgunExpNeeded[_equipmentLevels[10]],
													   SpreadExpNeeded[_equipmentLevels[11]]);
		}
		
		public static function addExp(addedExp:int):void
		{
			_equipmentExp[_primaryId] = _equipmentExp[_primaryId] + addedExp;
			
			if (_equipmentExp[_primaryId] > _equipmentExpNeeded[_primaryId])
			{
				extraExp = _equipmentExp[_primaryId] - _equipmentExpNeeded[_primaryId];
				_equipmentExp[_primaryId] = 0;
				addExp(extraExp);
			}
		}
		
		//SAVE/LOAD CONFIG TO DATA
		public static function loadDataToConfig():void
		{
			var sd:SharedObject = SharedObject.getLocal("PrimarySave");
			trace(sd.data.variable);
			
			_basicVar = sd.data.variable;
			_primaryTitle = sd.data.primaryTitle;
			_secondaryTitle = sd.data.secondaryTitle;
			_primaryId = sd.data.primaryId;
			_secondaryId = sd.data.secondaryId;
			_equipmentLevels = sd.data.equipmentLevels;
			_equipmentExp = sd.data.equipmentExp;
			_equipmentOwned = sd.data.equipmentOwned;
			_currentLevel = sd.data.currentLevel;
			_maxLevel = sd.data.maxLevel;
			_currentGold = sd.data.currentGold;
			_maxGold = sd.data.maxGold;
			_currentUpgrades = sd.data.currentUpgradeLevels;
			_cheatsEnabled = sd.data.cheatsEnabled;
			_volumeMusic = sd.data.currentVolumeMusic;
			_volumeSFX = sd.data.currentVolumeSFX;
			_currentWave = sd.data.currentWave;
		}
		
		public static function saveConfigToData():void
		{
			var sd:SharedObject = SharedObject.getLocal("PrimarySave");
			trace(sd.data.variable);
			
			sd.data.variable = _basicVar;
			sd.data.primaryTitle = _primaryTitle;
			sd.data.secondaryTitle = _secondaryTitle;
			sd.data.primaryId = _primaryId;
			sd.data.secondaryId = _secondaryId;
			sd.data.equipmentLevels = _equipmentLevels;
			sd.data.equipmentExp = _equipmentExp;
			sd.data.equipmentOwned = _equipmentOwned;
			sd.data.currentLevel = _currentLevel;
			sd.data.maxLevel = _maxLevel;
			sd.data.currentGold = _currentGold;
			sd.data.maxGold = _maxGold;
			sd.data.currentUpgradeLevels = _currentUpgrades;
			sd.data.cheatsEnabled = _cheatsEnabled;
			sd.data.currentVolumeMusic = _volumeMusic;
			sd.data.currentVolumeSFX = _volumeSFX;
			sd.data.currentWave = _currentWave;
			
			sd.flush();
		}
		
		/*private function loadData():void
		{
			var sd:SharedObject = SharedObject.getLocal("PrimarySave");
			trace(sd.data.variable);
			
			_basicVar = sd.data.variable;
			//primaryTitle = sd.data.primaryEquip;
			//secondaryTitle = sd.data.secondaryEquip;
			_primaryEquip = sd.data.primaryId;
			_secondaryEquip = sd.data.secondaryId;
			_equipmentLevels = sd.data.equipmentLevels;
			_equipmentExp = sd.data.equipmentExp;
			_currentLevel = sd.data.currentLevel; 
			_maxLevel = sd.data.maxLevel;
			_currentGold = sd.data.currentGold;
			_maxGold = sd.data.maxGold;
			_currentUpgrades = sd.data.currentUpgrades;
			_cheatsEnabled = sd.data.cheatsEnabled;
			FlxG.volume = sd.data.currentVolumeMusic; 
			FlxG.volume = sd.data.currentVolumeSFX;
			
			//_currentLevelWaves = "enemyWave1a";
			_currentWave = sd.data.currentWave;
		}*/
		/*public function get basicVar():String
		{
			return _basicVar;
		}
		
		public function set basicVar(basicVar:String):void
		{
			_basicVar = basicVar;
			
			//dataChanged.dispatch("enemyHealthMod", _enemyHealthMod);
		}*/
	}

}