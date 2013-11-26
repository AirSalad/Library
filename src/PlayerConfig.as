package  
{
	import flash.display.BitmapDataChannel;
	import org.flixel.*;
	
	public class PlayerConfig extends FlxGroup
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
		public var currentPrimary:Object = {    wId:int,
												wName:String,
												wType:String,
												wDamage:int,
												wFireRate:int,
												wVelocity:int,
												wMaxSpeed:int,
												wLife:int,
												wLifeSpan:int,
												wCurrentLevel:int,
												wMaxLevel:int,
												wExpArray:Array,
												wCurrentExp:int,
												wMaxExp:int,
												wGoldCost:int };
		public var currentSecondary:Object = {  wId:int,
												wName:String,
												wType:String,
												wDamage:int,
												wFireRate:int,
												wVelocity:int,
												wMaxSpeed:int,
												wLife:int,
												wLifeSpan:int,
												wCurrentLevel:int,
												wMaxLevel:int,
												wExpArray:Array,
												wCurrentExp:int,
												wMaxExp:int,
												wGoldCost:int };
												
		public var baseEquip:Object = { wId:int,
										wName:String,
										wType:String,
										wDamage:int,
										wFireRate:int,
										wVelocity:int,
										wMaxSpeed:int,
										wLife:int,
										wLifeSpan:int,
										wCurrentLevel:int,
										wMaxLevel:int,
										wExpArray:Array,
										wCurrentExp:int,
										wMaxExp:int,
										wGoldCost:int };
											
		public var normalEquip:Object;
		public var knockbackEquip:Object;
		public var gravityEquip:Object;
		public var mineEquip:Object;
		public var meleeEquip:Object;
		public var laserEquip:Object;
		public var flamethrowerEquip:Object;
		public var peirceEquip:Object;
		public var rocketEquip:Object;
		public var spreadEquip:Object;
		public var shotgunEquip:Object;
		public var rapidEquip:Object;
		
		public var primaryEquip:Object;
		public var secondaryEquip:Object;
		
		public var secondaryPenality:int = 0.8;
		//public var currentPrimary:String = "Normal";//SAVE
		//public var currentSecondary:String = "Normal";//SAVE
		
		public var equipmentCurrentExpArray:Array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];//SAVE
		public var equipmentCurrentLevelArray:Array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];//SAVE
		
		public var normalOwned:Boolean = true;//SAVE
		public var knockbackOwned:Boolean = false;//SAVE
		public var gravityOwned:Boolean = false;//SAVE
		public var mineOwned:Boolean = false;//SAVE
		public var meleeOwned:Boolean = false;//SAVE
		public var laserOwned:Boolean = false;//SAVE
		public var flamethrowerOwned:Boolean = false;//SAVE
		public var peirceOwned:Boolean = false;//SAVE
		public var rocketOwned:Boolean = false;//SAVE
		public var spreadOwned:Boolean = false;//SAVE
		public var shotgunOwned:Boolean = false;//SAVE
		public var rapidOwned:Boolean = false;//SAVE
		
		public var currentBombs:int = 0;//SAVE
		public var currentGold:int = 0;//SAVE
		
		public function PlayerConfig() 
		{
			//loadSave
			//loadEquipment();//primaryEquip, secondaryEquip);
		}
		///////////////////////////////////////////////////////////////////
		//						MANAGING PLAYER EQUIP					 //
		///////////////////////////////////////////////////////////////////
		public function loadEquipment():void//primaryObject:Object, secondaryObject:Object):void
		{
			/*currentPrimary.wId = primaryStats.wId;
			currentPrimary.wName = primaryStats.wName;
			currentPrimary.wType = primaryStats.wType;
			currentPrimary.wDamage = primaryStats.wDamage;
			currentPrimary.wFireRate = primaryStats.wFireRate;
			currentPrimary.wVelocity = primaryStats.wVelocity;
			currentPrimary.wMaxSpeed = primaryStats.wMaxSpeed;
			currentPrimary.wLife = primaryStats.wLife;
			currentPrimary.wLifeSpan = primaryStats.wLifeSpan;
			currentPrimary.wCurrentLevel = primaryStats.wCurrentLevel;
			currentPrimary.wMaxLevel = primaryStats.wMaxLevel;
			currentPrimary.wExpArray = primaryStats.wExpArray;
			currentPrimary.wCurrentExp = primaryStats.wCurrentExp;
			currentPrimary.wMaxExp = currentPrimary.wExpArray[currentPrimary.wCurrentLevel];
			currentPrimary.wGoldCost = primaryStats.wGoldCost;*/

			switch (currentPrimary)
			{
				case "Shotgun":
				//shotgunEquip.wId = 1;
				updateEquipment("Primary", "Shotgun");
				//primaryEquip = shotgunEquip();
				break;
			
				case "Normal":
				//normalEquip.wId = 1;
				updateEquipment("Primary", "Normal");
				//primaryEquip = normalEquip();
				break;
				
				case "Spread":
				//spreadEquip.wId = 1;
				updateEquipment("Primary", "Spread");
				//primaryEquip = spreadEquip();
				break;
				
				case "Rapid":
				//rapidEquip.wId = 1;
				updateEquipment("Primary", "Rapid");
				//secondaryEquip = rapidEquip();
				break;
				
				case "Laser":
				//laserEquip.wId = 1; 
				updateEquipment("Primary", "Laser");
				//secondaryEquip = laserEquip();
				break;
				
				case "Rocket":
				//rocketEquip.wId = 1;
				updateEquipment("Primary", "Rocket");
				//secondaryEquip = rocketEquip();
				break;
			}
			Registry.playerBullets.createWeapons(primaryEquip);
			
			/*currentSecondary.wId = secondaryStats.wId;
			currentSecondary.wName = secondaryStats.wName;
			
			currentSecondary.wType = secondaryStats.wType;
			currentSecondary.wDamage = secondaryStats.wDamage;
			currentSecondary.wFireRate = secondaryStats.wFireRate;
			currentSecondary.wVelocity = secondaryStats.wVelocity;
			currentSecondary.wMaxSpeed = secondaryStats.wMaxSpeed;
			currentSecondary.wLife = secondaryStats.wLife;
			currentSecondary.wLifeSpan = secondaryStats.wLifeSpan;
			currentSecondary.wCurrentLevel = secondaryStats.wCurrentLevel;
			currentSecondary.wMaxLevel = secondaryStats.wMaxLevel;
			currentSecondary.wExpArray = secondaryStats.wExpArray;
			currentSecondary.wCurrentExp = secondaryStats.wCurrentExp;
			currentSecondary.wMaxExp = currentSecondary.wExpArray[currentSecondary.wCurrentLevel];
			currentSecondary.wGoldCost = secondaryStats.wGoldCost;*/
			
			switch (currentSecondary)
			{
				case "Shotgun":
				//shotgunEquip.wId = 2;
				updateEquipment("Secondary", "Shotgun");
				//secondaryEquip = shotgunEquip();
				break;
			
				case "Normal":
				//normalEquip.wId = 2;
				updateEquipment("Secondary", "Normal");
				//secondaryEquip = normalEquip();
				break;
				
				case "Spread":
				//spreadEquip.wId = 2;
				updateEquipment("Secondary", "Spread");
				//secondaryEquip = spreadEquip();
				break;
				
				case "Rapid":
				//rapidEquip.wId = 2;
				updateEquipment("Secondary", "Rapid");
				//secondaryEquip = rapidEquip();
				break;
				
				case "Laser":
				//laserEquip.wId = 2; 
				updateEquipment("Secondary", "Laser");
				//secondaryEquip = laserEquip();
				break;
				
				case "Rocket":
				//rocketEquip.wId = 2;
				updateEquipment("Secondary", "Rocket");
				//secondaryEquip = rocketEquip();
				break;
			}
			
			Registry.playerBullets.createWeapons(secondaryEquip);
		}
		
		public function updateEquipment(equipSlot:String, itemName:String):void
		{
			if (equipSlot == "Primary")
			{
				if (itemName == "Shotgun")
				{
					/*currentPrimary.wDamage = 2;
					currentPrimary.wFireRate = 700;
					currentPrimary.wVelocity = 100;
					currentPrimary.wMaxSpeed = 300;
					currentPrimary.wLife = 1;
					currentPrimary.wLifeSpan = 0;
					Registry.playerBullets.updateWeapons(currentPrimary);*/
				}
				if (itemName == "Spread")
				{
					/*currentSecondary.wDamage = 1;
					currentSecondary.wFireRate = 1000;
					currentSecondary.wVelocity = 100;
					currentSecondary.wMaxSpeed = 400;
					currentSecondary.wLife = 1;
					currentSecondary.wLifeSpan = 0;
					Registry.playerBullets.updateWeapons(currentSecondary);*/
				}
			}
		}
		
		/*public function grantExpToWeapons(reward:int):void//, equipedBook:String):void
		{
			//Check if the player has not gotten the max level
			//If not maxed add exp to current amount
			if (currentPrimary.wCurrentLevel != currentPrimary.wMaxLevel)
			{
				currentPrimary.wCurrentExp += reward;
				trace("Primary Exp Rewarded: " + reward);
			}
				
			if (currentSecondary.wCurrentLevel != currentSecondary.wMaxLevel)
			{
				currentSecondary.wCurrentExp += reward;
				trace("Secondary Exp Rewarded: " + reward);
			}
			
			//If exp exceeds level requirement then level up the weapon and proceed to update its stats
			if (currentPrimary.wCurrentExp >= currentPrimary.wMaxExp)
			{
				while (currentPrimary.wCurrentExp >= currentPrimary.wMaxExp)
				{
					trace("Primary Level Up!");
					currentPrimary.wCurrentExp = currentPrimary.wCurrentExp - currentPrimary.wMaxExp;
					currentPrimary.wCurrentLevel++;
					currentPrimary.wMaxExp = currentPrimary.wExpArray[currentPrimary.wCurrentLevel];
					if (currentPrimary.wCurrentLevel == currentPrimary.wMaxLevel)
						currentPrimary.wCurrentExp = 0;
					updateEquipment(currentPrimary.wName);
				}
			}
			
			if (currentSecondary.wCurrentExp >= currentSecondary.wMaxExp)
			{
				while (currentSecondary.wCurrentExp >= currentSecondary.wMaxExp)
				{
					trace("Secondary Level Up!");
					currentSecondary.wCurrentExp = currentSecondary.wCurrentExp - currentSecondary.wMaxExp;
					currentSecondary.wCurrentLevel++;
					currentSecondary.wMaxExp = currentSecondary.wExpArray[currentSecondary.wCurrentLevel];
					if (currentSecondary.wCurrentLevel == currentSecondary.wMaxLevel)
						currentSecondary.wCurrentExp = 0;
					updateEquipment(currentSecondary.wName);
				}
			}
		}*/
		
		private function weaponBaseData(weaponType:String):void//TODO Complete this chart
		{
			/*knockbackEquip 
			gravityEquip 
			mineEquip 
			meleeEquip 
			laserEquip 
			flamethrowerEquip 
			normalEquip 
			peirceEquip 
			rocketEquip 
			spreadEquip 
			shotgunEquip
			rapidEquip*/
			
			if (weaponType == "Spread")
			{
				//Equip.wId = 0;
				spreadEquip.wName = "Spread";
				spreadEquip.wType = "Spread";
				spreadEquip.wCurrentLevel = 0;
				spreadEquip.wMaxLevel = 3;
				spreadEquip.wDamage = 2 + (spreadEquip.wCurrentLevel);
				spreadEquip.wFireRate = 700 + (spreadEquip.wCurrentLevel);
				spreadEquip.wVelocity = 100 + (spreadEquip.wCurrentLevel);
				spreadEquip.wMaxSpeed = 300 + (spreadEquip.wCurrentLevel);
				spreadEquip.wLife = 1;
				spreadEquip.wLifeSpan = 0;
				spreadEquip.wExpArray = [1000, 2000, 3000, 99999];
				spreadEquip.wCurrentExp = 0;
				spreadEquip.wMaxExp = spreadEquip.wExpArray[spreadEquip.wCurrentLevel];
				spreadEquip.wGoldCost = 100;
			}
			
			if (weaponType == "Normal")
			{
				//Equip.wId = 0;
				normalEquip.wName = "Normal";
				normalEquip.wType = "Normal";
				normalEquip.wCurrentLevel = 0;
				normalEquip.wMaxLevel = 3;
				normalEquip.wDamage = 10+ (normalEquip.wCurrentLevel);
				normalEquip.wFireRate = 500+ (normalEquip.wCurrentLevel);
				normalEquip.wVelocity = 100+ (normalEquip.wCurrentLevel);
				normalEquip.wMaxSpeed = 300+ (normalEquip.wCurrentLevel);
				normalEquip.wLife = 1;
				normalEquip.wLifeSpan = 0;
				normalEquip.wExpArray = [10, 20, 30, 99999];
				normalEquip.wCurrentExp = 0;
				normalEquip.wMaxExp = normalEquip.wExpArray[normalEquip.wCurrentLevel];
				normalEquip.wGoldCost = 100;
			}
			
			if (weaponType == "Shotgun")
			{
				//Equip.wId = 1;
				shotgunEquip.wName = "Shotgun";
				shotgunEquip.wType = "Shotgun";
				shotgunEquip.wCurrentLevel = 0;
				shotgunEquip.wMaxLevel = 3;
				shotgunEquip.wDamage = 1 + (shotgunEquip.wCurrentLevel);
				shotgunEquip.wFireRate = 1000 + (shotgunEquip.wCurrentLevel);
				shotgunEquip.wVelocity = 100 + (shotgunEquip.wCurrentLevel);
				shotgunEquip.wMaxSpeed = 400 + (shotgunEquip.wCurrentLevel);
				shotgunEquip.wLife = 1;
				shotgunEquip.wLifeSpan = 0;
				shotgunEquip.wExpArray = [10, 20, 30, 99999];
				shotgunEquip.wCurrentExp = 0;
				shotgunEquip.wMaxExp = shotgunEquip.wExpArray[shotgunEquip.wCurrentLevel];
				shotgunEquip.wGoldCost = 100;
			}
			
		}
		
		/*public function get shotgunEquip():Object
		{
			return shotgunEquip;
		}*/
		
		/*public function set enemyHealthMod(enemyHealthMod:Number):void
		{
			_enemyHealthMod = enemyHealthMod;s
			
			dataChanged.dispatch("enemyHealthMod", _enemyHealthMod);
		}*/
		
		/*private function weaponUpgradeData():Object
		{
			if (weaponType == "Spread")
			{
				//Equip.wId = 0;
				Damage = 2;
				FireRate = 700;
				Velocity = 100;
				MaxSpeed = 300;
				Life = 1;
				LifeSpan = 0;
				CurrentLevel = 0;
				MaxLevel = 3;
				ExpArray = [1000, 2000, 3000, 99999];
				CurrentExp = 0;
				MaxExp = ExpArray[Equip.wCurrentLevel];
				GoldCost = 100;
			}
			
			if (weaponType == "Spread")
			{
				//Equip.wId = 1;
				Damage = 2;
				FireRate = 700;
				Velocity = 100;
				MaxSpeed = 300;
				Life = 1;
				LifeSpan = 0;
				CurrentLevel = 0;
				MaxLevel = 3;
				ExpArray = [1000, 2000, 3000, 99999];
				CurrentExp = 0;
				MaxExp = ExpArray[Equip.wCurrentLevel];
				GoldCost = 100;
			}
			
			if (weaponType == "Spread")
			{
				//Equip.wId = 1;
				Damage += 2;
				FireRate = 700;
				Velocity = 100;
				MaxSpeed = 300;
				Life = 1;
				LifeSpan = 0;
				CurrentLevel = 0;
				MaxLevel = 3;
				ExpArray = [1000, 2000, 3000, 99999];
				CurrentExp = 0;
				MaxExp = ExpArray[Equip.wCurrentLevel];
				GoldCost = 100;
				
			}
		}*/
		
		///////////////////////////////////////////////////////////////////
		//						SAVING AND LOADING						 //
		///////////////////////////////////////////////////////////////////
		/*private function saveData():void
		{
			var sd:SharedObject = SharedObject.getLocal("primarySave");
			
			//sd.data.variable = gameConfig.variable;
			
			trace("stage save: " + sd.data.currentLevel);
			sd.flush();
			writeSaves();
			trace("stage save after write: " + sd.data.currentLevel);
			trace("data saved succesfully");
		}
		private function loadData():void
		{
			var ld:SharedObject = SharedObject.getLocal(loadingData);
		}
		protected function checkSaves():void
		{
			gc = SharedObject.getLocal("gameConfiguration");
			_gameConfig.existingSave = gc.data.ExistingSave;
		}
		
		protected function clearSaves():void
		{
			gc = SharedObject.getLocal("gameConfiguration");
			gc.data.ExistingSave = false;
			gc.flush();
		}
		
		protected function writeSaves():void
		{
			gc = SharedObject.getLocal("gameConfiguration");
			gc.data.ExistingSave = true;
			gc.flush();
		}*/
		
	}

}