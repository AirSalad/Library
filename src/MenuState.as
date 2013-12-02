package  
{
	import adobe.utils.CustomActions;
	import flash.display.MorphShape;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.core.MovieClipLoaderAsset;
	import org.flixel.*;
	import org.flixel.FlxG;
	import org.flixel.FlxCamera;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	import flash.net.*;
	
	public class MenuState extends FlxState
	{
		//COSMETICS
		private var ShopBackgroundImageMC:MovieClip;
		private var ShopBookContainerMC:MovieClip;
		private var ShopInfoContainerMC:MovieClip;
		private var ShopInfoGemMC:MovieClip;
		private var ShopUpgradeContainerMC:MovieClip;
		private var ShopGemLargeContainerMC:MovieClip;
		private var ShopGemWhiteContainerMC:MovieClip;
		
		
		
		//BOOK IMAGES
		private var ShopBasicBookImageMC:MovieClip;
		private var ShopFlameBookImageMC:MovieClip;
		private var ShopGravityBookImageMC:MovieClip;
		private var ShopKnockbackBookImageMC:MovieClip;
		private var ShopLaserBookImageMC:MovieClip;
		private var ShopMeleeBookImageMC:MovieClip;
		private var ShopMineBookImageMC:MovieClip;
		private var ShopPierceBookImageMC:MovieClip;
		private var ShopRapidBookImageMC:MovieClip;
		private var ShopRocketBookImageMC:MovieClip;
		private var ShopShotgunBookImageMC:MovieClip;
		private var ShopSpreadBookImageMC:MovieClip;
		
		//BOOK SHOP BUTTONS
		//UNLOCK
		private var ShopBasicUnlockMC:MovieClip;
		private var ShopFlameUnlockMC:MovieClip;
		private var ShopGravityUnlockMC:MovieClip;
		private var ShopKnockbackUnlockMC:MovieClip;
		private var ShopLaserUnlockMC:MovieClip;
		private var ShopMeleeUnlockMC:MovieClip;
		private var ShopMineUnlockMC:MovieClip;
		private var ShopPierceUnlockMC:MovieClip;
		private var ShopRapidUnlockMC:MovieClip;
		private var ShopRocketUnlockMC:MovieClip;
		private var ShopShotgunUnlockMC:MovieClip;
		private var ShopSpreadUnlockMC:MovieClip;
		
		//EQUIP A
		private var ShopBasicEquipAMC:MovieClip;
		private var ShopFlameEquipAMC:MovieClip;
		private var ShopGravityEquipAMC:MovieClip;
		private var ShopKnockbackEquipAMC:MovieClip;
		private var ShopLaserEquipAMC:MovieClip;
		private var ShopMeleeEquipAMC:MovieClip;
		private var ShopMineEquipAMC:MovieClip;
		private var ShopPierceEquipAMC:MovieClip;
		private var ShopRapidEquipAMC:MovieClip;
		private var ShopRocketEquipAMC:MovieClip;
		private var ShopShotgunEquipAMC:MovieClip;
		private var ShopSpreadEquipAMC:MovieClip;
		
		//EQUIP B
		private var ShopBasicEquipBMC:MovieClip;
		private var ShopFlameEquipBMC:MovieClip;
		private var ShopGravityEquipBMC:MovieClip;
		private var ShopKnockbackEquipBMC:MovieClip;
		private var ShopLaserEquipBMC:MovieClip;
		private var ShopMeleeEquipBMC:MovieClip;
		private var ShopMineEquipBMC:MovieClip;
		private var ShopPierceEquipBMC:MovieClip;
		private var ShopRapidEquipBMC:MovieClip;
		private var ShopRocketEquipBMC:MovieClip;
		private var ShopShotgunEquipBMC:MovieClip;
		private var ShopSpreadEquipBMC:MovieClip;
		
		//BULLET ICONS
		//SMALL
		private var ShopUpgradeBasicIconSmallMC:MovieClip;
		private var ShopUpgradeFlameIconSmallMC:MovieClip;
		private var ShopUpgradeGravityIconSmallMC:MovieClip;
		private var ShopUpgradeKnockbackIconSmallMC:MovieClip;
		private var ShopUpgradeLaserIconSmallMC:MovieClip;
		private var ShopUpgradeMeleeIconSmallMC:MovieClip;
		private var ShopUpgradeMineIconSmallMC:MovieClip;
		private var ShopUpgradePierceIconSmallMC:MovieClip;
		private var ShopUpgradeRapidIconSmallMC:MovieClip;
		private var ShopUpgradeRocketIconSmallMC:MovieClip;
		private var ShopUpgradeShotgunIconSmallMC:MovieClip;
		private var ShopUpgradeSpreadIconSmallMC:MovieClip;
		//MEDIUM
		//A
		private var ShopUpgradeBasicIconMediumAMC:MovieClip;
		private var ShopUpgradeFlameIconMediumAMC:MovieClip;
		private var ShopUpgradeGravityIconMediumAMC:MovieClip;
		private var ShopUpgradeKnockbackIconMediumAMC:MovieClip;
		private var ShopUpgradeLaserIconMediumAMC:MovieClip;
		private var ShopUpgradeMeleeIconMediumAMC:MovieClip;
		private var ShopUpgradeMineIconMediumAMC:MovieClip;
		private var ShopUpgradePierceIconMediumAMC:MovieClip;
		private var ShopUpgradeRapidIconMediumAMC:MovieClip;
		private var ShopUpgradeRocketIconMediumAMC:MovieClip;
		private var ShopUpgradeShotgunIconMediumAMC:MovieClip;
		private var ShopUpgradeSpreadIconMediumAMC:MovieClip;
		//B
		private var ShopUpgradeBasicIconMediumBMC:MovieClip;
		private var ShopUpgradeFlameIconMediumBMC:MovieClip;
		private var ShopUpgradeGravityIconMediumBMC:MovieClip;
		private var ShopUpgradeKnockbackIconMediumBMC:MovieClip;
		private var ShopUpgradeLaserIconMediumBMC:MovieClip;
		private var ShopUpgradeMeleeIconMediumBMC:MovieClip;
		private var ShopUpgradeMineIconMediumBMC:MovieClip;
		private var ShopUpgradePierceIconMediumBMC:MovieClip;
		private var ShopUpgradeRapidIconMediumBMC:MovieClip;
		private var ShopUpgradeRocketIconMediumBMC:MovieClip;
		private var ShopUpgradeShotgunIconMediumBMC:MovieClip;
		private var ShopUpgradeSpreadIconMediumBMC:MovieClip;
		//LARGE
		private var ShopUpgradeBasicIconLargeMC:MovieClip;
		private var ShopUpgradeFlameIconLargeMC:MovieClip;
		private var ShopUpgradeGravityIconLargeMC:MovieClip;
		private var ShopUpgradeKnockbackIconLargeMC:MovieClip;
		private var ShopUpgradeLaserIconLargeMC:MovieClip;
		private var ShopUpgradeMeleeIconLargeMC:MovieClip;
		private var ShopUpgradeMineIconLargeMC:MovieClip;
		private var ShopUpgradePierceIconLargeMC:MovieClip;
		private var ShopUpgradeRapidIconLargeMC:MovieClip;
		private var ShopUpgradeRocketIconLargeMC:MovieClip;
		private var ShopUpgradeShotgunIconLargeMC:MovieClip;
		private var ShopUpgradeSpreadIconLargeMC:MovieClip;
		
		//BUTTONS
		//MENU
		private var ShopLevelButtonMC:MovieClip;
		private var ShopOptionButtonMC:MovieClip;
		private var ShopUpgradeButtonMC:MovieClip;
		private var ShopBookButtonMC:MovieClip;
		//SHOP
		private var ShopPageLeftButtonMC:MovieClip;
		private var ShopPageRightButtonMC:MovieClip;
		
		//UPGRADE
		private var ShopUpgradeBombContainerMC:MovieClip;
		private var ShopUpgradeIntelligenceContainerMC:MovieClip;
		private var ShopUpgradeLearningContainerMC:MovieClip;
		private var ShopUpgradeRegenerationContainerMC:MovieClip;
		private var ShopUpgradeSpeedContainerMC:MovieClip;
		private var ShopUpgradeVitalityContainerMC:MovieClip;
		
		private var ShopUpgradeBombLevelButtonMC:MovieClip;
		private var ShopUpgradeIntelligenceLevelButtonMC:MovieClip;
		private var ShopUpgradeLearningLevelButtonMC:MovieClip;
		private var ShopUpgradeRegenerationLevelButtonMC:MovieClip;
		private var ShopUpgradeSpeedLevelButtonMC:MovieClip;
		private var ShopUpgradeVitalityLevelButtonMC:MovieClip;
		
		//EQUIP INFORMATION
		private var ShopEquipAContainerMC:MovieClip;
		private var ShopEquipANameContainerMC:MovieClip;
		private var ShopEquipAStyleContainerMC:MovieClip;
		private var ShopEquipBContainerMC:MovieClip;
		private var ShopEquipBNameContainerMC:MovieClip;
		private var ShopEquipBStyleContainerMC:MovieClip;
		
		//SHOP INFORMATION
		private var ShopInfoBookIconContainerMC:MovieClip;
		private var ShopInfoDetailsContainerMC:MovieClip;
		private var ShopInfoGoldContainerMC:MovieClip;
		private var ShopInfoTitleContainerMC:MovieClip;
		private var ShopInfoValuesContainerMC:MovieClip;
		private var ShopDetailsWarningContainerMC:MovieClip;
		private var ShopUpgradeGoldTotalContainerMC:MovieClip;
		
		//BULLETS/BOOKS
		private var ShopUpgradePrimaryDescriptionContainerMC:MovieClip;
		private var ShopUpgradeSecondaryDescriptionContainerMC:MovieClip;
		private var ShopUpgradeBookLevelContainerMC:MovieClip;
		
		
		private var ShopUpgradePrimaryExpContainerMC:MovieClip;
		private var ShopUpgradePrimaryLevelContainerMC:MovieClip;
		private var ShopUpgradePrimaryTitleContainerMC:MovieClip;
		private var ShopUpgradePrimaryExpEmptyBarMC:MovieClip;
		private var ShopUpgradePrimaryExpFullBarMC:MovieClip;
		
		private var ShopUpgradeSecondaryExpContainerMC:MovieClip;
		private var ShopUpgradeSecondaryLevelContainerMC:MovieClip;
		private var ShopUpgradeSecondaryTitleContainerMC:MovieClip;
		private var ShopUpgradeSecondaryExpEmptyBarMC:MovieClip;
		private var ShopUpgradeSecondaryExpFullBarMC:MovieClip;
		
		//SKILLS
		private var ShopUpgradeSkillTitleContainerMC:MovieClip;
		
		private var ShopUpgradeBombCostContainerMC:MovieClip;
		private var ShopUpgradeIntelligenceCostContainerMC:MovieClip;
		private var ShopUpgradeLearningCostContainerMC:MovieClip;
		private var ShopUpgradeRegenerationCostContainerMC:MovieClip;
		private var ShopUpgradeSpeedCostContainerMC:MovieClip;
		private var ShopUpgradeVitalityCostContainerMC:MovieClip;

		
		
		//VARIABLES
		private var currentPage:String = "A";
		private var currentSection:String = "Shop";
		private var currentButton:String = "Shop";
		
		private var currentLevel:int = 1;
		private var maxLevel:int = 1;
		private var currentLevelWaves:Array 	 = [0,1,2,3,3,5,4,6,7,5,2,5,4,"?"];
		private var currentLevelDifficulty:Array = ["None" , "Simple", "Easy", "Easy", "Normal", "Hard", "Hard", "Difficult", "Difficult", "Challenging", "Challenging", "DEADLY", "HELLISH", "ARCANIC"];
		
		//Basic, Flame, Gravity, Knockback, Laser, Melee, Mine, Pierce, Rapid, Rocket, Shotgun, Spread
		private var equipmentLevels:Array = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
		private var equipmentLevelMax:Array = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5];
		private var equipmentExp:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		private var equipmentExpNeeded:Array = [100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		private var equipmentCost:Array = [1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1500];
		//private var equipmentExpNeeded:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		private var equipmentOwned:Array = [true, false, false, false, false, false, false, false, false, false, false, false];
		//BombLevel, IntelligenceLevel, LearningLevel, RegenerationLevel, SpeedLevel, VitalityLevel
		private var currentUpgrades:Array = [1, 1, 1, 1, 1, 1];
		
		private var currentGold:int = 20000;
		private var maxGold:int = 20000;
		private var currentMinute:int = 0;
		private var currentSecond:int = 0;
		
		private var bombValue:int = 1000;
		private var intelligenceValue:int = 1000;
		private var learningValue:int = 1000;
		private var regenerationValue:int = 1000;
		private var speedValue:int = 1000;
		private var vitalityValue:int = 1250;
		
		//private var equipmentExpNeeded:Array = [BasicExpNeeded, FlameExpNeeded, GravityExpNeeded, KnockbackExpNeeded, LaserExpNeeded, MeleeExpNeeded, MineExpNeeded, PierceExpNeeded, RapidExpNeeded, RocketExpNeeded, ShotgunExpNeeded, SpreadExpNeeded];
		private var BasicExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var FlameExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var GravityExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var KnockbackExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var LaserExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var MeleeExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var MineExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var PierceExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var RapidExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var RocketExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var ShotgunExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		private var SpreadExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		
		private var BasicDescription:String = "Each Level increases base damage";
		private var FlameDescription:String = "Each Level increases rate of fire and Damage";
		private var GravityDescription:String = "Each Level increases Speed and Damage";
		private var KnockbackDescription:String = "Each Level increases Speed and Damage";
		private var LaserDescription:String = "Each Level increases rate of fire";
		private var MeleeDescription:String = "Each Level increases base damage and size of attack";
		private var MineDescription:String = "Each Level increases duration and damage";
		private var PierceDescription:String = "Each Level increases damage and lifespan";
		private var RapidDescription:String = "Each Level increases rate of fire";
		private var RocketDescription:String = "Each Level increases rocket speed and spread damage";
		private var ShotgunDescription:String = "Each Level increases number of bullets shot and reduces random spread";
		private var SpreadDescription:String = "Each Level increases the number of bullets shot and rate of fire";
		
		private var equipmentInfo:Array =	["Basic\r"+ "100" + "\r" + "1/s"
											,"Flamethrower\r"+ "100" + "\r" + "1/s"
											,"Gravity\r"+ "100" + "\r" + "1/s"
											,"KnockBack\r"+ "100" + "\r" + "1/s"
											,"Laser\r"+ "100" + "\r" + "1/s"
											,"Melee\r"+ "100" + "\r" + "1/s"
											,"Mines\r"+ "100" + "\r" + "1/s"
											,"Pierce\r"+ "100" + "\r" + "1/s"
											,"Rapid\r"+ "100" + "\r" + "1/s"
											,"Rocket\r"+ "100" + "\r" + "1/s"
											,"Shotgun\r" + "100" + "\r" + "1/s"
											,"Spread\r" + "100" + "\r" + "1/s" ];
		
		/*private var BombLevel:int = 1;
		private var IntelligenceLevel:int = 1;
		private var LearningLevel:int = 1;
		private var RegenerationLevel:int = 1;
		private var SpeedLevel:int = 1;
		private var VitalityLevel:int = 1;*/
		
		private var DoubleEquipDescription:String = "Increases nene's damage by 50% and exp gain by 50%";
		
		private var primaryTitle:String = "None";
		private var primaryStyle:String = "None";
		
		private var primaryId:int = 0;
		private var primaryExp:int = 0;
		private var primaryExpNeeded:int = 1;
		private var primaryLevel:int = 0;
		private var primaryLevelMax:int = 5;
		
		private var secondaryTitle:String = "None";
		private var secondaryStyle:String = "None";
		
		private var secondaryId:int = 0;
		private var secondaryExp:int = 0;
		private var secondaryExpNeeded:int = 1;
		private var secondaryLevel:int = 0;
		private var secondaryLevelMax:int = 5;
		
		/*//Basic
		//private var BasicExp:int = 0;
		//private var BasicExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var BasicLevel:int = 1;
		//private var BasicLevelMax:int = 5;
		//private var BasicDescription:String = "Each Level increases base damage";
		//private var BasicOwned:Boolean = true;
		//private var BasicCost:int = 1000;
		
		//Flame
		//private var FlameExp:int = 0;
		//private var FlameExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var FlameLevel:int = 1;
		//private var FlameLevelMax:int = 5;
		//private var FlameDescription:String = "Each Level increases rate of fire and Damage";
		//private var FlameOwned:Boolean = false;
		//private var FlameCost:int = 1000;
		
		//Gravity
		//private var GravityExp:int = 0;
		//private var GravityExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var GravityLevel:int = 1;
		//private var GravityLevelMax:int = 5;
		//private var GravityDescription:String = "Each Level increases Speed and Damage";
		//private var GravityOwned:Boolean = false;
		//private var GravityCost:int = 1000;
		
		//Knockback
		//private var KnockbackExp:int = 0;
		//private var KnockbackExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var KnockbackLevel:int = 1;
		//private var KnockbackLevelMax:int = 5;
		//private var KnockbackDescription:String = "Each Level increases Speed and Damage";
		//private var KnockbackOwned:Boolean = false;
		//private var KnockbackCost:int = 1000;
		
		//Laser
		//private var LaserExp:int = 0;
		//private var LaserExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var LaserLevel:int = 1;
		//private var LaserLevelMax:int = 5;
		//private var LaserDescription:String = "Each Level increases rate of fire";
		//private var LaserOwned:Boolean = false;
		//private var LaserCost:int = 1000;
		
		//Melee
		//private var MeleeExp:int = 0;
		//private var MeleeExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var MeleeLevel:int = 1;
		//private var MeleeLevelMax:int = 5;
		//private var MeleeDescription:String = "Each Level increases base damage and size of attack";
		//private var MeleeOwned:Boolean = false;
		//private var MeleeCost:int = 1000;
		
		//Mine
		//private var MineExp:int = 0;
		//private var MineExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var MineLevel:int = 1;
		//private var MineLevelMax:int = 5;
		//private var MineDescription:String = "Each Level increases duration and damage";
		//private var MineOwned:Boolean = false;
		//private var MineCost:int = 1000;
		
		//Pierce
		//private var PierceExp:int = 0;
		//private var PierceExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var PierceLevel:int = 1;
		//private var PierceLevelMax:int = 5;
		//private var PierceDescription:String = "Each Level increases damage and lifespan";
		//private var PierceOwned:Boolean = false;
		//private var PierceCost:int = 1000;
		
		//Rapid
		//private var RapidExp:int = 0;
		//private var RapidExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var RapidLevel:int = 1;
		//private var RapidLevelMax:int = 5;
		//private var RapidDescription:String = "Each Level increases rate of fire";
		//private var RapidOwned:Boolean = false;
		//private var RapidCost:int = 1000;
		
		//Rocket
		//private var RocketExp:int = 0;
		//private var RocketExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var RocketLevel:int = 1;
		//private var RocketLevelMax:int = 5;
		//private var RocketDescription:String = "Each Level increases rocket speed and spread damage";
		//private var RocketOwned:Boolean = false;
		//private var RocketCost:int = 1000;
		
		//Shotgun
		//private var ShotgunExp:int = 0;
		//private var ShotgunExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var ShotgunLevel:int = 1;
		//private var ShotgunLevelMax:int = 5;
		//private var ShotgunDescription:String = "Each Level increases number of bullets shot and reduces random spread";
		//private var ShotgunOwned:Boolean = false;
		//private var ShotgunCost:int = 1000;
		
		//Spread
		//private var SpreadExp:int = 0;
		//private var SpreadExpNeeded:Array = [0, 100, 200, 300, 400, 500];
		//private var SpreadLevel:int = 1;
		//private var SpreadLevelMax:int = 5;
		//private var SpreadDescription:String = "Each Level increases the number of bullets shot and rate of fire";
		//private var SpreadOwned:Boolean = false;
		//private var SpreadCost:int = 1000;*/
		
		
		
		
		//LEVEL DETAILS
		
		
		private var ShopLevelBackgroundContainerMC:MovieClip;
		private var ShopLevelClockContainerMC:MovieClip;
		private var ShopLevelDescriptionContainerMC:MovieClip;
		private var ShopLevelSelectContainerMC:MovieClip;
		
		private var ShopLevelSecondHandContainerMC:MovieClip;
		private var ShopLevelMinuteHandContainerMC:MovieClip;
		private var ShopLevelHourHandContainerMC:MovieClip;
		
		private var ShopLevelPreviousButtonMC:MovieClip;
		private var ShopLevelPlayButtonMC:MovieClip;
		private var ShopLevelNextButtonMC:MovieClip;
		
		private var ShopLevelAvaliableMC:MovieClip;
		
		
		/*private var BombLevel:String = "Level 0";
		private var IntelligenceLevel:String = "Level 0";
		private var LearningLevel:String = "Level 3";
		private var RegenerationLevel:String = "Level 0";
		private var SpeedLevel:String = "Level 0";
		private var VitalityLevel:String = "Level 0";*/
		
		private var detailsWarning:Boolean = true;
		
		private var currentBookDetail:String = "None";
		
		//private var background:FlxMovieClip;
		//private var debug:FlxText;
		//private var playerEquip:FlxText;
		//private var playerHealth:FlxText;
		//private var playerScore:FlxText;
		//private var playerLevel:FlxText;
		//private var playerAmmo:FlxText;
		//private var currentGold:FlxText;
		//private var playerWave:FlxText;
		//private var playerEnemyCount:FlxText;
		
		private var cheatsEnabled:Boolean = true;
		
		private var shopVariable:String = "Blargh";
		
		private var volumeMusic:int = 1;
		private var volumeSFX:int = 1;
		
		private var currentWave:String;
		
		public function MenuState() 
		{
			super();
		}
		
		override public function create():void 
		{
			super.create();
			
			//FlxG.showBounds(0, 0, 3200, 1760);
			FlxG.worldBounds.x = 0;
			FlxG.worldBounds.y = 0;
			FlxG.worldBounds.width = 800;
			FlxG.worldBounds.height = 600;
			FlxG.camera.setBounds(0, 0, 800, 600);
			
			//ShopBackgroundMC = new ShopBackgroundImage;
			//TODO load all the swc's into movieclips
			
			//COSMETICS
			ShopBackgroundImageMC = new ShopBackgroundImage;
			ShopBookContainerMC = new ShopBookContainer;
			ShopInfoContainerMC = new ShopInfoContainer;
			ShopInfoGemMC = new ShopInfoGem;
			ShopUpgradeContainerMC = new ShopUpgradeContainer;
			ShopGemLargeContainerMC = new ShopGemLargeContainer;
			ShopGemWhiteContainerMC = new ShopGemWhiteContainer;
			
			//BOOK IMAGES
			ShopKnockbackBookImageMC = new ShopKnockbackBookImage;
			ShopFlameBookImageMC = new ShopFlameBookImage;
			ShopGravityBookImageMC = new ShopGravityBookImage;
			ShopLaserBookImageMC = new ShopLaserBookImage;
			ShopMeleeBookImageMC = new ShopMeleeBookImage;
			ShopMineBookImageMC = new ShopMineBookImage;
			ShopBasicBookImageMC = new ShopBasicBookImage;
			ShopPierceBookImageMC = new ShopPierceBookImage;
			ShopRapidBookImageMC = new ShopRapidBookImage;
			ShopRocketBookImageMC = new ShopRocketBookImage;
			ShopShotgunBookImageMC = new ShopShotgunBookImage;
			ShopSpreadBookImageMC = new ShopSpreadBookImage;
			
			
			
			//BULLET ICONS
			//SMALL
			ShopUpgradeKnockbackIconSmallMC = new ShopUpgradeKnockbackIconSmall;
			ShopUpgradeFlameIconSmallMC = new ShopUpgradeFlameIconSmall;
			ShopUpgradeGravityIconSmallMC = new ShopUpgradeGravityIconSmall;
			ShopUpgradeLaserIconSmallMC = new ShopUpgradeLaserIconSmall;
			ShopUpgradeMeleeIconSmallMC = new ShopUpgradeMeleeIconSmall;
			ShopUpgradeMineIconSmallMC = new ShopUpgradeMineIconSmall;
			ShopUpgradeBasicIconSmallMC = new ShopUpgradeBasicIconSmall;
			ShopUpgradePierceIconSmallMC = new ShopUpgradePierceIconSmall;
			ShopUpgradeRapidIconSmallMC = new ShopUpgradeRapidIconSmall;
			ShopUpgradeRocketIconSmallMC = new ShopUpgradeRocketIconSmall;
			ShopUpgradeShotgunIconSmallMC = new ShopUpgradeShotgunIconSmall;
			ShopUpgradeSpreadIconSmallMC = new ShopUpgradeSpreadIconSmall;
			//MEDIUM
			//A
			ShopUpgradeKnockbackIconMediumAMC = new ShopUpgradeKnockbackIconMedium;
			ShopUpgradeFlameIconMediumAMC = new ShopUpgradeFlameIconMedium;
			ShopUpgradeGravityIconMediumAMC = new ShopUpgradeGravityIconMedium;
			ShopUpgradeLaserIconMediumAMC = new ShopUpgradeLaserIconMedium;
			ShopUpgradeMeleeIconMediumAMC = new ShopUpgradeMeleeIconMedium;
			ShopUpgradeMineIconMediumAMC = new ShopUpgradeMineIconMedium;
			ShopUpgradeBasicIconMediumAMC = new ShopUpgradeBasicIconMedium;
			ShopUpgradePierceIconMediumAMC = new ShopUpgradePierceIconMedium;
			ShopUpgradeRapidIconMediumAMC = new ShopUpgradeRapidIconMedium;
			ShopUpgradeRocketIconMediumAMC = new ShopUpgradeRocketIconMedium;
			ShopUpgradeShotgunIconMediumAMC = new ShopUpgradeShotgunIconMedium;
			ShopUpgradeSpreadIconMediumAMC = new ShopUpgradeSpreadIconMedium;
			//B
			ShopUpgradeKnockbackIconMediumBMC = new ShopUpgradeKnockbackIconMedium;
			ShopUpgradeFlameIconMediumBMC = new ShopUpgradeFlameIconMedium;
			ShopUpgradeGravityIconMediumBMC = new ShopUpgradeGravityIconMedium;
			ShopUpgradeLaserIconMediumBMC = new ShopUpgradeLaserIconMedium;
			ShopUpgradeMeleeIconMediumBMC = new ShopUpgradeMeleeIconMedium;
			ShopUpgradeMineIconMediumBMC = new ShopUpgradeMineIconMedium;
			ShopUpgradeBasicIconMediumBMC = new ShopUpgradeBasicIconMedium;
			ShopUpgradePierceIconMediumBMC = new ShopUpgradePierceIconMedium;
			ShopUpgradeRapidIconMediumBMC = new ShopUpgradeRapidIconMedium;
			ShopUpgradeRocketIconMediumBMC = new ShopUpgradeRocketIconMedium;
			ShopUpgradeShotgunIconMediumBMC = new ShopUpgradeShotgunIconMedium;
			ShopUpgradeSpreadIconMediumBMC = new ShopUpgradeSpreadIconMedium;
			//LARGE
			ShopUpgradeKnockbackIconLargeMC = new ShopUpgradeKnockbackIconLarge;
			ShopUpgradeFlameIconLargeMC = new ShopUpgradeFlameIconLarge;
			ShopUpgradeGravityIconLargeMC = new ShopUpgradeGravityIconLarge;
			ShopUpgradeLaserIconLargeMC = new ShopUpgradeLaserIconLarge;
			ShopUpgradeMeleeIconLargeMC = new ShopUpgradeMeleeIconLarge;
			ShopUpgradeMineIconLargeMC = new ShopUpgradeMineIconLarge;
			ShopUpgradeBasicIconLargeMC = new ShopUpgradeBasicIconLarge;
			ShopUpgradePierceIconLargeMC = new ShopUpgradePierceIconLarge;
			ShopUpgradeRapidIconLargeMC = new ShopUpgradeRapidIconLarge;
			ShopUpgradeRocketIconLargeMC = new ShopUpgradeRocketIconLarge;
			ShopUpgradeShotgunIconLargeMC = new ShopUpgradeShotgunIconLarge;
			ShopUpgradeSpreadIconLargeMC = new ShopUpgradeSpreadIconLarge;
			
			//BUTTONS
			//MENU
			ShopLevelButtonMC = new ShopLevelButton;
			ShopOptionButtonMC = new ShopOptionButton;
			ShopUpgradeButtonMC = new ShopUpgradeButton;
			ShopBookButtonMC = new ShopBookButton;
			
			//SHOP
			ShopPageLeftButtonMC = new ShopPageLeftButton;
			ShopPageRightButtonMC = new ShopPageRightButton;

			//UPGRADE
			ShopUpgradeBombContainerMC = new ShopUpgradeBombContainer;
			ShopUpgradeIntelligenceContainerMC = new ShopUpgradeIntelligenceContainer;
			ShopUpgradeLearningContainerMC = new ShopUpgradeLearningContainer;
			ShopUpgradeRegenerationContainerMC = new ShopUpgradeRegenerationContainer;
			ShopUpgradeSpeedContainerMC = new ShopUpgradeSpeedContainer;
			ShopUpgradeVitalityContainerMC = new ShopUpgradeVitalityContainer;
			
			ShopUpgradeBombLevelButtonMC = new ShopUpgradeSkillLevelButton;
			ShopUpgradeIntelligenceLevelButtonMC = new ShopUpgradeSkillLevelButton;
			ShopUpgradeLearningLevelButtonMC = new ShopUpgradeSkillLevelButton;
			ShopUpgradeRegenerationLevelButtonMC = new ShopUpgradeSkillLevelButton;
			ShopUpgradeSpeedLevelButtonMC = new ShopUpgradeSkillLevelButton;
			ShopUpgradeVitalityLevelButtonMC = new ShopUpgradeSkillLevelButton;
			
			//BOOK SHOP BUTTONS
			//UNLOCK
			ShopKnockbackUnlockMC = new ShopUnlockButton;
			ShopFlameUnlockMC = new ShopUnlockButton;
			ShopGravityUnlockMC = new ShopUnlockButton;
			ShopLaserUnlockMC = new ShopUnlockButton;
			ShopMeleeUnlockMC = new ShopUnlockButton;
			ShopMineUnlockMC = new ShopUnlockButton;
			ShopBasicUnlockMC = new ShopUnlockButton;
			ShopPierceUnlockMC = new ShopUnlockButton;
			ShopRapidUnlockMC = new ShopUnlockButton;
			ShopRocketUnlockMC = new ShopUnlockButton;
			ShopShotgunUnlockMC = new ShopUnlockButton;
			ShopSpreadUnlockMC = new ShopUnlockButton;
			
			//EQUIP A
			ShopKnockbackEquipAMC = new ShopEquipAButton;
			ShopFlameEquipAMC = new ShopEquipAButton;
			ShopGravityEquipAMC = new ShopEquipAButton;
			ShopLaserEquipAMC = new ShopEquipAButton;
			ShopMeleeEquipAMC = new ShopEquipAButton;
			ShopMineEquipAMC = new ShopEquipAButton;
			ShopBasicEquipAMC = new ShopEquipAButton;
			ShopPierceEquipAMC = new ShopEquipAButton;
			ShopRapidEquipAMC = new ShopEquipAButton;
			ShopRocketEquipAMC = new ShopEquipAButton;
			ShopShotgunEquipAMC = new ShopEquipAButton;
			ShopSpreadEquipAMC = new ShopEquipAButton;
			
			//EQUIP B
			ShopKnockbackEquipBMC = new ShopEquipBButton;
			ShopFlameEquipBMC = new ShopEquipBButton;
			ShopGravityEquipBMC = new ShopEquipBButton;
			ShopLaserEquipBMC = new ShopEquipBButton;
			ShopMeleeEquipBMC = new ShopEquipBButton;
			ShopMineEquipBMC = new ShopEquipBButton;
			ShopBasicEquipBMC = new ShopEquipBButton;
			ShopPierceEquipBMC = new ShopEquipBButton;
			ShopRapidEquipBMC = new ShopEquipBButton;
			ShopRocketEquipBMC = new ShopEquipBButton;
			ShopShotgunEquipBMC = new ShopEquipBButton;
			ShopSpreadEquipBMC = new ShopEquipBButton;
			
			//EQUIP INFORMATION
			ShopEquipAContainerMC = new ShopEquipAContainer;
			ShopEquipANameContainerMC = new ShopEquipANameContainer;
			ShopEquipAStyleContainerMC = new ShopEquipAStyleContainer;
			ShopEquipBContainerMC = new ShopEquipBContainer;
			ShopEquipBNameContainerMC = new ShopEquipBNameContainer;
			ShopEquipBStyleContainerMC = new ShopEquipBStyleContainer;
			
			//SHOP INFORMATION
			ShopInfoDetailsContainerMC = new ShopInfoDetailsContainer;
			ShopInfoGoldContainerMC = new ShopInfoGoldContainer;
			ShopInfoTitleContainerMC = new ShopInfoTitleContainer;
			ShopInfoValuesContainerMC = new ShopInfoValuesContainer;
			ShopDetailsWarningContainerMC = new ShopDetailsWarningContainer;
			ShopUpgradeGoldTotalContainerMC = new ShopUpgradeGoldTotalContainer;
			
			//BULLETS/BOOKS
			ShopUpgradePrimaryDescriptionContainerMC = new ShopUpgradePrimaryDescriptionContainer;
			ShopUpgradeSecondaryDescriptionContainerMC = new ShopUpgradeSecondaryDescriptionContainer;
			ShopUpgradeBookLevelContainerMC = new ShopUpgradeBookLevelContainer;
			
			ShopUpgradePrimaryExpContainerMC = new ShopUpgradePrimaryExpContainer;
			ShopUpgradePrimaryLevelContainerMC = new ShopUpgradePrimaryLevelContainer;
			ShopUpgradePrimaryTitleContainerMC = new ShopUpgradePrimaryTitleContainer;
			ShopUpgradePrimaryExpEmptyBarMC = new ShopUpgradeExpEmptyBar;
			ShopUpgradePrimaryExpFullBarMC = new ShopUpgradeExpFullBar;
			
			ShopUpgradeSecondaryExpContainerMC = new ShopUpgradeSecondaryExpContainer;
			ShopUpgradeSecondaryLevelContainerMC = new ShopUpgradeSecondaryLevelContainer;
			ShopUpgradeSecondaryTitleContainerMC = new ShopUpgradeSecondaryTitleContainer;
			ShopUpgradeSecondaryExpEmptyBarMC = new ShopUpgradeExpEmptyBar;
			ShopUpgradeSecondaryExpFullBarMC = new ShopUpgradeExpFullBar;
			
			//SKILLS
			ShopUpgradeSkillTitleContainerMC = new ShopUpgradeSkillTitleContainer;
			
			ShopUpgradeBombCostContainerMC = new ShopUpgradeBombCostContainer;
			ShopUpgradeIntelligenceCostContainerMC = new ShopUpgradeIntelligenceCostContainer;
			ShopUpgradeLearningCostContainerMC = new ShopUpgradeLearningCostContainer;
			ShopUpgradeRegenerationCostContainerMC = new ShopUpgradeRegenerationCostContainer;
			ShopUpgradeSpeedCostContainerMC = new ShopUpgradeSpeedCostContainer;
			ShopUpgradeVitalityCostContainerMC = new ShopUpgradeVitalityCostContainer;
			
			
			ShopLevelBackgroundContainerMC = new ShopLevelBackgroundContainer;
			ShopLevelClockContainerMC = new ShopLevelClockContainer;
			ShopLevelDescriptionContainerMC = new ShopLevelDescriptionContainer;
			ShopLevelSelectContainerMC = new ShopLevelSelectContainer;
			
			ShopLevelSecondHandContainerMC = new ShopLevelSecondHandContainer;
			ShopLevelMinuteHandContainerMC = new ShopLevelMinuteHandContainer;
			//ShopLevelHourHandContainerMC = ShopLevelHourHandContainer;
			
			ShopLevelPreviousButtonMC = new ShopLevelPreviousButton;
			ShopLevelPlayButtonMC = new ShopLevelPlayButton;
			ShopLevelNextButtonMC = new ShopLevelNextButton;
			ShopLevelAvaliableMC = new ShopLevelAvaliable;
			
			//COSMETICS
			FlxG.stage.addChild(ShopBackgroundImageMC);
			FlxG.stage.addChild(ShopGemLargeContainerMC);
			FlxG.stage.addChild(ShopUpgradeGoldTotalContainerMC);
			
			//BUTTONS
			FlxG.stage.addChild(ShopLevelButtonMC);
			FlxG.stage.addChild(ShopOptionButtonMC);
			
			ShopLevelButtonMC.addEventListener(MouseEvent.CLICK, switchToLevelPage);
			
			//////////////POSITIONS/////////////////////////
			//BUTTONS
			ShopLevelButtonMC.x = 25;
			ShopLevelButtonMC.y = 531;
			ShopOptionButtonMC.x = 25;
			ShopOptionButtonMC.y = 415;
			
			//COSMETICS
			ShopBackgroundImageMC.x = 0;
			ShopBackgroundImageMC.y = 0;
			ShopGemLargeContainerMC.x = 10;
			ShopGemLargeContainerMC.y = 110;
			ShopUpgradeGoldTotalContainerMC.x = 50;
			ShopUpgradeGoldTotalContainerMC.y = 120;
			
			FlxG.stage.addChild(ShopBookButtonMC);
			ShopBookButtonMC.addEventListener(MouseEvent.CLICK, loadShopPage);
			
			//add(Registry.ShopUI);
			//add(Registry.UpgradeUI);
			loadConfigToShop();
			loadDataToShop();
			loadEquipmentDetails();
			loadShopPage("A");
			//loadData();
			
			/*if (GameConfig._currentState == "Play")
			{
				trace("Player exists?" + Registry.player.exists);
				//remove(PlayState);
				//remove(MenuState);
			}*/
			GameConfig._currentState = "Menu";
		}
		
		override public function update():void
		{
			super.update();
			
			ShopUpgradeGoldTotalContainerMC.ShopUpgradeGoldTotalText.text = currentGold;
		}
		
		///////////////////////////////////////////////////////////////
		/////////////////////////EQUIPMENT/////////////////////////////
		///////////////////////////////////////////////////////////////
		
		//LOADS THE TWO CURRENT EQUIPPED BULLETS TO THE TOP LEFT CONTAINERS
		private function loadEquipmentDetails():void
		{
			//TODO load all the equipment vars into the class and add the equipment containers to the top left
			
			//EQUIP INFORMATION
			FlxG.stage.addChild(ShopEquipAContainerMC);
			FlxG.stage.addChild(ShopEquipANameContainerMC);
			FlxG.stage.addChild(ShopEquipAStyleContainerMC);
			FlxG.stage.addChild(ShopEquipBContainerMC);
			FlxG.stage.addChild(ShopEquipBNameContainerMC);
			FlxG.stage.addChild(ShopEquipBStyleContainerMC);
			
			//EQUIP INFORMATION
			ShopEquipAContainerMC.x = 13.4;
			ShopEquipANameContainerMC.x = 45;
			ShopEquipAStyleContainerMC.x = 45;
			ShopEquipBContainerMC.x = 13.4;
			ShopEquipBNameContainerMC.x = 45;
			ShopEquipBStyleContainerMC.x = 45;
			
			ShopEquipAContainerMC.y = 8.35;
			ShopEquipANameContainerMC.y = 7.45;
			ShopEquipAStyleContainerMC.y = 25;
			ShopEquipBContainerMC.y = 63.5;
			ShopEquipBNameContainerMC.y = 63.6;
			ShopEquipBStyleContainerMC.y = 78.6;
			
			//loadConfig();
			//TODO load save vars into this
			ShopEquipANameContainerMC.ShopEquipANameText.text = primaryTitle;
			ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = primaryStyle;
			
			ShopEquipBNameContainerMC.ShopEquipBNameText.text = secondaryTitle;
			ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = secondaryStyle;
		}
		
		private function removeEquipmentDetails():void
		{
			FlxG.stage.removeChild(ShopEquipAContainerMC);
			FlxG.stage.removeChild(ShopEquipANameContainerMC);
			FlxG.stage.removeChild(ShopEquipAStyleContainerMC);
			FlxG.stage.removeChild(ShopEquipBContainerMC);
			FlxG.stage.removeChild(ShopEquipBNameContainerMC);
			FlxG.stage.removeChild(ShopEquipBStyleContainerMC);
		}
		///////////////////////////////////////////////////////////////
		////////////////////////////SHOP///////////////////////////////
		///////////////////////////////////////////////////////////////
		//SWITCHES BACK TO THE SHOP PAGE
		private function switchToShopPage(e:MouseEvent):void
		{
			if (currentSection == "Upgrades")
			{
				removeUpgradeEquipDetails();
				removeUpgradeButtons();
			}
			else if (currentSection == "Level")
			{
				removeLevelButtons();
			}
			loadShopPage(currentPage);
		}
		
		//SETS CURRENT PAGE AS THE STRING (A/B) AND LOADS THAT PAGE IMAGES AND EVENTS
		private function loadShopPage(pageSelected:String):void
		{
			currentPage = pageSelected;
			
			ShopBookButtonMC.removeEventListener(MouseEvent.CLICK, loadShopPage);
			FlxG.stage.removeChild(ShopBookButtonMC);
			
			FlxG.stage.addChild(ShopUpgradeButtonMC);
			
			FlxG.stage.addChild(ShopBookContainerMC);
			FlxG.stage.addChild(ShopInfoContainerMC);
			
			
			ShopUpgradeButtonMC.x = 25;
			ShopUpgradeButtonMC.y = 474;
			
			ShopBookContainerMC.x = 331.10;
			ShopInfoContainerMC.x = 332;
			ShopBookContainerMC.y = 4.50;
			ShopInfoContainerMC.y = 439;
			
			if (detailsWarning == true)
			{
				FlxG.stage.addChild(ShopDetailsWarningContainerMC);
				ShopDetailsWarningContainerMC.x = 390;
				ShopDetailsWarningContainerMC.y = 460;
			}
			else if (detailsWarning = false)
			{
				FlxG.stage.addChild(ShopInfoDetailsContainerMC);  
				FlxG.stage.addChild(ShopInfoGoldContainerMC);
				FlxG.stage.addChild(ShopInfoTitleContainerMC);
				FlxG.stage.addChild(ShopInfoValuesContainerMC);
				FlxG.stage.addChild(ShopInfoGemMC);
			}
			
			ShopUpgradeButtonMC.addEventListener(MouseEvent.CLICK, switchToUpgradePage);
			
			
			
			
			
			currentSection = "Shop";
			currentButton = "Upgrades";
			if (currentPage == "A")
			{
				//BOOK IMAGES
				FlxG.stage.addChild(ShopBasicBookImageMC);//
				FlxG.stage.addChild(ShopFlameBookImageMC);//
				FlxG.stage.addChild(ShopGravityBookImageMC);//
				FlxG.stage.addChild(ShopKnockbackBookImageMC);//
				FlxG.stage.addChild(ShopLaserBookImageMC);//
				FlxG.stage.addChild(ShopMeleeBookImageMC);//
				
				
				
				//BUTTONS
				FlxG.stage.addChild(ShopPageRightButtonMC);
				
				//BOOK BUTTONS
				addShopButtons();
				
				//BOOK INFORMATION
				
				//POSITIONS
				//BOOK IMAGES
				ShopBasicBookImageMC.x = 365;
				ShopFlameBookImageMC.x = 510;
				ShopGravityBookImageMC.x = 655;
				ShopKnockbackBookImageMC.x = 365;
				ShopLaserBookImageMC.x = 510;
				ShopMeleeBookImageMC.x = 655;
				
				ShopBasicBookImageMC.y = 102;
				ShopFlameBookImageMC.y = 102;
				ShopGravityBookImageMC.y = 102;
				ShopKnockbackBookImageMC.y = 265;
				ShopLaserBookImageMC.y = 265;
				ShopMeleeBookImageMC.y = 265;
				
				//BUTTONS
				ShopPageRightButtonMC.x = 762;
				
				ShopPageRightButtonMC.y = 247;
				
				//EVENTS
				ShopPageRightButtonMC.addEventListener(MouseEvent.CLICK, switchShopPage);
				
				//BOOK DETAILS
				ShopBasicBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopFlameBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopGravityBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopKnockbackBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopLaserBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopMeleeBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopBasicBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopFlameBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopGravityBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopKnockbackBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopLaserBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopMeleeBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
			}
			else if (currentPage == "B")
			{
				//BOOK IMAGES
				FlxG.stage.addChild(ShopMineBookImageMC);//PAGE TWO
				FlxG.stage.addChild(ShopRapidBookImageMC);//PAGE TWO
				FlxG.stage.addChild(ShopRocketBookImageMC);//PAGE TWO
				FlxG.stage.addChild(ShopShotgunBookImageMC);//PAGE TWO
				FlxG.stage.addChild(ShopPierceBookImageMC);//PAGE TWO
				FlxG.stage.addChild(ShopSpreadBookImageMC);//PAGE TWO
				
				//BUTTONS
				FlxG.stage.addChild(ShopPageLeftButtonMC);
				//FlxG.stage.addChild(ShopPageRightButtonMC);
				
				//BOOK BUTTONS
				addShopButtons();
				
				//BOOK INFORMATION
				
				//POSITIONS
				//BOOK IMAGES
				
				ShopMineBookImageMC.x = 365;//PAGE TWO
				ShopPierceBookImageMC.x = 510;//PAGE TWO
				ShopRapidBookImageMC.x = 655;//PAGE TWO
				ShopRocketBookImageMC.x = 365;//PAGE TWO
				ShopShotgunBookImageMC.x = 510;//PAGE TWO
				ShopSpreadBookImageMC.x = 655;//PAGE TWO
				
				ShopMineBookImageMC.y = 102;//PAGE TWO
				ShopPierceBookImageMC.y = 102;//PAGE TWO
				ShopRapidBookImageMC.y = 102;//PAGE TWO
				ShopRocketBookImageMC.y = 265;//PAGE TWO
				ShopShotgunBookImageMC.y = 265;//PAGE TWO
				ShopSpreadBookImageMC.y = 265;//PAGE TWO
				
				//BUTTONS
				ShopPageLeftButtonMC.x = 340;
				
				ShopPageLeftButtonMC.y = 247;
				
				//EVENTS
				ShopPageLeftButtonMC.addEventListener(MouseEvent.CLICK, switchShopPage);
				
				//BOOK DETAILS
				ShopMineBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopPierceBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopRapidBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopRocketBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopShotgunBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopSpreadBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopMineBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopPierceBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopRapidBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopRocketBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopShotgunBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopSpreadBookImageMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
			}
		}
		
		//ADDS SHOP BUTTONS TO THE CURRENT PAGES BOOKS. UNLOCK IF THE BOOK != OWNED ELSE EQUIP A AND B
		private function addShopButtons():void
		{
			///.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
			if (currentPage == "A")
			{
				if (equipmentOwned[0] == false)
				{
					FlxG.stage.addChild(ShopBasicUnlockMC);
					
					ShopBasicUnlockMC.x = 365;
					ShopBasicUnlockMC.y = 210;
					
					ShopBasicUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopBasicUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopBasicUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[0] == true)
				{
					FlxG.stage.addChild(ShopBasicEquipAMC);
					FlxG.stage.addChild(ShopBasicEquipBMC);
					
					ShopBasicEquipAMC.x = 365;
					ShopBasicEquipAMC.y = 210;
					ShopBasicEquipBMC.x = 430;
					ShopBasicEquipBMC.y = 210;
				
					
					ShopBasicEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopBasicEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopBasicEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopBasicEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopBasicEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopBasicEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				
				
				if (equipmentOwned[1] == false)
				{
					FlxG.stage.addChild(ShopFlameUnlockMC);
					
					ShopFlameUnlockMC.x = 510;
					ShopFlameUnlockMC.y = 210;
					
					ShopFlameUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopFlameUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopFlameUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[1] == true)
				{
					FlxG.stage.addChild(ShopFlameEquipAMC);
					FlxG.stage.addChild(ShopFlameEquipBMC);	
					
					ShopFlameEquipAMC.x = 510;
					ShopFlameEquipAMC.y = 210;
					ShopFlameEquipBMC.x = 575;
					ShopFlameEquipBMC.y = 210;
					
					ShopFlameEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopFlameEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopFlameEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopFlameEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopFlameEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopFlameEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[2] == false)
				{
					FlxG.stage.addChild(ShopGravityUnlockMC);
					
					ShopGravityUnlockMC.x = 655;
					ShopGravityUnlockMC.y = 210;
					
					ShopGravityUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopGravityUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopGravityUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[2] == true)
				{
					FlxG.stage.addChild(ShopGravityEquipAMC);
					FlxG.stage.addChild(ShopGravityEquipBMC);
					
					ShopGravityEquipAMC.x = 655;
					ShopGravityEquipAMC.y = 210;
					ShopGravityEquipBMC.x = 720;
					ShopGravityEquipBMC.y = 210;
					
					ShopGravityEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopGravityEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopGravityEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopGravityEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopGravityEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopGravityEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				if (equipmentOwned[3] == false)
				{
					FlxG.stage.addChild(ShopKnockbackUnlockMC);
					
					ShopKnockbackUnlockMC.x = 365;
					ShopKnockbackUnlockMC.y = 370;
					
					ShopKnockbackUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopKnockbackUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopKnockbackUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[3] == true)
				{
					FlxG.stage.addChild(ShopKnockbackEquipAMC);
					FlxG.stage.addChild(ShopKnockbackEquipBMC);
					
					ShopKnockbackEquipAMC.x = 365;
					ShopKnockbackEquipAMC.y = 370;
					ShopKnockbackEquipBMC.x = 430;
					ShopKnockbackEquipBMC.y = 370;
					
					ShopKnockbackEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopKnockbackEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopKnockbackEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopKnockbackEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopKnockbackEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopKnockbackEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[4] == false)
				{
					FlxG.stage.addChild(ShopLaserUnlockMC);
					
					ShopLaserUnlockMC.x = 510;
					ShopLaserUnlockMC.y = 370;
					
					ShopLaserUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopLaserUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopLaserUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[4] == true)
				{
					FlxG.stage.addChild(ShopLaserEquipAMC);
					FlxG.stage.addChild(ShopLaserEquipBMC);
					
					ShopLaserEquipAMC.x = 510;
					ShopLaserEquipAMC.y = 370;
					ShopLaserEquipBMC.x = 575;
					ShopLaserEquipBMC.y = 370;
					
					ShopLaserEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopLaserEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopLaserEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopLaserEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopLaserEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopLaserEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[5] == false)
				{
					FlxG.stage.addChild(ShopMeleeUnlockMC);
					
					ShopMeleeUnlockMC.x = 655;
					ShopMeleeUnlockMC.y = 370;
					
					ShopMeleeUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopMeleeUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopMeleeUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[5] == true)
				{
					FlxG.stage.addChild(ShopMeleeEquipAMC);
					FlxG.stage.addChild(ShopMeleeEquipBMC);
					
					ShopMeleeEquipAMC.x = 655;
					ShopMeleeEquipAMC.y = 370;
					ShopMeleeEquipBMC.x = 720;
					ShopMeleeEquipBMC.y = 370;
					
					ShopMeleeEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopMeleeEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopMeleeEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopMeleeEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopMeleeEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopMeleeEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				
				
				
			}
			else if (currentPage == "B")
			{
				if (equipmentOwned[6] == false)
				{
					FlxG.stage.addChild(ShopMineUnlockMC);
					
					ShopMineUnlockMC.x = 365;
					ShopMineUnlockMC.y = 210;
					
					ShopMineUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopMineUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopMineUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[6] == true)
				{
					FlxG.stage.addChild(ShopMineEquipAMC);
					FlxG.stage.addChild(ShopMineEquipBMC);
					
					ShopMineEquipAMC.x = 365;
					ShopMineEquipAMC.y = 210;
					ShopMineEquipBMC.x = 430;
					ShopMineEquipBMC.y = 210;
					
					ShopMineEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopMineEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopMineEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopMineEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopMineEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopMineEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[7] == false)
				{
					FlxG.stage.addChild(ShopPierceUnlockMC);
					
					ShopPierceUnlockMC.x = 510;
					ShopPierceUnlockMC.y = 210;
					
					ShopPierceUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopPierceUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopPierceUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[7] == true)
				{
					FlxG.stage.addChild(ShopPierceEquipAMC);
					FlxG.stage.addChild(ShopPierceEquipBMC);
					
					ShopPierceEquipAMC.x = 510;
					ShopPierceEquipAMC.y = 210;
					ShopPierceEquipBMC.x = 575;
					ShopPierceEquipBMC.y = 210;
					
					ShopPierceEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopPierceEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopPierceEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopPierceEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopPierceEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopPierceEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[8] == false)
				{
					FlxG.stage.addChild(ShopRapidUnlockMC);
					
					ShopRapidUnlockMC.x = 655;
					ShopRapidUnlockMC.y = 210;
					
					ShopRapidUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopRapidUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopRapidUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[8] == true)
				{
					FlxG.stage.addChild(ShopRapidEquipAMC);
					FlxG.stage.addChild(ShopRapidEquipBMC);
					
					ShopRapidEquipAMC.x = 655;
					ShopRapidEquipAMC.y = 210;
					ShopRapidEquipBMC.x = 720;
					ShopRapidEquipBMC.y = 210;
					
					ShopRapidEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopRapidEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopRapidEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopRapidEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopRapidEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopRapidEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[9] == false)
				{
					FlxG.stage.addChild(ShopRocketUnlockMC);
					
					ShopRocketUnlockMC.x = 365;
					ShopRocketUnlockMC.y = 370;
					
					ShopRocketUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopRocketUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopRocketUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[9] == true)
				{
					FlxG.stage.addChild(ShopRocketEquipAMC);
					FlxG.stage.addChild(ShopRocketEquipBMC);
					
					ShopRocketEquipAMC.x = 365;
					ShopRocketEquipAMC.y = 370;
					ShopRocketEquipBMC.x = 430;
					ShopRocketEquipBMC.y = 370;
					
					ShopRocketEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopRocketEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopRocketEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopRocketEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopRocketEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopRocketEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[10] == false)
				{
					FlxG.stage.addChild(ShopShotgunUnlockMC);
					
					ShopShotgunUnlockMC.x = 510;
					ShopShotgunUnlockMC.y = 370;
					
					ShopShotgunUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopShotgunUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopShotgunUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[10] == true)
				{
					FlxG.stage.addChild(ShopShotgunEquipAMC);
					FlxG.stage.addChild(ShopShotgunEquipBMC);
					
					ShopShotgunEquipAMC.x = 510;
					ShopShotgunEquipAMC.y = 370;
					ShopShotgunEquipBMC.x = 575;
					ShopShotgunEquipBMC.y = 370;
					
					ShopShotgunEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopShotgunEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopShotgunEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopShotgunEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopShotgunEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopShotgunEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[11] == false)
				{
					FlxG.stage.addChild(ShopSpreadUnlockMC);
					
					ShopSpreadUnlockMC.x = 655;
					ShopSpreadUnlockMC.y = 370;
					
					ShopSpreadUnlockMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopSpreadUnlockMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopSpreadUnlockMC.addEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[11] == true)
				{
					FlxG.stage.addChild(ShopSpreadEquipAMC);
					FlxG.stage.addChild(ShopSpreadEquipBMC);
					
					ShopSpreadEquipAMC.x = 655;
					ShopSpreadEquipAMC.y = 370;
					ShopSpreadEquipBMC.x = 720;
					ShopSpreadEquipBMC.y = 370;
					
					ShopSpreadEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopSpreadEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopSpreadEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopSpreadEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopSpreadEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
					ShopSpreadEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				}
			}
		}
		
		//REMOVES SHOP BUTTONS TO THE CURRENT PAGES BOOKS. UNLOCK IF THE BOOK != OWNED ELSE EQUIP A AND B
		private function removeShopButtons():void
		{
			if (currentPage == "A")
			{
				if (equipmentOwned[0] == false)
				{
					FlxG.stage.removeChild(ShopBasicUnlockMC);
					
					ShopBasicUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopBasicUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopBasicUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[0] == true)
				{
					FlxG.stage.removeChild(ShopBasicEquipAMC);
					FlxG.stage.removeChild(ShopBasicEquipBMC);
					
					ShopBasicEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopBasicEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopBasicEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopBasicEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopBasicEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopBasicEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				
				if (equipmentOwned[1] == false)
				{
					FlxG.stage.removeChild(ShopFlameUnlockMC);
					
					ShopFlameUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopFlameUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopFlameUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[1] == true)
				{
					FlxG.stage.removeChild(ShopFlameEquipAMC);
					FlxG.stage.removeChild(ShopFlameEquipBMC);	
					
					ShopFlameEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopFlameEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopFlameEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopFlameEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopFlameEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopFlameEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[2] == false)
				{
					FlxG.stage.removeChild(ShopGravityUnlockMC);
					
					ShopGravityUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopGravityUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopGravityUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[2] == true)
				{
					FlxG.stage.removeChild(ShopGravityEquipAMC);
					FlxG.stage.removeChild(ShopGravityEquipBMC);
					
					ShopGravityEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopGravityEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopGravityEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopGravityEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopGravityEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopGravityEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				if (equipmentOwned[3] == false)
				{
					FlxG.stage.removeChild(ShopKnockbackUnlockMC);
					
					ShopKnockbackUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopKnockbackUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopKnockbackUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[3] == true)
				{
					FlxG.stage.removeChild(ShopKnockbackEquipAMC);
					FlxG.stage.removeChild(ShopKnockbackEquipBMC);
					
					ShopKnockbackEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopKnockbackEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopKnockbackEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopKnockbackEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopKnockbackEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopKnockbackEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				if (equipmentOwned[4] == false)
				{
					FlxG.stage.removeChild(ShopLaserUnlockMC);
					
					ShopLaserUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopLaserUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopLaserUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[4] == true)
				{
					FlxG.stage.removeChild(ShopLaserEquipAMC);
					FlxG.stage.removeChild(ShopLaserEquipBMC);
					
					ShopLaserEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopLaserEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopLaserEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopLaserEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopLaserEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopLaserEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[5]== false)
				{
					FlxG.stage.removeChild(ShopMeleeUnlockMC);
					
					ShopMeleeUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopMeleeUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopMeleeUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[5] == true)
				{
					FlxG.stage.removeChild(ShopMeleeEquipAMC);
					FlxG.stage.removeChild(ShopMeleeEquipBMC);
					
					ShopMeleeEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopMeleeEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopMeleeEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopMeleeEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopMeleeEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopMeleeEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				
				
				
			}
			else if (currentPage == "B")
			{
				if (equipmentOwned[6] == false)
				{
					FlxG.stage.removeChild(ShopMineUnlockMC);
					
					ShopMineUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopMineUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopMineUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[6] == true)
				{
					FlxG.stage.removeChild(ShopMineEquipAMC);
					FlxG.stage.removeChild(ShopMineEquipBMC);
					
					ShopMineEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopMineEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopMineEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopMineEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopMineEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopMineEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[7] == false)
				{
					FlxG.stage.removeChild(ShopPierceUnlockMC);
					
					ShopPierceUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopPierceUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopPierceUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[7] == true)
				{
					FlxG.stage.removeChild(ShopPierceEquipAMC);
					FlxG.stage.removeChild(ShopPierceEquipBMC);
					
					ShopPierceEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopPierceEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopPierceEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopPierceEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopPierceEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopPierceEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[8] == false)
				{
					FlxG.stage.removeChild(ShopRapidUnlockMC);
					
					ShopRapidUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopRapidUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopRapidUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[8] == true)
				{
					FlxG.stage.removeChild(ShopRapidEquipAMC);
					FlxG.stage.removeChild(ShopRapidEquipBMC);
					
					ShopRapidEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopRapidEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopRapidEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopRapidEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopRapidEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopRapidEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[9] == false)
				{
					FlxG.stage.removeChild(ShopRocketUnlockMC);
					
					ShopRocketUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopRocketUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopRocketUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[9] == true)
				{
					FlxG.stage.removeChild(ShopRocketEquipAMC);
					FlxG.stage.removeChild(ShopRocketEquipBMC);
					
					ShopRocketEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopRocketEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopRocketEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopRocketEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopRocketEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopRocketEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[10] == false)
				{
					FlxG.stage.removeChild(ShopShotgunUnlockMC);
					
					ShopShotgunUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopShotgunUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopShotgunUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[10] == true)
				{
					FlxG.stage.removeChild(ShopShotgunEquipAMC);
					FlxG.stage.removeChild(ShopShotgunEquipBMC);
					
					ShopShotgunEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopShotgunEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopShotgunEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopShotgunEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopShotgunEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopShotgunEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
				
				if (equipmentOwned[11] == false)
				{
					FlxG.stage.removeChild(ShopSpreadUnlockMC);
					
					ShopSpreadUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					//ShopSpreadUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					ShopSpreadUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				} 
				else if (equipmentOwned[11] == true)
				{
					FlxG.stage.removeChild(ShopSpreadEquipAMC);
					FlxG.stage.removeChild(ShopSpreadEquipBMC);
					
					ShopSpreadEquipAMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					ShopSpreadEquipBMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
					
					//ShopSpreadEquipAMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					//ShopSpreadEquipBMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
					
					ShopSpreadEquipAMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
					ShopSpreadEquipBMC.removeEventListener(MouseEvent.CLICK, equipBook);//e
				}
			}
		}
		
		//IF A BOOK IS PURCHASED THEN THE UNLOCK BUTTON IS REPLACED WITH THE EQUIP A AND B
		private function updateBookDetails(TomeBrought:String):void
		{
			if (TomeBrought == "Basic")
			{
				FlxG.stage.removeChild(ShopBasicUnlockMC);
				
				ShopBasicUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopBasicUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopBasicUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				//Update details
			
				FlxG.stage.addChild(ShopBasicEquipAMC);
				FlxG.stage.addChild(ShopBasicEquipBMC);
				
				ShopBasicEquipAMC.x = 365;//655;
				ShopBasicEquipAMC.y = 210;//370;
				ShopBasicEquipBMC.x = 430;//720;
				ShopBasicEquipBMC.y = 210;//370;
				
				ShopBasicEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopBasicEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopBasicEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopBasicEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopBasicEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopBasicEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			if (TomeBrought == "Flame")
			{
				FlxG.stage.removeChild(ShopFlameUnlockMC);
				
				ShopFlameUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopFlameUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopFlameUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);
			
				FlxG.stage.addChild(ShopFlameEquipAMC);
				FlxG.stage.addChild(ShopFlameEquipBMC);	
				
				ShopFlameEquipAMC.x = 510;
				ShopFlameEquipAMC.y = 210;
				ShopFlameEquipBMC.x = 575;
				ShopFlameEquipBMC.y = 210;
				
				ShopFlameEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopFlameEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopFlameEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopFlameEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopFlameEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopFlameEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			if (TomeBrought == "Gravity")
			{
				FlxG.stage.removeChild(ShopGravityUnlockMC);
				
				ShopGravityUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopGravityUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopGravityUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				//Update details
				
				FlxG.stage.addChild(ShopGravityEquipAMC);
				FlxG.stage.addChild(ShopGravityEquipBMC);
				
				ShopGravityEquipAMC.x = 655;
				ShopGravityEquipAMC.y = 210;
				ShopGravityEquipBMC.x = 720;
				ShopGravityEquipBMC.y = 210;
				
				ShopGravityEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopGravityEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopGravityEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopGravityEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopGravityEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopGravityEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			if (TomeBrought == "Knockback")
			{
				
				ShopKnockbackUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopKnockbackUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopKnockbackUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				FlxG.stage.removeChild(ShopKnockbackUnlockMC);
				
				//Update details
				FlxG.stage.addChild(ShopKnockbackEquipAMC);
				FlxG.stage.addChild(ShopKnockbackEquipBMC);
				
				ShopKnockbackEquipAMC.x = 365;
				ShopKnockbackEquipAMC.y = 370;
				ShopKnockbackEquipBMC.x = 430;
				ShopKnockbackEquipBMC.y = 370;
				
				ShopKnockbackEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopKnockbackEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopKnockbackEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopKnockbackEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopKnockbackEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopKnockbackEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			if (TomeBrought == "Laser")
			{
				FlxG.stage.removeChild(ShopLaserUnlockMC);
				
				ShopLaserUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopLaserUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopLaserUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				//Update details
			
				FlxG.stage.addChild(ShopLaserEquipAMC);
				FlxG.stage.addChild(ShopLaserEquipBMC);
				
				ShopLaserEquipAMC.x = 510;
				ShopLaserEquipAMC.y = 370;
				ShopLaserEquipBMC.x = 575;
				ShopLaserEquipBMC.y = 370;
				
				ShopLaserEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopLaserEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopLaserEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopLaserEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopLaserEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopLaserEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			if (TomeBrought == "Melee")
			{
				FlxG.stage.removeChild(ShopMeleeUnlockMC);
				
				ShopMeleeUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopMeleeUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopMeleeUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				//Update details
			
				FlxG.stage.addChild(ShopMeleeEquipAMC);
				FlxG.stage.addChild(ShopMeleeEquipBMC);
				
				ShopMeleeEquipAMC.x = 655;
				ShopMeleeEquipAMC.y = 370;
				ShopMeleeEquipBMC.x = 720;
				ShopMeleeEquipBMC.y = 370;
				
				ShopMeleeEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopMeleeEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopMeleeEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopMeleeEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopMeleeEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopMeleeEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			
			
			if (TomeBrought == "Mine")
			{
				FlxG.stage.removeChild(ShopMineUnlockMC);
				
				ShopMineUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopMineUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopMineUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				//Update details
			
				FlxG.stage.addChild(ShopMineEquipAMC);
				FlxG.stage.addChild(ShopMineEquipBMC);
				
				ShopMineEquipAMC.x = 365;
				ShopMineEquipAMC.y = 210;
				ShopMineEquipBMC.x = 430;
				ShopMineEquipBMC.y = 210;
				
				ShopMineEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopMineEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopMineEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopMineEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopMineEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopMineEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			if (TomeBrought == "Pierce")
			{
				FlxG.stage.removeChild(ShopPierceUnlockMC);
				
				ShopPierceUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopPierceUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopPierceUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				//Update details
			
				FlxG.stage.addChild(ShopPierceEquipAMC);
				FlxG.stage.addChild(ShopPierceEquipBMC);
				
				ShopPierceEquipAMC.x = 510;
				ShopPierceEquipAMC.y = 210;
				ShopPierceEquipBMC.x = 575;
				ShopPierceEquipBMC.y = 210;
				
				ShopPierceEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopPierceEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopPierceEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopPierceEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopPierceEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopPierceEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			if (TomeBrought == "Rapid")
			{
				FlxG.stage.removeChild(ShopRapidUnlockMC);
				
				ShopRapidUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopRapidUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopRapidUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				//Update details
			
				FlxG.stage.addChild(ShopRapidEquipAMC);
				FlxG.stage.addChild(ShopRapidEquipBMC);
				
				ShopRapidEquipAMC.x = 655;
				ShopRapidEquipAMC.y = 210;
				ShopRapidEquipBMC.x = 720;
				ShopRapidEquipBMC.y = 210;
				
				ShopRapidEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopRapidEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopRapidEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopRapidEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopRapidEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopRapidEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			if (TomeBrought == "Rocket")
			{
				FlxG.stage.removeChild(ShopRocketUnlockMC);
				
				ShopRocketUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopRocketUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopRocketUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				//Update details
			
				FlxG.stage.addChild(ShopRocketEquipAMC);
				FlxG.stage.addChild(ShopRocketEquipBMC);
				
				ShopRocketEquipAMC.x = 365;
				ShopRocketEquipAMC.y = 370;
				ShopRocketEquipBMC.x = 430;
				ShopRocketEquipBMC.y = 370;
				
				ShopRocketEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopRocketEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopRocketEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopRocketEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopRocketEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopRocketEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			if (TomeBrought == "Shotgun")
			{
				FlxG.stage.removeChild(ShopShotgunUnlockMC);
				
				ShopShotgunUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopShotgunUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopShotgunUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				//Update details
			
				FlxG.stage.addChild(ShopShotgunEquipAMC);
				FlxG.stage.addChild(ShopShotgunEquipBMC);
				
				ShopShotgunEquipAMC.x = 510;
				ShopShotgunEquipAMC.y = 370;
				ShopShotgunEquipBMC.x = 575;
				ShopShotgunEquipBMC.y = 370;
				
				ShopShotgunEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopShotgunEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopShotgunEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopShotgunEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopShotgunEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopShotgunEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
			
			if (TomeBrought == "Spread")
			{
				FlxG.stage.removeChild(ShopSpreadUnlockMC);
				
				ShopSpreadUnlockMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				//ShopSpreadUnlockMC.removeEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				ShopSpreadUnlockMC.removeEventListener(MouseEvent.CLICK, buyBook);//b
				
				//Update details
			
				FlxG.stage.addChild(ShopSpreadEquipAMC);
				FlxG.stage.addChild(ShopSpreadEquipBMC);
				
				ShopSpreadEquipAMC.x = 655;
				ShopSpreadEquipAMC.y = 370;
				ShopSpreadEquipBMC.x = 720;
				ShopSpreadEquipBMC.y = 370;
				
				ShopSpreadEquipAMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopSpreadEquipBMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//ShopSpreadEquipAMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				//ShopSpreadEquipBMC.addEventListener(MouseEvent.ROLL_OUT, removeShopBookDetails);
				
				ShopSpreadEquipAMC.addEventListener(MouseEvent.CLICK, equipBook);//e
				ShopSpreadEquipBMC.addEventListener(MouseEvent.CLICK, equipBook);//e
			}
		}
		
		//IF UNLOCK IS CLICKED AND THE PLAYER HAS ENOUGH GOLD TO BUY IT THEN BOOKOWNED = TRUE. FOLLOW WITH UPDATEBOOKDETAILS()
		private function buyBook(e:MouseEvent):void
		{
			//equipmentOwned[0]
			if (e.target == ShopBasicUnlockMC && currentGold >= equipmentCost[0])
			{
				currentGold -= equipmentCost[0];
				equipmentOwned[0] = true;
				updateBookDetails("Basic");
			}
			if (e.target == ShopFlameUnlockMC && currentGold >= equipmentCost[1])
			{
				currentGold -= equipmentCost[1];
				equipmentOwned[1] = true;
				updateBookDetails("Flame");
			}
			if (e.target == ShopGravityUnlockMC && currentGold >= equipmentCost[2])
			{
				currentGold -= equipmentCost[2];
				equipmentOwned[2] = true;
				updateBookDetails("Gravity");
			}
			if (e.target == ShopKnockbackUnlockMC && currentGold >= equipmentCost[3])
			{
				currentGold -= equipmentCost[3];
				equipmentOwned[3] = true;
				updateBookDetails("Knockback");
			}
			if (e.target == ShopLaserUnlockMC && currentGold >= equipmentCost[4])
			{
				currentGold -= equipmentCost[4];
				equipmentOwned[4] = true;
				updateBookDetails("Laser");
			}
			if (e.target == ShopMeleeUnlockMC && currentGold >= equipmentCost[5])
			{
				currentGold -= equipmentCost[5];
				equipmentOwned[5] = true;
				updateBookDetails("Melee");
			}
			if (e.target == ShopMineUnlockMC && currentGold >= equipmentCost[6])
			{
				currentGold -= equipmentCost[6];
				equipmentOwned[6] = true;
				updateBookDetails("Mine");
			}
			
			if (e.target == ShopPierceUnlockMC && currentGold >= equipmentCost[7])
			{
				currentGold -= equipmentCost[7];
				equipmentOwned[7] = true;
				updateBookDetails("Pierce");
			}
			if (e.target == ShopRapidUnlockMC && currentGold >= equipmentCost[8])
			{
				currentGold -= equipmentCost[8];
				equipmentOwned[8] = true;
				updateBookDetails("Rapid");
			}
			if (e.target == ShopRocketUnlockMC && currentGold >= equipmentCost[9])
			{
				currentGold -= equipmentCost[9];
				equipmentOwned[9] = true;
				updateBookDetails("Rocket");
			}
			if (e.target == ShopShotgunUnlockMC && currentGold >= equipmentCost[10])
			{
				currentGold -= equipmentCost[10];
				equipmentOwned[10] = true;
				updateBookDetails("Shotgun");
			}
			if (e.target == ShopSpreadUnlockMC && currentGold >= equipmentCost[11])
			{
				currentGold -= equipmentCost[11];
				equipmentOwned[11] = true;
				updateBookDetails("Spread");
			}
			
		}
		
		//IF THE A OR B EQUIP BUTTONS ARE PUSHED THEN UPDATE PLAYER EQUIP TEXT FIELDS
		private function equipBook(e:MouseEvent):void
		{
			//BASIC/0
			if (e.target == ShopBasicEquipAMC)
			{
				primaryTitle = "Indoles";
				primaryStyle = "Basic";
				primaryId = 0;
				
				primaryExp = equipmentExp[0];//BasicExp;
				primaryExpNeeded = BasicExpNeeded[equipmentLevels[0]];
				//trace(BasicExpNeeded[equipmentLevels[0]]);
				primaryLevel = equipmentLevels[0];//BasicLevel;
				primaryLevelMax = equipmentLevelMax[0];//BasicLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Indoles";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Basic";
			}
			else if (e.target == ShopBasicEquipBMC)
			{
				secondaryTitle = "Indoles";
				secondaryStyle = "Basic";
				secondaryId = 0;
				
				secondaryExp = equipmentExp[0];//BasicExp;
				secondaryExpNeeded = BasicExpNeeded[equipmentLevels[0]];
				secondaryLevel = equipmentLevels[0];//BasicLevel;
				secondaryLevelMax = equipmentLevelMax[0];//BasicLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Indoles";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Basic";
			}
			
			//FLAME/1
			if (e.target == ShopFlameEquipAMC)
			{
				primaryTitle = "Ignis";
				primaryStyle = "Flame";
				primaryId = 1;
				
				primaryExp = equipmentExp[1];//FlameExp;
				primaryExpNeeded = FlameExpNeeded[equipmentLevels[1]];
				primaryLevel = equipmentLevels[1];//FlameLevel;
				primaryLevelMax = equipmentLevelMax[1];//FlameLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Ignis";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Flame";
			}
			else if (e.target == ShopFlameEquipBMC)
			{
				secondaryTitle = "Ingis";
				secondaryStyle = "Flame";
				secondaryId = 1;
				
				secondaryExp = equipmentExp[1];//FlameExp;
				secondaryExpNeeded = FlameExpNeeded[equipmentLevels[1]];
				secondaryLevel = equipmentLevels[1];//FlameLevel;
				secondaryLevelMax = equipmentLevelMax[1];//FlameLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Ingis";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Flame";
			}
			//GRAVITY/2
			if (e.target == ShopGravityEquipAMC)
			{
				primaryTitle = "Sacoma";
				primaryStyle = "Gravity";
				primaryId = 2;
				
				primaryExp = equipmentExp[2];//GravityExp;
				primaryExpNeeded = GravityExpNeeded[equipmentLevels[2]];
				primaryLevel = equipmentLevels[2];//GravityLevel;
				primaryLevelMax = equipmentLevelMax[2];//GravityLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Sacoma";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Gravity";
			}
			else if (e.target == ShopGravityEquipBMC)
			{
				secondaryTitle = "Sacoma";
				secondaryStyle = "Gravity";
				secondaryId = 2;
				
				secondaryExp = equipmentExp[2];//GravityExp;
				secondaryExpNeeded = GravityExpNeeded[equipmentLevels[2]];
				secondaryLevel = equipmentLevels[2];//GravityLevel;
				secondaryLevelMax = equipmentLevelMax[2];//GravityLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Sacoma";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Gravity";
			}
			//KNOCKBACK/3
			if (e.target == ShopKnockbackEquipAMC)
			{
				primaryTitle = "Vis";
				primaryStyle = "Knockback";
				primaryId = 3;
				
				primaryExp = equipmentExp[3];//KnockbackExp;
				primaryExpNeeded = KnockbackExpNeeded[equipmentLevels[3]];
				primaryLevel = equipmentLevels[3];//KnockbackLevel;
				primaryLevelMax = equipmentLevelMax[3];//KnockbackLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Vis";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Knockback";
				
			}
			else if (e.target == ShopKnockbackEquipBMC)
			{
				secondaryTitle = "Vis";
				secondaryStyle = "Knockback";
				secondaryId = 3;
				
				secondaryExp = equipmentExp[3];//KnockbackExp;
				secondaryExpNeeded = KnockbackExpNeeded[equipmentLevels[3]];
				secondaryLevel = equipmentLevels[3];//KnockbackLevel;
				secondaryLevelMax = equipmentLevelMax[3];//KnockbackLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Vis";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Knockback";
			}
			//LASER/4
			if (e.target == ShopLaserEquipAMC)
			{
				primaryTitle = "Stella";
				primaryStyle = "Laser";
				primaryId = 4;
				
				primaryExp = equipmentExp[4];//LaserExp;
				primaryExpNeeded = LaserExpNeeded[equipmentLevels[4]];
				primaryLevel = equipmentLevels[4];//LaserLevel;
				primaryLevelMax = equipmentLevelMax[4];//LaserLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Stella";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Laser";
			}
			else if (e.target == ShopLaserEquipBMC)
			{
				secondaryTitle = "Stella";
				secondaryStyle = "Laser";
				secondaryId = 4;
				
				secondaryExp = equipmentExp[4];//LaserExp;
				secondaryExpNeeded = LaserExpNeeded[equipmentLevels[4]];
				secondaryLevel = equipmentLevels[4];//LaserLevel;
				secondaryLevelMax = equipmentLevelMax[4];//LaserLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Stella";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Laser";
			}
			//MELEE/5
			if (e.target == ShopMeleeEquipAMC)
			{
				primaryTitle = "Ensis";
				primaryStyle = "Melee";
				primaryId = 5;
				
				primaryExp = equipmentExp[5];//MeleeExp;
				primaryExpNeeded = MeleeExpNeeded[equipmentLevels[5]];
				primaryLevel = equipmentLevels[5];//MeleeLevel;
				primaryLevelMax = equipmentLevelMax[5];//MeleeLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Ensis";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Melee";
			}
			else if (e.target == ShopMeleeEquipBMC)
			{
				secondaryTitle = "Ensis";
				secondaryStyle = "Melee";
				secondaryId = 5;
				
				secondaryExp = equipmentExp[5];//MeleeExp;
				secondaryExpNeeded = MeleeExpNeeded[equipmentLevels[5]];
				secondaryLevel = equipmentLevels[5];//MeleeLevel;
				secondaryLevelMax = equipmentLevelMax[5];//MeleeLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Ensis";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Melee";
			}
			//MINE/6
			if (e.target == ShopMineEquipAMC)
			{
				primaryTitle = "Decipula";
				primaryStyle = "Mine";
				primaryId = 6;
				
				primaryExp = equipmentExp[6];//MineExp;
				primaryExpNeeded = MineExpNeeded[equipmentLevels[6]];
				primaryLevel = equipmentLevels[6];//MineLevel;
				primaryLevelMax = equipmentLevelMax[6];//MineLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Decipula";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Mine";
			}
			else if (e.target == ShopMineEquipBMC)
			{
				secondaryTitle = "Decipula";
				secondaryStyle = "Mine";
				secondaryId = 6;
				
				secondaryExp = equipmentExp[6];//MineExp;
				secondaryExpNeeded = MineExpNeeded[equipmentLevels[6]];
				secondaryLevel = equipmentLevels[6];//MineLevel;
				secondaryLevelMax = equipmentLevelMax[6];//MineLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Decipula";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Mine";
			}
			
			//PIERCE/7
			if (e.target == ShopPierceEquipAMC)
			{
				primaryTitle = "Lancea";
				primaryStyle = "Pierce";
				primaryId = 7;
				
				primaryExp = equipmentExp[7];//PierceExp;
				primaryExpNeeded = PierceExpNeeded[equipmentLevels[7]];
				primaryLevel = equipmentLevels[7];//PierceLevel;
				primaryLevelMax = equipmentLevelMax[7];//PierceLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Lancea";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Pierce";
			}
			else if (e.target == ShopPierceEquipBMC)
			{
				secondaryTitle = "Lancea";
				secondaryStyle = "Pierce";
				secondaryId = 7;
				
				secondaryExp = equipmentExp[7];//PierceExp;
				secondaryExpNeeded = PierceExpNeeded[equipmentLevels[7]];
				secondaryLevel = equipmentLevels[7];//PierceLevel;
				secondaryLevelMax = equipmentLevelMax[7];//PierceLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Lancea";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Pierce";
			}
			//RAPID/8
			if (e.target == ShopRapidEquipAMC)
			{
				primaryTitle = "Concitus";
				primaryStyle = "Rapid";
				primaryId = 8;
				
				primaryExp = equipmentExp[8];//RapidExp;
				primaryExpNeeded = RapidExpNeeded[equipmentLevels[8]];
				primaryLevel = equipmentLevels[8];//RapidLevel;
				primaryLevelMax = equipmentLevelMax[8];//RapidLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Concitus";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Rapid";
			}
			else if (e.target == ShopRapidEquipBMC)
			{
				secondaryTitle = "Concitus";
				secondaryStyle = "Rapid";
				secondaryId = 8;
				
				secondaryExp = equipmentExp[8];//RapidExp;
				secondaryExpNeeded = RapidExpNeeded[equipmentLevels[8]];
				secondaryLevel = equipmentLevels[8];//RapidLevel;
				secondaryLevelMax = equipmentLevelMax[8];//RapidLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Concitus";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Rapid";
			}
			//ROCKET/9
			if (e.target == ShopRocketEquipAMC)
			{
				primaryTitle = "Fragor";
				primaryStyle = "Rocket";
				primaryId = 9;
				
				primaryExp = equipmentExp[9];//RocketExp;
				primaryExpNeeded = RocketExpNeeded[equipmentLevels[9]];
				primaryLevel = equipmentLevels[9];//RocketLevel;
				primaryLevelMax = equipmentLevelMax[9];//RocketLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Fragor";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Rocket";
			}
			else if (e.target == ShopRocketEquipBMC)
			{
				secondaryTitle = "Fragor";
				secondaryStyle = "Rocket";
				secondaryId = 9;
				
				secondaryExp = equipmentExp[9];//RocketExp;
				secondaryExpNeeded = RocketExpNeeded[equipmentLevels[9]];
				secondaryLevel = equipmentLevels[9];//RocketLevel;
				secondaryLevelMax = equipmentLevelMax[9];//RocketLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Fragor";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Rocket";
			}
			//SHOTGUN/10
			if (e.target == ShopShotgunEquipAMC)
			{
				primaryTitle = "Differo";
				primaryStyle = "Shotgun";
				primaryId = 10;
				
				primaryExp = equipmentExp[10];//ShotgunExp;
				primaryExpNeeded = ShotgunExpNeeded[equipmentLevels[10]];
				primaryLevel = equipmentLevels[10];//ShotgunLevel;
				primaryLevelMax = equipmentLevelMax[10];//ShotgunLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Differo";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Shotgun";
			}
			else if (e.target == ShopShotgunEquipBMC)
			{
				secondaryTitle = "Differo";
				secondaryStyle = "Shotgun";
				secondaryId = 10;
				
				secondaryExp = equipmentExp[10];//ShotgunExp;
				secondaryExpNeeded = ShotgunExpNeeded[equipmentLevels[10]];
				secondaryLevel = equipmentLevels[10];//ShotgunLevel;
				secondaryLevelMax = equipmentLevelMax[10];//ShotgunLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Differo";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Shotgun";
			}
			//SPREAD/11
			if (e.target == ShopSpreadEquipAMC)
			{
				primaryTitle = "Hydrus";
				primaryStyle = "Spread";
				primaryId = 11;
				
				primaryExp = equipmentExp[11];//SpreadExp;
				primaryExpNeeded = SpreadExpNeeded[equipmentLevels[11]];
				primaryLevel = equipmentLevels[11];//SpreadLevel;
				primaryLevelMax = equipmentLevelMax[11];//SpreadLevelMax;
				
				ShopEquipANameContainerMC.ShopEquipANameText.text = "Hydrus";
				ShopEquipAStyleContainerMC.ShopEquipAStyleText.text = "Spread";
			}
			else if (e.target == ShopSpreadEquipBMC)
			{
				secondaryTitle = "Hydrus";
				secondaryStyle = "Spread";
				secondaryId = 11;
				
				secondaryExp = equipmentExp[11];//SpreadExp;
				secondaryExpNeeded = SpreadExpNeeded[equipmentLevels[11]];
				secondaryLevel = equipmentLevels[11];//SpreadLevel;
				secondaryLevelMax = equipmentLevelMax[11];//SpreadLevelMax;
				
				ShopEquipBNameContainerMC.ShopEquipBNameText.text = "Hydrus";
				ShopEquipBStyleContainerMC.ShopEquipBStyleText.text = "Spread";
			}
			
		}
		
		//IF THE LEFT OR RIGHT PAGE BUTTON IS PUSHED, REMOVE THE CURRENT PAGES BOOKS AND ADD THE NEW ONES WITH EVENTS
		private function switchShopPage(e:MouseEvent):void
		{
			removeShopButtons();
			if (currentPage == "A")
			{
				currentPage = "B";
				
				//BOOK IMAGES
				FlxG.stage.addChild(ShopMineBookImageMC);//PAGE TWO
				FlxG.stage.addChild(ShopPierceBookImageMC);//PAGE TWO
				FlxG.stage.addChild(ShopRapidBookImageMC);//PAGE TWO
				FlxG.stage.addChild(ShopRocketBookImageMC);//PAGE TWO
				FlxG.stage.addChild(ShopShotgunBookImageMC);//PAGE TWO
				FlxG.stage.addChild(ShopSpreadBookImageMC);//PAGE TWO
				
				FlxG.stage.removeChild(ShopBasicBookImageMC);
				FlxG.stage.removeChild(ShopFlameBookImageMC);
				FlxG.stage.removeChild(ShopGravityBookImageMC);
				FlxG.stage.removeChild(ShopKnockbackBookImageMC);
				FlxG.stage.removeChild(ShopLaserBookImageMC);
				FlxG.stage.removeChild(ShopMeleeBookImageMC);
				
				//BUTTON IMAGES
				FlxG.stage.addChild(ShopPageLeftButtonMC);
				FlxG.stage.removeChild(ShopPageRightButtonMC);
				
				//POSITIONS
				
				//BUTTONS
				ShopPageLeftButtonMC.x = 340;
				
				ShopPageLeftButtonMC.y = 247;
				
				//BOOK ICONS
				ShopMineBookImageMC.x = 365;//PAGE TWO
				ShopPierceBookImageMC.x = 510;//PAGE TWO
				ShopRapidBookImageMC.x = 655;//PAGE TWO
				ShopRocketBookImageMC.x = 365;//PAGE TWO
				ShopShotgunBookImageMC.x = 510;//PAGE TWO
				ShopSpreadBookImageMC.x = 655;//PAGE TWO
				
				ShopMineBookImageMC.y = 102;//PAGE TWO
				ShopPierceBookImageMC.y = 102;//PAGE TWO
				ShopRapidBookImageMC.y = 102;//PAGE TWO
				ShopRocketBookImageMC.y = 265;//PAGE TWO
				ShopShotgunBookImageMC.y = 265;//PAGE TWO
				ShopSpreadBookImageMC.y = 265;//PAGE TWO
				
				//EVENTS
				
				//BUTTONS
				ShopPageLeftButtonMC.addEventListener(MouseEvent.CLICK, switchShopPage);
				ShopPageRightButtonMC.removeEventListener(MouseEvent.CLICK, switchShopPage);
				
				//BOOK DETAILS
				ShopMineBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopPierceBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopRapidBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopRocketBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopShotgunBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopSpreadBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				ShopKnockbackBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopFlameBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopGravityBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopLaserBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopMeleeBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopBasicBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
			}
			else if (currentPage == "B")
			{
				currentPage = "A";
				
				//BOOK IMAGES
				FlxG.stage.addChild(ShopBasicBookImageMC);
				FlxG.stage.addChild(ShopFlameBookImageMC);
				FlxG.stage.addChild(ShopGravityBookImageMC);
				FlxG.stage.addChild(ShopKnockbackBookImageMC);
				FlxG.stage.addChild(ShopLaserBookImageMC);
				FlxG.stage.addChild(ShopMeleeBookImageMC);
				
				FlxG.stage.removeChild(ShopMineBookImageMC);//PAGE TWO
				FlxG.stage.removeChild(ShopPierceBookImageMC);//PAGE TWO
				FlxG.stage.removeChild(ShopRapidBookImageMC);//PAGE TWO
				FlxG.stage.removeChild(ShopRocketBookImageMC);//PAGE TWO
				FlxG.stage.removeChild(ShopShotgunBookImageMC);//PAGE TWO
				FlxG.stage.removeChild(ShopSpreadBookImageMC);//PAGE TWO
				
				//BUTTON IMAGES
				FlxG.stage.removeChild(ShopPageLeftButtonMC);
				FlxG.stage.addChild(ShopPageRightButtonMC);
				
				//BUTTON POSITIONS
				ShopPageRightButtonMC.x = 762;
				
				ShopPageRightButtonMC.y = 247;
				
				//BOOK IMAGES
				ShopBasicBookImageMC.x = 365;
				ShopFlameBookImageMC.x = 510;
				ShopGravityBookImageMC.x = 655;
				ShopKnockbackBookImageMC.x = 365;
				ShopLaserBookImageMC.x = 510;
				ShopMeleeBookImageMC.x = 655;
				
				ShopBasicBookImageMC.y = 102;
				ShopFlameBookImageMC.y = 102;
				ShopGravityBookImageMC.y = 102;
				ShopKnockbackBookImageMC.y = 265;
				ShopLaserBookImageMC.y = 265;
				ShopMeleeBookImageMC.y = 265;
				
				//EVENTS
				
				//BUTTONS
				ShopPageLeftButtonMC.removeEventListener(MouseEvent.CLICK, switchShopPage);
				ShopPageRightButtonMC.addEventListener(MouseEvent.CLICK, switchShopPage);
				
				//BOOK DETAILS
				ShopKnockbackBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopFlameBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopGravityBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopLaserBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopMeleeBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopBasicBookImageMC.addEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				ShopMineBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopPierceBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopRapidBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopRocketBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopShotgunBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopSpreadBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
			}
			addShopButtons();
		}
		
		//REMOVE WARNING AND ADD FIELDS IF A BOOK IS ROLLED OVER. REMOVE PREVIOUS BOOK IMAGE THEN ADD NEW BOOK DETAILS AND IMAGE.
		private function updateShopBookDetails(e:MouseEvent):void
		{
			
			if (detailsWarning == true)
			{
				detailsWarning = false;
				FlxG.stage.removeChild(ShopDetailsWarningContainerMC);
				
				FlxG.stage.addChild(ShopInfoDetailsContainerMC);  
				FlxG.stage.addChild(ShopInfoGoldContainerMC);
				FlxG.stage.addChild(ShopInfoTitleContainerMC);
				FlxG.stage.addChild(ShopInfoValuesContainerMC);
				FlxG.stage.addChild(ShopInfoGemMC);
			}
			
			if (currentBookDetail == "Basic")
			{
				FlxG.stage.removeChild(ShopUpgradeBasicIconLargeMC);
			}
			else if (currentBookDetail == "Flame")
			{
				FlxG.stage.removeChild(ShopUpgradeFlameIconLargeMC);
			}
			else if (currentBookDetail == "Gravity")
			{
				FlxG.stage.removeChild(ShopUpgradeGravityIconLargeMC);
			}
			else if (currentBookDetail == "Knockback")
			{
				FlxG.stage.removeChild(ShopUpgradeKnockbackIconLargeMC);
			}
			else if (currentBookDetail == "Laser")
			{
				FlxG.stage.removeChild(ShopUpgradeLaserIconLargeMC);
			}
			else if (currentBookDetail == "Melee")
			{
				FlxG.stage.removeChild(ShopUpgradeMeleeIconLargeMC);
			}
			else if (currentBookDetail == "Mine")
			{
				FlxG.stage.removeChild(ShopUpgradeMineIconLargeMC);
			}
			else if (currentBookDetail == "Pierce")
			{
				FlxG.stage.removeChild(ShopUpgradePierceIconLargeMC);
			}
			else if (currentBookDetail == "Rapid")
			{
				FlxG.stage.removeChild(ShopUpgradeRapidIconLargeMC);
			}
			else if (currentBookDetail == "Rocket")
			{
				FlxG.stage.removeChild(ShopUpgradeRocketIconLargeMC);
			}
			else if (currentBookDetail == "Shotgun")
			{
				FlxG.stage.removeChild(ShopUpgradeShotgunIconLargeMC);
			}
			else if (currentBookDetail == "Spread")
			{
				FlxG.stage.removeChild(ShopUpgradeSpreadIconLargeMC);
			}
				
			if (e.target == ShopBasicBookImageMC || e.target == ShopBasicUnlockMC || e.target == ShopBasicEquipAMC || e.target == ShopBasicEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeBasicIconLargeMC);
				ShopUpgradeBasicIconLargeMC.x = 350;
				ShopUpgradeBasicIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Indoles";
				if (equipmentOwned[0] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[0];//BasicCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[0];
				
				currentBookDetail = "Basic";
			}
			
			else if (e.target == ShopFlameBookImageMC || e.target == ShopFlameUnlockMC || e.target == ShopFlameEquipAMC || e.target == ShopFlameEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeFlameIconLargeMC);
				ShopUpgradeFlameIconLargeMC.x = 350;
				ShopUpgradeFlameIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Ignis";
				if (equipmentOwned[1] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[1];//FlameCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[1];
				
				currentBookDetail = "Flame";
			}
			else if (e.target == ShopGravityBookImageMC || e.target == ShopGravityUnlockMC || e.target == ShopGravityEquipAMC || e.target == ShopGravityEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeGravityIconLargeMC);
				ShopUpgradeGravityIconLargeMC.x = 350;
				ShopUpgradeGravityIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Sacoma";
				if (equipmentOwned[2] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[2];//GravityCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[2];
				
				currentBookDetail = "Gravity";
			}
			else if (e.target == ShopKnockbackBookImageMC || e.target == ShopKnockbackUnlockMC || e.target == ShopKnockbackEquipAMC || e.target == ShopKnockbackEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeKnockbackIconLargeMC);
				ShopUpgradeKnockbackIconLargeMC.x = 350;
				ShopUpgradeKnockbackIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Vis";
				if (equipmentOwned[3] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[3];//KnockbackCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[3];
				
				currentBookDetail = "Knockback";
			}
			else if (e.target == ShopLaserBookImageMC || e.target == ShopLaserUnlockMC || e.target == ShopLaserEquipAMC || e.target == ShopLaserEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeLaserIconLargeMC);
				ShopUpgradeLaserIconLargeMC.x = 350;
				ShopUpgradeLaserIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Stella";
				if (equipmentOwned[4] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[4];//LaserCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[4];
				
				currentBookDetail = "Laser";
			}
			else if (e.target == ShopMeleeBookImageMC || e.target == ShopMeleeUnlockMC || e.target == ShopMeleeEquipAMC || e.target == ShopMeleeEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeMeleeIconLargeMC);
				ShopUpgradeMeleeIconLargeMC.x = 350;
				ShopUpgradeMeleeIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Ensis";
				if (equipmentOwned[5] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[5];//MeleeCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[5];
				
				currentBookDetail = "Melee";
			}
			
			else if (e.target == ShopMineBookImageMC || e.target == ShopMineUnlockMC || e.target == ShopMineEquipAMC || e.target == ShopMineEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeMineIconLargeMC);
				ShopUpgradeMineIconLargeMC.x = 350;
				ShopUpgradeMineIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Decipula";
				if (equipmentOwned[6] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[6];//MineCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[6];
				
				currentBookDetail = "Mine";
			}
			else if (e.target == ShopPierceBookImageMC || e.target == ShopPierceUnlockMC || e.target == ShopPierceEquipAMC || e.target == ShopPierceEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradePierceIconLargeMC);
				ShopUpgradePierceIconLargeMC.x = 350;
				ShopUpgradePierceIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Lancea";
				if (equipmentOwned[7] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[7];//PierceCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[7];
				
				currentBookDetail = "Pierce";
			}
			else if (e.target == ShopRapidBookImageMC || e.target == ShopRapidUnlockMC || e.target == ShopRapidEquipAMC || e.target == ShopRapidEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeRapidIconLargeMC);
				ShopUpgradeRapidIconLargeMC.x = 350;
				ShopUpgradeRapidIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Concitus";
				if (equipmentOwned[8] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[8];//RapidCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[8];
				
				currentBookDetail = "Rapid";
			}
			else if (e.target == ShopRocketBookImageMC || e.target == ShopRocketUnlockMC || e.target == ShopRocketEquipAMC || e.target == ShopRocketEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeRocketIconLargeMC);
				ShopUpgradeRocketIconLargeMC.x = 350;
				ShopUpgradeRocketIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Fragor";
				if (equipmentOwned[9] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[9];//RocketCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[9];
				
				currentBookDetail = "Rocket";
			}
			else if (e.target == ShopShotgunBookImageMC || e.target == ShopShotgunUnlockMC || e.target == ShopShotgunEquipAMC || e.target == ShopShotgunEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeShotgunIconLargeMC);
				ShopUpgradeShotgunIconLargeMC.x = 350;
				ShopUpgradeShotgunIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Differo";
				if (equipmentOwned[10] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[10];//ShotgunCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[10];
				
				currentBookDetail = "Shotgun";
			}
			else if (e.target == ShopSpreadBookImageMC || e.target == ShopSpreadUnlockMC || e.target == ShopSpreadEquipAMC || e.target == ShopSpreadEquipBMC)
			{
				FlxG.stage.addChild(ShopUpgradeSpreadIconLargeMC);
				ShopUpgradeSpreadIconLargeMC.x = 350;
				ShopUpgradeSpreadIconLargeMC.y = 460;
				
				ShopInfoTitleContainerMC.ShopInfoTitleText.text = "Hydrus";
				if (equipmentOwned[11] == false)
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = equipmentCost[11];//SpreadCost;
				}
				else
				{
					ShopInfoGoldContainerMC.ShopInfoGoldText.text = "Owned";
				}
				ShopInfoValuesContainerMC.ShopInfoValuesText.text = equipmentInfo[11];
				
				currentBookDetail = "Spread";
			}
			
			//BOOK INFORMATION
			//ShopInfoBookIconContainerMC.x = 353;
			ShopInfoDetailsContainerMC.x = 490;
			ShopInfoGoldContainerMC.x = 703;
			ShopInfoTitleContainerMC.x = 488;
			ShopInfoValuesContainerMC.x = 668;
			ShopInfoGemMC.x = 666;
			
			//ShopInfoBookIconContainerMC.y = 463;
			ShopInfoDetailsContainerMC.y = 508;
			ShopInfoGoldContainerMC.y = 445;
			ShopInfoTitleContainerMC.y = 450;
			ShopInfoValuesContainerMC.y = 508;
			ShopInfoGemMC.y = 450;
			
		}
		
		//REMOVES THE SHOP CONTAINERS WHEN EXITING THE SHOP (BOOKS AND BOOK BUTTONS ARE REMOVED IN removeShopButtons()
		//AND BOOK DESCRIPTION ICONS ARE REMOVED IN removeShopBookDetails())
		private function removeShopBooks():void
		{
			if (currentPage == "A")
			{
				ShopPageRightButtonMC.removeEventListener(MouseEvent.CLICK, switchShopPage);
				FlxG.stage.removeChild(ShopPageRightButtonMC);
				
				//BOOK DETAILS
				ShopKnockbackBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopFlameBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopGravityBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopLaserBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopMeleeBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopBasicBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//BOOK IMAGES
				FlxG.stage.removeChild(ShopKnockbackBookImageMC);//
				FlxG.stage.removeChild(ShopFlameBookImageMC);//
				FlxG.stage.removeChild(ShopGravityBookImageMC);//
				FlxG.stage.removeChild(ShopLaserBookImageMC);//
				FlxG.stage.removeChild(ShopMeleeBookImageMC);//
				FlxG.stage.removeChild(ShopBasicBookImageMC);//
			}
			else if (currentPage == "B")
			{
				ShopPageLeftButtonMC.removeEventListener(MouseEvent.CLICK, switchShopPage);
				FlxG.stage.removeChild(ShopPageLeftButtonMC);
				
				//BOOK DETAILS
				ShopMineBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopPierceBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopRapidBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopRocketBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopShotgunBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				ShopSpreadBookImageMC.removeEventListener(MouseEvent.ROLL_OVER, updateShopBookDetails);
				
				//BOOK IMAGES
				FlxG.stage.removeChild(ShopMineBookImageMC);//PAGE TWO
				FlxG.stage.removeChild(ShopPierceBookImageMC);//PAGE TWO
				FlxG.stage.removeChild(ShopRapidBookImageMC);//PAGE TWO
				FlxG.stage.removeChild(ShopRocketBookImageMC);//PAGE TWO
				FlxG.stage.removeChild(ShopShotgunBookImageMC);//PAGE TWO
				FlxG.stage.removeChild(ShopSpreadBookImageMC);//PAGE TWO
			}
			
			if (detailsWarning == true)
			{
				FlxG.stage.removeChild(ShopDetailsWarningContainerMC);
			}
			else if (detailsWarning == false)
			{
				FlxG.stage.removeChild(ShopInfoDetailsContainerMC);
				FlxG.stage.removeChild(ShopInfoGoldContainerMC);
				FlxG.stage.removeChild(ShopInfoTitleContainerMC);
				FlxG.stage.removeChild(ShopInfoValuesContainerMC);
				FlxG.stage.removeChild(ShopInfoGemMC);
			}
			
			detailsWarning = true;
			
			FlxG.stage.removeChild(ShopBookContainerMC);
			FlxG.stage.removeChild(ShopInfoContainerMC);
			
			removeShopButtons();
			
			removeShopBookDetails();
			currentBookDetail = "None";
		}
		
		//REMOVE BOOK ICONS IN DESCRIPTION IF ANY ARE LOADED
		private function removeShopBookDetails():void
		{
			if (currentBookDetail == "Basic")
			{
				FlxG.stage.removeChild(ShopUpgradeBasicIconLargeMC);
			}
			else if (currentBookDetail == "Knockback")
			{
				FlxG.stage.removeChild(ShopUpgradeKnockbackIconLargeMC);
			}
			else if (currentBookDetail == "Flame")
			{
				FlxG.stage.removeChild(ShopUpgradeFlameIconLargeMC);
			}
			else if (currentBookDetail == "Gravity")
			{
				FlxG.stage.removeChild(ShopUpgradeGravityIconLargeMC);
			}
			else if (currentBookDetail == "Laser")
			{
				FlxG.stage.removeChild(ShopUpgradeLaserIconLargeMC);
			}
			else if (currentBookDetail == "Melee")
			{
				FlxG.stage.removeChild(ShopUpgradeMeleeIconLargeMC);
			}
			else if (currentBookDetail == "Mine")
			{
				FlxG.stage.removeChild(ShopUpgradeMineIconLargeMC);
			}
			else if (currentBookDetail == "Pierce")
			{
				FlxG.stage.removeChild(ShopUpgradePierceIconLargeMC);
			}
			else if (currentBookDetail == "Rapid")
			{
				FlxG.stage.removeChild(ShopUpgradeRapidIconLargeMC);
			}
			else if (currentBookDetail == "Rocket")
			{
				FlxG.stage.removeChild(ShopUpgradeRocketIconLargeMC);
			}
			else if (currentBookDetail == "Shotgun")
			{
				FlxG.stage.removeChild(ShopUpgradeShotgunIconLargeMC);
			}
			else if (currentBookDetail == "Spread")
			{
				FlxG.stage.removeChild(ShopUpgradeSpreadIconLargeMC);
			}
		}
		
		
		
		///////////////////////////////////////////////////////////////
		//////////////////////////OPTIONS//////////////////////////////
		///////////////////////////////////////////////////////////////
		
		private function loadOptionsPage():void
		{
			
		}
		
		
		///////////////////////////////////////////////////////////////
		///////////////////////LEVEL SELECT////////////////////////////
		///////////////////////////////////////////////////////////////
		private function switchToLevelPage(e:MouseEvent):void
		{
			if (currentSection == "Upgrades")
			{
				removeUpgradeEquipDetails();
				removeUpgradeButtons();
			}
			else if (currentSection == "Shop")
			{
				removeShopBooks();
			}
			loadLevelPage();
			
		}
		
		//ShopLevelNumberText
		//ShopLevelWavesText
		//ShopLevelDifficultyText
		
		private function loadLevelPage():void
		{
			currentSection = "Level";
			
			FlxG.stage.addChild(ShopLevelBackgroundContainerMC);
			FlxG.stage.addChild(ShopLevelAvaliableMC);
			FlxG.stage.addChild(ShopLevelClockContainerMC);
			//FlxG.stage.addChild(ShopLevelDescriptionContainerMC);
			//FlxG.stage.addChild(ShopLevelSelectContainerMC);
			FlxG.stage.addChild(ShopLevelPreviousButtonMC);
			FlxG.stage.addChild(ShopLevelPlayButtonMC);
			FlxG.stage.addChild(ShopLevelNextButtonMC);
			
			
			ShopLevelPreviousButtonMC.addEventListener(MouseEvent.CLICK, previousLevel);
			ShopLevelPlayButtonMC.addEventListener(MouseEvent.CLICK, playLevel);
			ShopLevelNextButtonMC.addEventListener(MouseEvent.CLICK, nextLevel);
			
			ShopLevelBackgroundContainerMC.x = 340;
			ShopLevelBackgroundContainerMC.y = 10;
			ShopLevelClockContainerMC.x = 345;
			ShopLevelClockContainerMC.y = 4;
			ShopLevelAvaliableMC.x = 345;
			ShopLevelAvaliableMC.y = 4;
			
			ShopLevelAvaliableMC.gotoAndStop(maxLevel);
			
			
			ShopLevelClockContainerMC.gotoAndStop(currentLevel);
			//ShopLevelMinuteHandContainerMC.gotoAndStop(currentMinute);
			//ShopLevelSecondHandContainerMC.gotoAndStop(0);
			//currentSecond = 0;
			
			/*ShopLevelSecondHandContainerMC.x = ;
			ShopLevelSecondHandContainerMC.y = ;
			ShopLevelMinuteHandContainerMC.x = ;
			ShopLevelMinuteHandContainerMC.y = ;
			ShopLevelHourHandContainerMC.x = ;
			ShopLevelHourHandContainerMC.y = ;
			ShopLevelDescriptionContainerMC.x = ;
			ShopLevelDescriptionContainerMC.y = ;
			ShopLevelSelectContainerMC.x = ;
			ShopLevelSelectContainerMC.y = ;*/
			
			ShopLevelNextButtonMC.x = 645;
			ShopLevelNextButtonMC.y = 540;
			ShopLevelPlayButtonMC.x = 500;
			ShopLevelPlayButtonMC.y = 540;
			ShopLevelPreviousButtonMC.x = 350;
			ShopLevelPreviousButtonMC.y = 540;
			
			ShopLevelClockContainerMC.ShopLevelNumberText.text = currentLevel;
			ShopLevelClockContainerMC.ShopLevelWavesText.text = currentLevelWaves[currentLevel];
			ShopLevelClockContainerMC.ShopLevelDifficultyText.text = currentLevelDifficulty[currentLevel];
			//FlxG.stage.addChild(ShopBookButtonMC);
			//FlxG.stage.addChild(ShopUpgradeButtonMC);
			
			/*ShopBookButtonMC.x = ;
			ShopBookButtonMC.y = ;
			ShopUpgradeButtonMC.x = ;
			ShopUpgradeButtonMC.y = ;*/
			
			//saveData();
			//FlxG.switchState(new LevelState);
		}
		
		private function previousLevel(e:Event):void
		{
			if (currentLevel > 1)
			{
				currentLevel = currentLevel - 1;
				ShopLevelClockContainerMC.gotoAndStop(currentLevel);
			}
			ShopLevelClockContainerMC.ShopLevelNumberText.text = currentLevel;
			ShopLevelClockContainerMC.ShopLevelWavesText.text = currentLevelWaves[currentLevel];
			ShopLevelClockContainerMC.ShopLevelDifficultyText.text = currentLevelDifficulty[currentLevel];
			GameConfig._basicVar = "Current Level " + currentLevel;
		}
		
		private function playLevel(e:Event):void
		{
			saveShopToData();
			loadShopToConfig();
			//saveConfig();
			
			//COSMETICS
			FlxG.stage.removeChild(ShopBackgroundImageMC);
			FlxG.stage.removeChild(ShopGemLargeContainerMC);
			FlxG.stage.removeChild(ShopUpgradeGoldTotalContainerMC);
			
			//BUTTONS
			FlxG.stage.removeChild(ShopLevelButtonMC);
			FlxG.stage.removeChild(ShopOptionButtonMC);
			
			if (currentButton == "Shop")
			{
				FlxG.stage.removeChild(ShopBookButtonMC);
			}
			else if (currentButton == "Upgrades")
			{
				FlxG.stage.removeChild(ShopUpgradeButtonMC);
			}
			
			removeEquipmentDetails();
			removeLevelButtons();
			
			
			trace("State switched to play");
			//trace(GameConfig._basicVar);
			
			FlxG.switchState(new PlayState);
		}
		
		private function nextLevel(e:Event):void
		{
			if (currentLevel < maxLevel)
			{
				currentLevel = currentLevel + 1;
				ShopLevelClockContainerMC.gotoAndStop(currentLevel);
			}
			ShopLevelClockContainerMC.ShopLevelNumberText.text = currentLevel;
			ShopLevelClockContainerMC.ShopLevelWavesText.text = currentLevelWaves[currentLevel];
			ShopLevelClockContainerMC.ShopLevelDifficultyText.text = currentLevelDifficulty[currentLevel];
			
			GameConfig._basicVar = "Current Level " + currentLevel;
		}
		
		private function removeLevelButtons():void
		{
			//REMOVE LEVEL STUFF
			FlxG.stage.removeChild(ShopLevelBackgroundContainerMC);
			FlxG.stage.removeChild(ShopLevelClockContainerMC);
			FlxG.stage.removeChild(ShopLevelAvaliableMC);
			FlxG.stage.removeChild(ShopLevelNextButtonMC);
			FlxG.stage.removeChild(ShopLevelPlayButtonMC);
			FlxG.stage.removeChild(ShopLevelPreviousButtonMC);
		}
		
		///////////////////////////////////////////////////////////////
		/////////////////////////UPGRADES//////////////////////////////
		///////////////////////////////////////////////////////////////
		private function switchToUpgradePage(e:MouseEvent):void
		{
			if (currentSection == "Shop")
			{
				removeShopBooks();
			}
			else if (currentSection == "Level")
			{
				removeLevelButtons();
			}
			loadUpgradesPage();
		}
		
		private function loadUpgradesPage():void
		{
			currentSection = "Upgrades";
			currentButton = "Shop";
			ShopUpgradeButtonMC.removeEventListener(MouseEvent.CLICK, loadUpgradesPage);
			
			FlxG.stage.removeChild(ShopUpgradeButtonMC);

			FlxG.stage.addChild(ShopBookButtonMC);
			
			ShopBookButtonMC.x = 25;
			ShopBookButtonMC.y = 474;
			
			ShopBookButtonMC.addEventListener(MouseEvent.CLICK, switchToShopPage);
			
			//removeShopBooks();
			
			addUpgradeContainers();
			addUpgradeButtons();
			addUpgradeBookIcons();
			
			updateUpgradeDetails();
			updateEquipDetails();
		}
		
		//ADDS THE SKILL BUTTONS/LEVEL/CURRENT COST
		private function addUpgradeButtons():void
		{
			FlxG.stage.addChild(ShopUpgradeBombContainerMC);
			FlxG.stage.addChild(ShopUpgradeIntelligenceContainerMC);
			FlxG.stage.addChild(ShopUpgradeLearningContainerMC);
			FlxG.stage.addChild(ShopUpgradeRegenerationContainerMC);
			FlxG.stage.addChild(ShopUpgradeSpeedContainerMC);
			FlxG.stage.addChild(ShopUpgradeVitalityContainerMC);
			
			FlxG.stage.addChild(ShopUpgradeBombCostContainerMC);
			FlxG.stage.addChild(ShopUpgradeIntelligenceCostContainerMC);
			FlxG.stage.addChild(ShopUpgradeLearningCostContainerMC);
			FlxG.stage.addChild(ShopUpgradeRegenerationCostContainerMC);
			FlxG.stage.addChild(ShopUpgradeSpeedCostContainerMC);
			FlxG.stage.addChild(ShopUpgradeVitalityCostContainerMC);
			
			FlxG.stage.addChild(ShopUpgradeBombLevelButtonMC);
			FlxG.stage.addChild(ShopUpgradeIntelligenceLevelButtonMC);
			FlxG.stage.addChild(ShopUpgradeLearningLevelButtonMC);
			FlxG.stage.addChild(ShopUpgradeRegenerationLevelButtonMC);
			FlxG.stage.addChild(ShopUpgradeSpeedLevelButtonMC);
			FlxG.stage.addChild(ShopUpgradeVitalityLevelButtonMC);
			
			
			ShopUpgradeBombContainerMC.x = 550;
			ShopUpgradeBombContainerMC.y = 162;
			ShopUpgradeIntelligenceContainerMC.x = 550;
			ShopUpgradeIntelligenceContainerMC.y = 199;
			ShopUpgradeLearningContainerMC.x = 550;
			ShopUpgradeLearningContainerMC.y = 242;
			ShopUpgradeRegenerationContainerMC.x = 550;
			ShopUpgradeRegenerationContainerMC.y = 282;
			ShopUpgradeSpeedContainerMC.x = 550;
			ShopUpgradeSpeedContainerMC.y = 322;
			ShopUpgradeVitalityContainerMC.x = 550;
			ShopUpgradeVitalityContainerMC.y = 364;
			
			ShopUpgradeBombCostContainerMC.x = 735;
			ShopUpgradeBombCostContainerMC.y = 157;
			ShopUpgradeIntelligenceCostContainerMC.x = 735;
			ShopUpgradeIntelligenceCostContainerMC.y = 195;
			ShopUpgradeLearningCostContainerMC.x = 735;
			ShopUpgradeLearningCostContainerMC.y = 237;
			ShopUpgradeRegenerationCostContainerMC.x = 735;
			ShopUpgradeRegenerationCostContainerMC.y = 279;
			ShopUpgradeSpeedCostContainerMC.x = 735;
			ShopUpgradeSpeedCostContainerMC.y = 318;
			ShopUpgradeVitalityCostContainerMC.x = 735;
			ShopUpgradeVitalityCostContainerMC.y = 358;
			
			ShopUpgradeBombLevelButtonMC.x = 715;
			ShopUpgradeBombLevelButtonMC.y = 162;
			ShopUpgradeIntelligenceLevelButtonMC.x = 715;
			ShopUpgradeIntelligenceLevelButtonMC.y = 199;
			ShopUpgradeLearningLevelButtonMC.x = 715;
			ShopUpgradeLearningLevelButtonMC.y = 242;
			ShopUpgradeRegenerationLevelButtonMC.x = 715;
			ShopUpgradeRegenerationLevelButtonMC.y = 282;
			ShopUpgradeSpeedLevelButtonMC.x = 715;
			ShopUpgradeSpeedLevelButtonMC.y = 322;
			ShopUpgradeVitalityLevelButtonMC.x = 715;
			ShopUpgradeVitalityLevelButtonMC.y = 364;
			
			ShopUpgradeBombLevelButtonMC.addEventListener(MouseEvent.CLICK, addSkillPoints);
			ShopUpgradeIntelligenceLevelButtonMC.addEventListener(MouseEvent.CLICK, addSkillPoints);
			ShopUpgradeLearningLevelButtonMC.addEventListener(MouseEvent.CLICK, addSkillPoints);
			ShopUpgradeRegenerationLevelButtonMC.addEventListener(MouseEvent.CLICK, addSkillPoints);
			ShopUpgradeSpeedLevelButtonMC.addEventListener(MouseEvent.CLICK, addSkillPoints);
			ShopUpgradeVitalityLevelButtonMC.addEventListener(MouseEvent.CLICK, addSkillPoints);
		}
		
		//ADDS THE ARRAY OF SMALL BOOK ICONS AT THE BOTTOM OF THE UPGRADE PAGE
		private function addUpgradeBookIcons():void
		{
			FlxG.stage.addChild(ShopUpgradeBasicIconSmallMC);
			FlxG.stage.addChild(ShopUpgradeFlameIconSmallMC);
			FlxG.stage.addChild(ShopUpgradeGravityIconSmallMC);
			FlxG.stage.addChild(ShopUpgradeKnockbackIconSmallMC);
			FlxG.stage.addChild(ShopUpgradeLaserIconSmallMC);
			FlxG.stage.addChild(ShopUpgradeMeleeIconSmallMC);
			FlxG.stage.addChild(ShopUpgradeMineIconSmallMC);
			FlxG.stage.addChild(ShopUpgradePierceIconSmallMC);
			FlxG.stage.addChild(ShopUpgradeRapidIconSmallMC);
			FlxG.stage.addChild(ShopUpgradeRocketIconSmallMC);
			FlxG.stage.addChild(ShopUpgradeShotgunIconSmallMC);
			FlxG.stage.addChild(ShopUpgradeSpreadIconSmallMC);
			
			ShopUpgradeBasicIconSmallMC.x = 323;
			ShopUpgradeBasicIconSmallMC.y = 530;
			ShopUpgradeFlameIconSmallMC.x = 362;
			ShopUpgradeFlameIconSmallMC.y = 530;
			ShopUpgradeGravityIconSmallMC.x = 401;
			ShopUpgradeGravityIconSmallMC.y = 530;
			ShopUpgradeKnockbackIconSmallMC.x = 440;
			ShopUpgradeKnockbackIconSmallMC.y = 530;
			ShopUpgradeLaserIconSmallMC.x = 479;
			ShopUpgradeLaserIconSmallMC.y = 530;
			ShopUpgradeMeleeIconSmallMC.x = 518;
			ShopUpgradeMeleeIconSmallMC.y = 530;
			ShopUpgradeMineIconSmallMC.x = 557;
			ShopUpgradeMineIconSmallMC.y = 530;
			ShopUpgradePierceIconSmallMC.x = 596;
			ShopUpgradePierceIconSmallMC.y = 530;
			ShopUpgradeRapidIconSmallMC.x = 635;
			ShopUpgradeRapidIconSmallMC.y = 530;
			ShopUpgradeRocketIconSmallMC.x = 674;
			ShopUpgradeRocketIconSmallMC.y = 530;
			ShopUpgradeShotgunIconSmallMC.x = 713;
			ShopUpgradeShotgunIconSmallMC.y = 530;
			ShopUpgradeSpreadIconSmallMC.x = 752;
			ShopUpgradeSpreadIconSmallMC.y = 530;
			
		}
		
		//ADDS SKILL POINTS WHEN A SKILL LEVEL UP BUTTON IS PUSHED AND THE PLAYER HAS ENOUGH GOLD AND THE SKILL IS NOT MAXED
		private function addSkillPoints(e:MouseEvent):void
		{
			if (e.target == ShopUpgradeBombLevelButtonMC && currentUpgrades[0] != 6 && currentGold >= currentUpgrades[0]* 1000)//BombLevel
			{
				currentGold -= currentUpgrades[1] * 1000;
				currentUpgrades[0] += 1;
			}
			if (e.target == ShopUpgradeIntelligenceLevelButtonMC && currentUpgrades[1] != 6 && currentGold >= currentUpgrades[1]* 1000)//IntelligenceLevel
			{
				currentGold -= currentUpgrades[1] * 1000;
				currentUpgrades[1] += 1;
			}
			if (e.target == ShopUpgradeLearningLevelButtonMC && currentUpgrades[2] != 6 && currentGold >= currentUpgrades[2] * 1000)//LearningLevel
			{
				currentGold -= currentUpgrades[2] * 1000;
				currentUpgrades[2] += 1;
			}
			if (e.target == ShopUpgradeRegenerationLevelButtonMC && currentUpgrades[3] != 6 && currentGold >= currentUpgrades[3] * 1000)//RegenerationLevel
			{
				currentGold -= currentUpgrades[3] * 1000;
				currentUpgrades[3] += 1;
			}
			if (e.target == ShopUpgradeSpeedLevelButtonMC && currentUpgrades[4] != 6 && currentGold >= currentUpgrades[4] * 1000)//SpeedLevel
			{
				currentGold -= currentUpgrades[4] * 1000;
				currentUpgrades[4] += 1;
			}
			if (e.target == ShopUpgradeVitalityLevelButtonMC && currentUpgrades[5] != 6 && currentGold >= currentUpgrades[5]* 1000)//VitalityLevel
			{
				currentGold -= currentUpgrades[5] * 1000;
				currentUpgrades[5] += 1;
			}
			updateUpgradeDetails();
		}
		
		//UPDATES THE SKILL LEVELS COSTS AND CURRENT LEVELS
		private function updateUpgradeDetails():void
		{
			ShopUpgradeBombContainerMC.gotoAndStop(currentUpgrades[0]);//BombLevel);
			ShopUpgradeIntelligenceContainerMC.gotoAndStop(currentUpgrades[1]);//IntelligenceLevel);
			ShopUpgradeLearningContainerMC.gotoAndStop(currentUpgrades[2]);//LearningLevel);
			ShopUpgradeRegenerationContainerMC.gotoAndStop(currentUpgrades[3]);//RegenerationLevel);
			ShopUpgradeSpeedContainerMC.gotoAndStop(currentUpgrades[4]);//SpeedLevel);
			ShopUpgradeVitalityContainerMC.gotoAndStop(currentUpgrades[5]);//VitalityLevel);
			
			if (currentUpgrades[0] != 6)
			{
				ShopUpgradeBombCostContainerMC.ShopUpgradeBombCostText.text = bombValue * currentUpgrades[0];
			}
			else if (currentUpgrades[0] == 6)
			{
				ShopUpgradeBombCostContainerMC.ShopUpgradeBombCostText.text = "Maxed";
			}
			
			if (currentUpgrades[1] != 6)
			{
				ShopUpgradeIntelligenceCostContainerMC.ShopUpgradeIntelligenceCostText.text = intelligenceValue * currentUpgrades[1];
			}
			else if (currentUpgrades[1] == 6)
			{
				ShopUpgradeIntelligenceCostContainerMC.ShopUpgradeIntelligenceCostText.text = "Maxed";
			}
			
			if (currentUpgrades[2] != 6)
			{
				ShopUpgradeLearningCostContainerMC.ShopUpgradeLearningCostText.text = learningValue * currentUpgrades[2];
			}
			else if (currentUpgrades[2] == 6)
			{
				ShopUpgradeLearningCostContainerMC.ShopUpgradeLearningCostText.text = "Maxed";
			}
			
			if (currentUpgrades[3] != 6)
			{
				ShopUpgradeRegenerationCostContainerMC.ShopUpgradeRegenerationCostText.text = regenerationValue * currentUpgrades[3];
			}
			else if (currentUpgrades[3] == 6)
			{
				ShopUpgradeRegenerationCostContainerMC.ShopUpgradeRegenerationCostText.text = "Maxed";
			}
			
			if (currentUpgrades[4] != 6)
			{
				ShopUpgradeSpeedCostContainerMC.ShopUpgradeSpeedCostText.text = speedValue * currentUpgrades[4];
			}
			else if (currentUpgrades[4] == 6)
			{
				ShopUpgradeSpeedCostContainerMC.ShopUpgradeSpeedCostText.text = "Maxed";
			}
			
			if (currentUpgrades[5] != 6)
			{
				ShopUpgradeVitalityCostContainerMC.ShopUpgradeVitalityCostText.text = vitalityValue * currentUpgrades[5];
			}
			else if (currentUpgrades[5] == 6)
			{
				ShopUpgradeVitalityCostContainerMC.ShopUpgradeVitalityCostText.text = "Maxed";
			}
		}
		
		//UPDATES THE UPGRADES BOOK EQUIPED TEXT FIELDS AND ADDS MEDIUM ICONS DEPENDING ON WHERE ITS EQUIPED.
		//ALSO UPDATES THE BOOK SMALL ICONS LEVEL CONTAINER
		private function updateEquipDetails():void
		{
			
			ShopUpgradePrimaryExpContainerMC.ShopUpgradePrimaryExpText.text = primaryExp + "/" + primaryExpNeeded;
			ShopUpgradePrimaryLevelContainerMC.ShopUpgradePrimaryLevelText.text = "Lv " + primaryLevel;
			ShopUpgradePrimaryTitleContainerMC.ShopUpgradePrimaryTitleText.text = primaryTitle + "\r" + primaryStyle;
			
			if (primaryStyle == "Basic")
			{
				FlxG.stage.addChild(ShopUpgradeBasicIconMediumAMC);
				ShopUpgradeBasicIconMediumAMC.x = 340;
				ShopUpgradeBasicIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = BasicDescription;
			}
			else if (primaryStyle == "Flame")
			{
				FlxG.stage.addChild(ShopUpgradeFlameIconMediumAMC);
				ShopUpgradeFlameIconMediumAMC.x = 340;
				ShopUpgradeFlameIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = FlameDescription
			}
			else if (primaryStyle == "Gravity")
			{
				FlxG.stage.addChild(ShopUpgradeGravityIconMediumAMC);
				ShopUpgradeGravityIconMediumAMC.x = 340;
				ShopUpgradeGravityIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = GravityDescription;
			}
			else if (primaryStyle == "Knockback")
			{
				FlxG.stage.addChild(ShopUpgradeKnockbackIconMediumAMC);
				ShopUpgradeKnockbackIconMediumAMC.x = 340;
				ShopUpgradeKnockbackIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = KnockbackDescription;
			}
			else if (primaryStyle == "Laser")
			{
				FlxG.stage.addChild(ShopUpgradeLaserIconMediumAMC);
				ShopUpgradeLaserIconMediumAMC.x = 340;
				ShopUpgradeLaserIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = LaserDescription;
			}
			else if (primaryStyle == "Melee")
			{
				FlxG.stage.addChild(ShopUpgradeMeleeIconMediumAMC);
				ShopUpgradeMeleeIconMediumAMC.x = 340;
				ShopUpgradeMeleeIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = MeleeDescription;
			}
			else if (primaryStyle == "Mine")
			{
				FlxG.stage.addChild(ShopUpgradeMineIconMediumAMC);
				ShopUpgradeMineIconMediumAMC.x = 340;
				ShopUpgradeMineIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = MineDescription;
			}
			else if (primaryStyle == "Pierce")
			{
				FlxG.stage.addChild(ShopUpgradePierceIconMediumAMC);
				ShopUpgradePierceIconMediumAMC.x = 340;
				ShopUpgradePierceIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = PierceDescription;
			}
			else if (primaryStyle == "Rapid")
			{
				FlxG.stage.addChild(ShopUpgradeRapidIconMediumAMC);
				ShopUpgradeRapidIconMediumAMC.x = 340;
				ShopUpgradeRapidIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = RapidDescription;
			}
			else if (primaryStyle == "Rocket")
			{
				FlxG.stage.addChild(ShopUpgradeRocketIconMediumAMC);
				ShopUpgradeRocketIconMediumAMC.x = 340;
				ShopUpgradeRocketIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = RocketDescription;
			}
			else if (primaryStyle == "Shotgun")
			{
				FlxG.stage.addChild(ShopUpgradeShotgunIconMediumAMC);
				ShopUpgradeShotgunIconMediumAMC.x = 340;
				ShopUpgradeShotgunIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = ShotgunDescription;
			}
			else if (primaryStyle == "Spread")
			{
				FlxG.stage.addChild(ShopUpgradeSpreadIconMediumAMC);
				ShopUpgradeSpreadIconMediumAMC.x = 340;
				ShopUpgradeSpreadIconMediumAMC.y = 400;
				ShopUpgradePrimaryDescriptionContainerMC.ShopUpgradePrimaryDescriptionText.text = SpreadDescription;
			}
			
			
			ShopUpgradeSecondaryExpContainerMC.ShopUpgradeSecondaryExpText.text = secondaryExp + "/" + secondaryExpNeeded;
			ShopUpgradeSecondaryLevelContainerMC.ShopUpgradeSecondaryLevelText.text = "Lv " + secondaryLevel;
			ShopUpgradeSecondaryTitleContainerMC.ShopUpgradeSecondaryTitleText.text = secondaryTitle + "\r" + secondaryStyle;
			
			if (secondaryStyle == "Basic")
			{
				FlxG.stage.addChild(ShopUpgradeBasicIconMediumBMC);
				ShopUpgradeBasicIconMediumBMC.x = 340;
				ShopUpgradeBasicIconMediumBMC.y = 470;
				if (primaryStyle == "Basic")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = BasicDescription;
				}
			}
			else if (secondaryStyle == "Flame")
			{
				FlxG.stage.addChild(ShopUpgradeFlameIconMediumBMC);
				ShopUpgradeFlameIconMediumBMC.x = 340;
				ShopUpgradeFlameIconMediumBMC.y = 470;
				if (primaryStyle == "Flame")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = FlameDescription;
				}
			}
			else if (secondaryStyle == "Gravity")
			{
				FlxG.stage.addChild(ShopUpgradeGravityIconMediumBMC);
				ShopUpgradeGravityIconMediumBMC.x = 340;
				ShopUpgradeGravityIconMediumBMC.y = 470;
				if (primaryStyle == "Gravity")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = GravityDescription;
				}
			}
			else if (secondaryStyle == "Knockback")
			{
				FlxG.stage.addChild(ShopUpgradeKnockbackIconMediumBMC);
				ShopUpgradeKnockbackIconMediumBMC.x = 340;
				ShopUpgradeKnockbackIconMediumBMC.y = 470;
				if (primaryStyle == "Knockback")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = KnockbackDescription;
				}
			}
			else if (secondaryStyle == "Laser")
			{
				FlxG.stage.addChild(ShopUpgradeLaserIconMediumBMC);
				ShopUpgradeLaserIconMediumBMC.x = 340;
				ShopUpgradeLaserIconMediumBMC.y = 470;
				if (primaryStyle == "Laser")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = LaserDescription;
				}
			}
			else if (secondaryStyle == "Melee")
			{
				FlxG.stage.addChild(ShopUpgradeMeleeIconMediumBMC);
				ShopUpgradeMeleeIconMediumBMC.x = 340;
				ShopUpgradeMeleeIconMediumBMC.y = 470;
				if (primaryStyle == "Melee")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = MeleeDescription;
				}
			}
			else if (secondaryStyle == "Mine")
			{
				FlxG.stage.addChild(ShopUpgradeMineIconMediumBMC);
				ShopUpgradeMineIconMediumBMC.x = 340;
				ShopUpgradeMineIconMediumBMC.y = 470;
				if (primaryStyle == "Mine")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = MineDescription;
				}
			}
			else if (secondaryStyle == "Pierce")
			{
				FlxG.stage.addChild(ShopUpgradePierceIconMediumBMC);
				ShopUpgradePierceIconMediumBMC.x = 340;
				ShopUpgradePierceIconMediumBMC.y = 470;
				if (primaryStyle == "Pierce")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = PierceDescription;
				}
			}
			else if (secondaryStyle == "Rapid")
			{
				FlxG.stage.addChild(ShopUpgradeRapidIconMediumBMC);
				ShopUpgradeRapidIconMediumBMC.x = 340;
				ShopUpgradeRapidIconMediumBMC.y = 470;
				if (primaryStyle == "Rapid")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = RapidDescription;
				}
			}
			else if (secondaryStyle == "Rocket")
			{
				FlxG.stage.addChild(ShopUpgradeRocketIconMediumBMC);
				ShopUpgradeRocketIconMediumBMC.x = 340;
				ShopUpgradeRocketIconMediumBMC.y = 470;
				if (primaryStyle == "Rocket")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = RocketDescription;
				}
			}
			else if (secondaryStyle == "Shotgun")
			{
				FlxG.stage.addChild(ShopUpgradeShotgunIconMediumBMC);
				ShopUpgradeShotgunIconMediumBMC.x = 340;
				ShopUpgradeShotgunIconMediumBMC.y = 470;
				if (primaryStyle == "Shotgun")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = ShotgunDescription;
				}
			}
			else if (secondaryStyle == "Spread")
			{
				FlxG.stage.addChild(ShopUpgradeSpreadIconMediumBMC);
				ShopUpgradeSpreadIconMediumBMC.x = 340;
				ShopUpgradeSpreadIconMediumBMC.y = 470;
				if (primaryStyle == "Spread")
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = DoubleEquipDescription;
				}
				else
				{
					ShopUpgradeSecondaryDescriptionContainerMC.ShopUpgradeSecondaryDescriptionText.text = SpreadDescription;
				}
			}
			
			ShopUpgradePrimaryExpFullBarMC.width = (primaryExp / (primaryExpNeeded / 100)) * 3;
			
			ShopUpgradeSecondaryExpFullBarMC.width = (secondaryExp / (secondaryExpNeeded / 100)) * 3;
			
			
			ShopUpgradeBookLevelContainerMC.ShopUpgradeBasicLevelText.text = equipmentLevels[0];//BasicLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradeFlameLevelText.text = equipmentLevels[1];//FlameLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradeGravityLevelText.text = equipmentLevels[2];//GravityLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradeKnockbackLevelText.text = equipmentLevels[3];//KnockbackLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradeLaserLevelText.text = equipmentLevels[4];//LaserLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradeMeleeLevelText.text = equipmentLevels[5];//MeleeLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradeMineLevelText.text = equipmentLevels[6];//MineLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradePierceLevelText.text = equipmentLevels[7];//PierceLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradeRapidLevelText.text = equipmentLevels[8];//RapidLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradeRocketLevelText.text = equipmentLevels[9];//RocketLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradeShotgunLevelText.text = equipmentLevels[10];//ShotgunLevel;
			ShopUpgradeBookLevelContainerMC.ShopUpgradeSpreadLevelText.text = equipmentLevels[11];//SpreadLevel;
		}
		
		//REMOVES BOOK DESCRIPTION/TITLE/STYLE/EXP/LEVELS, THE EXP BARS, AND THE SMALL AND MEDIUM (A/B) BOOK ICONS
		private function removeUpgradeEquipDetails():void
		{
			//PRIMARY
			if (primaryStyle == "Basic")
			{
				FlxG.stage.removeChild(ShopUpgradeBasicIconMediumAMC);
			}
			else if (primaryStyle == "Flame")
			{
				FlxG.stage.removeChild(ShopUpgradeFlameIconMediumAMC);
			}
			else if (primaryStyle == "Gravity")
			{
				FlxG.stage.removeChild(ShopUpgradeGravityIconMediumAMC);
			}
			else if (primaryStyle == "Knockback")
			{
				FlxG.stage.removeChild(ShopUpgradeKnockbackIconMediumAMC);
			}
			else if (primaryStyle == "Laser")
			{
				FlxG.stage.removeChild(ShopUpgradeLaserIconMediumAMC);
			}
			else if (primaryStyle == "Melee")
			{
				FlxG.stage.removeChild(ShopUpgradeMeleeIconMediumAMC);
			}
			else if (primaryStyle == "Mine")
			{
				FlxG.stage.removeChild(ShopUpgradeMineIconMediumAMC);
			}
			else if (primaryStyle == "Pierce")
			{
				FlxG.stage.removeChild(ShopUpgradePierceIconMediumAMC);
			}
			else if (primaryStyle == "Rapid")
			{
				FlxG.stage.removeChild(ShopUpgradeRapidIconMediumAMC);
			}
			else if (primaryStyle == "Rocket")
			{
				FlxG.stage.removeChild(ShopUpgradeRocketIconMediumAMC);
			}
			else if (primaryStyle == "Shotgun")
			{
				FlxG.stage.removeChild(ShopUpgradeShotgunIconMediumAMC);
			}
			else if (primaryStyle == "Spread")
			{
				FlxG.stage.removeChild(ShopUpgradeSpreadIconMediumAMC);
			}
			
			//SECONDARY
			if (secondaryStyle == "Basic")
			{
				FlxG.stage.removeChild(ShopUpgradeBasicIconMediumBMC);
			}
			else if (secondaryStyle == "Flame")
			{
				FlxG.stage.removeChild(ShopUpgradeFlameIconMediumBMC);
			}
			else if (secondaryStyle == "Gravity")
			{
				FlxG.stage.removeChild(ShopUpgradeGravityIconMediumBMC);
			}
			else if (secondaryStyle == "Knockback")
			{
				FlxG.stage.removeChild(ShopUpgradeKnockbackIconMediumBMC);
			}
			else if (secondaryStyle == "Laser")
			{
				FlxG.stage.removeChild(ShopUpgradeLaserIconMediumBMC);
			}
			else if (secondaryStyle == "Melee")
			{
				FlxG.stage.removeChild(ShopUpgradeMeleeIconMediumBMC);
			}
			else if (secondaryStyle == "Mine")
			{
				FlxG.stage.removeChild(ShopUpgradeMineIconMediumBMC);
			}
			else if (secondaryStyle == "Pierce")
			{
				FlxG.stage.removeChild(ShopUpgradePierceIconMediumBMC);
			}
			else if (secondaryStyle == "Rapid")
			{
				FlxG.stage.removeChild(ShopUpgradeRapidIconMediumBMC);
			}
			else if (secondaryStyle == "Rocket")
			{
				FlxG.stage.removeChild(ShopUpgradeRocketIconMediumBMC);
			}
			else if (secondaryStyle == "Shotgun")
			{
				FlxG.stage.removeChild(ShopUpgradeShotgunIconMediumBMC);
			}
			else if (secondaryStyle == "Spread")
			{
				FlxG.stage.removeChild(ShopUpgradeSpreadIconMediumBMC);
			}
			
			FlxG.stage.removeChild(ShopUpgradePrimaryExpContainerMC);
			FlxG.stage.removeChild(ShopUpgradePrimaryLevelContainerMC);
			FlxG.stage.removeChild(ShopUpgradePrimaryTitleContainerMC);
			FlxG.stage.removeChild(ShopUpgradePrimaryDescriptionContainerMC);
			FlxG.stage.removeChild(ShopUpgradePrimaryExpFullBarMC);
			FlxG.stage.removeChild(ShopUpgradePrimaryExpEmptyBarMC);
			
			
			FlxG.stage.removeChild(ShopUpgradeSecondaryExpContainerMC);
			FlxG.stage.removeChild(ShopUpgradeSecondaryLevelContainerMC);
			FlxG.stage.removeChild(ShopUpgradeSecondaryTitleContainerMC);
			FlxG.stage.removeChild(ShopUpgradeSecondaryDescriptionContainerMC);
			FlxG.stage.removeChild(ShopUpgradeSecondaryExpFullBarMC);
			FlxG.stage.removeChild(ShopUpgradeSecondaryExpEmptyBarMC);
			
			FlxG.stage.removeChild(ShopUpgradeBookLevelContainerMC);
			
			FlxG.stage.removeChild(ShopUpgradeBasicIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradeFlameIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradeGravityIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradeKnockbackIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradeLaserIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradeMeleeIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradeMineIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradePierceIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradeRapidIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradeRocketIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradeShotgunIconSmallMC);
			FlxG.stage.removeChild(ShopUpgradeSpreadIconSmallMC);
			
			FlxG.stage.removeChild(ShopUpgradeContainerMC);
			FlxG.stage.removeChild(ShopGemWhiteContainerMC);
		}
		
		//REMOVES THE SKILL BUTTONS/LEVEL/CURRENT COST
		private function removeUpgradeButtons():void
		{
			ShopUpgradeBombLevelButtonMC.removeEventListener(MouseEvent.CLICK, addSkillPoints);
			ShopUpgradeIntelligenceLevelButtonMC.removeEventListener(MouseEvent.CLICK, addSkillPoints);
			ShopUpgradeLearningLevelButtonMC.removeEventListener(MouseEvent.CLICK, addSkillPoints);
			ShopUpgradeRegenerationLevelButtonMC.removeEventListener(MouseEvent.CLICK, addSkillPoints);
			ShopUpgradeSpeedLevelButtonMC.removeEventListener(MouseEvent.CLICK, addSkillPoints);
			ShopUpgradeVitalityLevelButtonMC.removeEventListener(MouseEvent.CLICK, addSkillPoints);
			
			FlxG.stage.removeChild(ShopUpgradeBombContainerMC);
			FlxG.stage.removeChild(ShopUpgradeIntelligenceContainerMC);
			FlxG.stage.removeChild(ShopUpgradeLearningContainerMC);
			FlxG.stage.removeChild(ShopUpgradeRegenerationContainerMC);
			FlxG.stage.removeChild(ShopUpgradeSpeedContainerMC);
			FlxG.stage.removeChild(ShopUpgradeVitalityContainerMC);
			
			FlxG.stage.removeChild(ShopUpgradeBombCostContainerMC);
			FlxG.stage.removeChild(ShopUpgradeIntelligenceCostContainerMC);
			FlxG.stage.removeChild(ShopUpgradeLearningCostContainerMC);
			FlxG.stage.removeChild(ShopUpgradeRegenerationCostContainerMC);
			FlxG.stage.removeChild(ShopUpgradeSpeedCostContainerMC);
			FlxG.stage.removeChild(ShopUpgradeVitalityCostContainerMC);
			
			FlxG.stage.removeChild(ShopUpgradeBombLevelButtonMC);
			FlxG.stage.removeChild(ShopUpgradeIntelligenceLevelButtonMC);
			FlxG.stage.removeChild(ShopUpgradeLearningLevelButtonMC);
			FlxG.stage.removeChild(ShopUpgradeRegenerationLevelButtonMC);
			FlxG.stage.removeChild(ShopUpgradeSpeedLevelButtonMC);
			FlxG.stage.removeChild(ShopUpgradeVitalityLevelButtonMC);
			
			FlxG.stage.removeChild(ShopUpgradeSkillTitleContainerMC);
		}
		
		//ADDS THE UPGRADE BACKGROUND CONTAINER, WHITE GEM, SKILL TITLES, AND EQUIPMENT EXP BAR/TEXT CONTAINERS
		private function addUpgradeContainers():void
		{
			//COSMETICS
			FlxG.stage.addChild(ShopUpgradeContainerMC);
			
			FlxG.stage.addChild(ShopUpgradeSkillTitleContainerMC);
			
			FlxG.stage.addChild(ShopGemWhiteContainerMC);
			
			//DESCRIPTIONS
			FlxG.stage.addChild(ShopUpgradePrimaryExpContainerMC);
			FlxG.stage.addChild(ShopUpgradePrimaryLevelContainerMC);
			FlxG.stage.addChild(ShopUpgradePrimaryTitleContainerMC);
			FlxG.stage.addChild(ShopUpgradePrimaryDescriptionContainerMC);
			
			FlxG.stage.addChild(ShopUpgradeSecondaryExpContainerMC);
			FlxG.stage.addChild(ShopUpgradeSecondaryLevelContainerMC);
			FlxG.stage.addChild(ShopUpgradeSecondaryTitleContainerMC);
			FlxG.stage.addChild(ShopUpgradeSecondaryDescriptionContainerMC);
			
			FlxG.stage.addChild(ShopUpgradePrimaryExpEmptyBarMC);
			FlxG.stage.addChild(ShopUpgradePrimaryExpFullBarMC);
			
			FlxG.stage.addChild(ShopUpgradeSecondaryExpEmptyBarMC);
			FlxG.stage.addChild(ShopUpgradeSecondaryExpFullBarMC);
			
			FlxG.stage.addChild(ShopUpgradeBookLevelContainerMC);
			
			
			//POSITIONS
			//COSMETICS
			ShopGemWhiteContainerMC.x = 747;
			ShopGemWhiteContainerMC.y = 120;
			
			ShopUpgradeSkillTitleContainerMC.x = 345;
			ShopUpgradeSkillTitleContainerMC.y = 155;
			
			ShopUpgradeContainerMC.x = 315;
			ShopUpgradeContainerMC.y = 25;
			
			//DESCRIPTIONS
			ShopUpgradePrimaryExpContainerMC.x = 603;
			ShopUpgradePrimaryExpContainerMC.y = 400;
			ShopUpgradePrimaryLevelContainerMC.x = 488;
			ShopUpgradePrimaryLevelContainerMC.y = 400;
			ShopUpgradePrimaryTitleContainerMC.x = 387;
			ShopUpgradePrimaryTitleContainerMC.y = 400;
			ShopUpgradePrimaryDescriptionContainerMC.x = 328;
			ShopUpgradePrimaryDescriptionContainerMC.y = 438;
			
			ShopUpgradeSecondaryExpContainerMC.x = 603;
			ShopUpgradeSecondaryExpContainerMC.y = 472;
			ShopUpgradeSecondaryLevelContainerMC.x = 488;
			ShopUpgradeSecondaryLevelContainerMC.y = 472;
			ShopUpgradeSecondaryTitleContainerMC.x = 387;
			ShopUpgradeSecondaryTitleContainerMC.y = 472;
			ShopUpgradeSecondaryDescriptionContainerMC.x = 328;
			ShopUpgradeSecondaryDescriptionContainerMC.y = 510;
			
			ShopUpgradePrimaryExpEmptyBarMC.x = 485;
			ShopUpgradePrimaryExpEmptyBarMC.y = 425;
			ShopUpgradePrimaryExpFullBarMC.x = 485;
			ShopUpgradePrimaryExpFullBarMC.y = 425;
			
			ShopUpgradeSecondaryExpEmptyBarMC.x = 485;
			ShopUpgradeSecondaryExpEmptyBarMC.y = 498;
			ShopUpgradeSecondaryExpFullBarMC.x = 485;
			ShopUpgradeSecondaryExpFullBarMC.y = 498;
			
			ShopUpgradeBookLevelContainerMC.x = 333;
			ShopUpgradeBookLevelContainerMC.y = 559;
		}
		
		
		
		///////////////////////////////////////////////////////////////
		/////////////////////////SAVE/LOAD/////////////////////////////
		///////////////////////////////////////////////////////////////
		//LOADS GAME CONFIG FILE TO SEE IF A SAVE EXISTS, IF IT DOESNT THEN CREATE IT
		/*private function initaliseSaves():void
		{
			//LOADS GAME CONFIG FILE
			gc = SharedObject.getLocal("gameConfiguration");
			//CHECKS IF THERE IS A EXISITING GAME SAVE FILE (BOOL)
			_gameConfig.existingSave = gc.data.ExistingSave;
		}*/
		
		//TODO Move 3 of each shop/config to their respected classes
		//SAVE/LOAD SHOP TO DATA
		private function saveShopToData():void
		{
			var sd:SharedObject = SharedObject.getLocal("primarySave");
			
			sd.data.variable = shopVariable;
			sd.data.primaryTitle = primaryTitle;
			sd.data.secondaryTitle = secondaryTitle;
			sd.data.primaryId = primaryId;
			sd.data.secondaryId = secondaryId;
			sd.data.equipmentLevels = equipmentLevels;
			sd.data.equipmentExp = equipmentExp;
			sd.data.equipmentOwned = equipmentOwned;
			sd.data.currentLevel = currentLevel;
			sd.data.maxLevel = maxLevel;
			sd.data.currentGold = currentGold;
			sd.data.maxGold = maxGold;
			sd.data.currentUpgradeLevels = currentUpgrades;
			sd.data.cheatsEnabled = cheatsEnabled;
			sd.data.currentVolumeMusic = volumeMusic;
			sd.data.currentVolumeSFX = volumeSFX;
			sd.data.currentWave = currentWave;
			
			//GameConfig._currentLevel = currentLevel;
			//GameConfig._currentWaves = "enemyWave1a";
			
			sd.flush();
			//writeSaves();
			trace("data saved succesfully");
			//loadData();
		}
		
		private function loadDataToShop():void
		{
			var sd:SharedObject = SharedObject.getLocal("PrimarySave");
			trace(sd.data.variable);
			
			shopVariable = sd.data.variable;
			primaryTitle = sd.data.primaryTitle;
			secondaryTitle = sd.data.secondaryTitle;
			primaryId = sd.data.primaryId;
			secondaryId = sd.data.secondaryId;
			equipmentLevels = sd.data.equipmentLevels;
			equipmentExp = sd.data.equipmentExp;
			equipmentOwned = sd.data.equipmentOwned;
			currentLevel = sd.data.currentLevel;
			maxLevel = sd.data.maxLevel;
			currentGold = sd.data.currentGold;
			maxGold = sd.data.maxGold;
			currentUpgrades = sd.data.currentUpgradeLevels;
			cheatsEnabled = sd.data.cheatsEnabled;
			volumeMusic = sd.data.currentVolumeMusic;
			volumeSFX = sd.data.currentVolumeSFX;
			currentWave = sd.data.currentWave;
		}
		
		
		
		//SAVE/LOAD SHOP TO CONFIG
		private function loadConfigToShop():void
		{
			//equipmentExpNeeded = [BasicExpNeeded, FlameExpNeeded, GravityExpNeeded, KnockbackExpNeeded, LaserExpNeeded, MeleeExpNeeded, MineExpNeeded, PierceExpNeeded, RapidExpNeeded, RocketExpNeeded, ShotgunExpNeeded, SpreadExpNeeded];
			
			shopVariable = GameConfig._basicVar;
			equipmentLevels = GameConfig._equipmentLevels;
			equipmentExp = GameConfig._equipmentExp;
			equipmentOwned = GameConfig._equipmentOwned;
			currentLevel = GameConfig._currentLevel;
			maxLevel = GameConfig._maxLevel;
			currentGold = GameConfig._currentGold;
			maxGold = GameConfig._maxGold;
			currentUpgrades = GameConfig._currentUpgrades;
			cheatsEnabled = GameConfig._cheatsEnabled;
			volumeMusic = GameConfig._volumeMusic;
			volumeSFX = GameConfig._volumeSFX;
			currentWave = GameConfig._currentWave;
			
			primaryId = GameConfig._primaryId;
			primaryTitle = GameConfig._primaryTitle;
			primaryExp = equipmentExp[GameConfig._primaryId];//BasicExp;
			primaryLevel = equipmentLevels[GameConfig._primaryId];//BasicLevel;
			primaryLevelMax = equipmentLevelMax[GameConfig._primaryId];//BasicLevelMax;
			
			secondaryId = GameConfig._secondaryId;
			secondaryTitle = GameConfig._secondaryTitle;
			secondaryExp = equipmentExp[GameConfig._secondaryId];//BasicExp;
			secondaryLevel = equipmentLevels[GameConfig._secondaryId];//BasicLevel;
			secondaryLevelMax = equipmentLevelMax[GameConfig._secondaryId];//BasicLevelMax;
			
			/*switch (GameConfig._primaryEquip)
			{
				case 0:
				primaryTitle = "Indoles";
				primaryStyle = "Basic";
				primaryExpNeeded = BasicExpNeeded[primaryLevel];
				break;
				
				case 1:
				primaryTitle = "Ignis";
				primaryStyle = "Flame";
				primaryExpNeeded = FlameExpNeeded[primaryLevel];
				break;
				
				case 2:
				primaryTitle = "Sacoma";
				primaryStyle = "Gravity";
				primaryExpNeeded = GravityExpNeeded[primaryLevel];
				break;
				
				case 3:
				primaryTitle = "Vis";
				primaryStyle = "Knockback";
				primaryExpNeeded = KnockbackExpNeeded[primaryLevel];
				break;
				
				case 4: 
				primaryTitle = "Stella";
				primaryStyle = "Laser";
				primaryExpNeeded = LaserExpNeeded[primaryLevel];
				break;
				
				case 5:
				primaryTitle = "Ensis";
				primaryStyle = "Melee";
				primaryExpNeeded = MeleeExpNeeded[primaryLevel];
				break;
				
				case 6:
				primaryTitle = "Decipula";
				primaryStyle = "Mine";
				primaryExpNeeded = MineExpNeeded[primaryLevel];
				break;
				
				case 7:
				primaryTitle = "Lancea";
				primaryStyle = "Pierce";
				primaryExpNeeded = PierceExpNeeded[primaryLevel];
				break;
				
				case 8:
				primaryTitle = "Concitus";
				primaryStyle = "Rapid";
				primaryExpNeeded = RapidExpNeeded[primaryLevel];
				break;
				
				case 9:
				primaryTitle = "Fragor";
				primaryStyle = "Rocket";
				primaryExpNeeded = RocketExpNeeded[primaryLevel];
				break;
				
				case 10:
				primaryTitle = "Differo";
				primaryStyle = "Shotgun";
				primaryExpNeeded = ShotgunExpNeeded[primaryLevel];
				break;
				
				case 11:
				primaryTitle = "Hydrus";
				primaryStyle = "Spread";
				primaryExpNeeded = SpreadExpNeeded[primaryLevel];
			}
			
			switch (GameConfig._secondaryEquip)
			{
				case 0:
				secondaryTitle = "Indoles";
				secondaryStyle = "Basic";
				secondaryExpNeeded = BasicExpNeeded[secondaryLevel];
				break;
				
				case 1:
				secondaryTitle = "Ignis";
				secondaryStyle = "Flame";
				secondaryExpNeeded = FlameExpNeeded[secondaryLevel];
				break;
				
				case 2:
				secondaryTitle = "Sacoma";
				secondaryStyle = "Gravity";
				secondaryExpNeeded = GravityExpNeeded[secondaryLevel];
				break;
				
				case 3:
				secondaryTitle = "Vis";
				secondaryStyle = "Knockback";
				secondaryExpNeeded = KnockbackExpNeeded[secondaryLevel];
				break;
				
				case 4: 
				secondaryTitle = "Stella";
				secondaryStyle = "Laser";
				secondaryExpNeeded = LaserExpNeeded[secondaryLevel];
				break;
				
				case 5:
				secondaryTitle = "Ensis";
				secondaryStyle = "Melee";
				secondaryExpNeeded = MeleeExpNeeded[secondaryLevel];
				break;
				
				case 6:
				secondaryTitle = "Decipula";
				secondaryStyle = "Mine";
				secondaryExpNeeded = MineExpNeeded[secondaryLevel];
				break;
				
				case 7:
				secondaryTitle = "Lancea";
				secondaryStyle = "Pierce";
				secondaryExpNeeded = PierceExpNeeded[secondaryLevel];
				break;
				
				case 8:
				secondaryTitle = "Concitus";
				secondaryStyle = "Rapid";
				secondaryExpNeeded = RapidExpNeeded[secondaryLevel];
				break;
				
				case 9:
				secondaryTitle = "Fragor";
				secondaryStyle = "Rocket";
				secondaryExpNeeded = RocketExpNeeded[secondaryLevel];
				break;
				
				case 10:
				secondaryTitle = "Differo";
				secondaryStyle = "Shotgun";
				secondaryExpNeeded = ShotgunExpNeeded[secondaryLevel];
				break;
				
				case 11:
				secondaryTitle = "Hydrus";
				secondaryStyle = "Spread";
				secondaryExpNeeded = SpreadExpNeeded[secondaryLevel];
			}*/
			
		}
		
		private function loadShopToConfig():void
		{
			//equipmentExpNeeded = [BasicExpNeeded, FlameExpNeeded, GravityExpNeeded, KnockbackExpNeeded, LaserExpNeeded, MeleeExpNeeded, MineExpNeeded, PierceExpNeeded, RapidExpNeeded, RocketExpNeeded, ShotgunExpNeeded, SpreadExpNeeded];
			
			GameConfig._basicVar = shopVariable;
			GameConfig._equipmentLevels = equipmentLevels;
			GameConfig._equipmentExp = equipmentExp;
			GameConfig._equipmentOwned = equipmentOwned;
			GameConfig._currentLevel = currentLevel;
			GameConfig._maxLevel = maxLevel;
			GameConfig._currentGold = currentGold;
			GameConfig._maxGold = maxGold;
			GameConfig._currentUpgrades = currentUpgrades;
			GameConfig._cheatsEnabled = cheatsEnabled;
			GameConfig._volumeMusic = volumeMusic;
			GameConfig._volumeSFX = volumeSFX;
			GameConfig._currentWave = currentWave;
			
			trace(primaryId);
			trace(GameConfig._primaryId);
			GameConfig._primaryId = primaryId;
			trace(GameConfig._primaryId);
			GameConfig._primaryTitle = primaryTitle;
			//equipmentExp[GameConfig._primaryEquip] = primaryExp//BasicExp = 
			//equipmentLevels[GameConfig._primaryEquip] = primaryLevel//BasicLevel = 
			//equipmentLevelMax[GameConfig._primaryEquip] = primaryLevelMax//BasicLevelMax = 
			
			GameConfig._secondaryId = secondaryId;
			GameConfig._secondaryTitle = secondaryTitle;
			//equipmentExp[GameConfig._secondaryEquip] = secondaryExp//BasicExp = 
			//equipmentLevels[GameConfig._secondaryEquip] = secondaryLevel//BasicLevel = 
			//equipmentLevelMax[GameConfig._secondaryEquip] = secondaryLevelMax//BasicLevelMax = 
			
			/*switch (GameConfig._primaryEquip)
			{
				case 0:
				primaryTitle = "Indoles";
				primaryStyle = "Basic";
				primaryExpNeeded = BasicExpNeeded[primaryLevel];
				break;
				
				case 1:
				primaryTitle = "Ignis";
				primaryStyle = "Flame";
				primaryExpNeeded = FlameExpNeeded[primaryLevel];
				break;
				
				case 2:
				primaryTitle = "Sacoma";
				primaryStyle = "Gravity";
				primaryExpNeeded = GravityExpNeeded[primaryLevel];
				break;
				
				case 3:
				primaryTitle = "Vis";
				primaryStyle = "Knockback";
				primaryExpNeeded = KnockbackExpNeeded[primaryLevel];
				break;
				
				case 4: 
				primaryTitle = "Stella";
				primaryStyle = "Laser";
				primaryExpNeeded = LaserExpNeeded[primaryLevel];
				break;
				
				case 5:
				primaryTitle = "Ensis";
				primaryStyle = "Melee";
				primaryExpNeeded = MeleeExpNeeded[primaryLevel];
				break;
				
				case 6:
				primaryTitle = "Decipula";
				primaryStyle = "Mine";
				primaryExpNeeded = MineExpNeeded[primaryLevel];
				break;
				
				case 7:
				primaryTitle = "Lancea";
				primaryStyle = "Pierce";
				primaryExpNeeded = PierceExpNeeded[primaryLevel];
				break;
				
				case 8:
				primaryTitle = "Concitus";
				primaryStyle = "Rapid";
				primaryExpNeeded = RapidExpNeeded[primaryLevel];
				break;
				
				case 9:
				primaryTitle = "Fragor";
				primaryStyle = "Rocket";
				primaryExpNeeded = RocketExpNeeded[primaryLevel];
				break;
				
				case 10:
				primaryTitle = "Differo";
				primaryStyle = "Shotgun";
				primaryExpNeeded = ShotgunExpNeeded[primaryLevel];
				break;
				
				case 11:
				primaryTitle = "Hydrus";
				primaryStyle = "Spread";
				primaryExpNeeded = SpreadExpNeeded[primaryLevel];
			}
			
			switch (GameConfig._secondaryEquip)
			{
				case 0:
				secondaryTitle = "Indoles";
				secondaryStyle = "Basic";
				secondaryExpNeeded = BasicExpNeeded[secondaryLevel];
				break;
				
				case 1:
				secondaryTitle = "Ignis";
				secondaryStyle = "Flame";
				secondaryExpNeeded = FlameExpNeeded[secondaryLevel];
				break;
				
				case 2:
				secondaryTitle = "Sacoma";
				secondaryStyle = "Gravity";
				secondaryExpNeeded = GravityExpNeeded[secondaryLevel];
				break;
				
				case 3:
				secondaryTitle = "Vis";
				secondaryStyle = "Knockback";
				secondaryExpNeeded = KnockbackExpNeeded[secondaryLevel];
				break;
				
				case 4: 
				secondaryTitle = "Stella";
				secondaryStyle = "Laser";
				secondaryExpNeeded = LaserExpNeeded[secondaryLevel];
				break;
				
				case 5:
				secondaryTitle = "Ensis";
				secondaryStyle = "Melee";
				secondaryExpNeeded = MeleeExpNeeded[secondaryLevel];
				break;
				
				case 6:
				secondaryTitle = "Decipula";
				secondaryStyle = "Mine";
				secondaryExpNeeded = MineExpNeeded[secondaryLevel];
				break;
				
				case 7:
				secondaryTitle = "Lancea";
				secondaryStyle = "Pierce";
				secondaryExpNeeded = PierceExpNeeded[secondaryLevel];
				break;
				
				case 8:
				secondaryTitle = "Concitus";
				secondaryStyle = "Rapid";
				secondaryExpNeeded = RapidExpNeeded[secondaryLevel];
				break;
				
				case 9:
				secondaryTitle = "Fragor";
				secondaryStyle = "Rocket";
				secondaryExpNeeded = RocketExpNeeded[secondaryLevel];
				break;
				
				case 10:
				secondaryTitle = "Differo";
				secondaryStyle = "Shotgun";
				secondaryExpNeeded = ShotgunExpNeeded[secondaryLevel];
				break;
				
				case 11:
				secondaryTitle = "Hydrus";
				secondaryStyle = "Spread";
				secondaryExpNeeded = SpreadExpNeeded[secondaryLevel];
			}*/
			
		}
		
		/*protected function clearSaves():void
		{
			gc = SharedObject.getLocal("gameConfiguration");
			gc.data.ExistingSave = false;
			gc.flush();
		}*/
		
		/*protected function writeSaves():void
		{
			gc = SharedObject.getLocal("gameConfiguration");
			gc.data.ExistingSave = true;
			gc.flush();
		}*/
	}
}