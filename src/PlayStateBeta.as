package  
{
	import flash.display.MorphShape;
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	//import org.flixel.data.FlxAnim;
	import org.flixel.FlxG;
	import org.flixel.FlxCamera;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.plugin.photonstorm.BaseTypes.Bullet;
	import org.flixel.plugin.photonstorm.FlxDelay;

	public class PlayState extends FlxState
	{
		[Embed(source = '../assets/Stage.png')] private var backgroundPNG:Class;
		//[Embed(source = '../assets/Stages.swf')] private var _backgroundMC:Class;
		
		//[Embed(source = '../assets/bullet.png')]private var bulletPNG:Class;
		//[Embed(source = '../assets/playerExplosion.png')]private var explosionPNG:Class;
		//[Embed(source = '../assets/playerSmash.png')]private var smashPNG:Class;
		//[Embed(source = '../assets/playerMine.png')]private var minePNG:Class;
		
		private var menuDelay:FlxDelay;
		
		private var pierce:Boolean = false;
		/*private var enemyReaction:* = Registry.enemies.bulletHitEnemy;
		
		private var normalBulletA:FlxWeapon;
		
		private var rapidBulletA:FlxWeapon;
		
		private var bouncingBulletA:FlxWeapon;
		
		private var shotgunBulletA:FlxWeapon;
		private var shotgunBulletB:FlxWeapon;
		private var shotgunBulletC:FlxWeapon;
		private var shotgunBulletD:FlxWeapon;
		private var shotgunBulletE:FlxWeapon;
		
		private var spreadBulletA:FlxWeapon;
		private var spreadBulletB:FlxWeapon;
		private var spreadBulletC:FlxWeapon;
		
		private var rocketBulletA:FlxWeapon;
		private var rocketBulletSubA:FlxWeapon;
		
		private var smashBulletA:FlxWeapon;
		
		private var mineBulletA:FlxWeapon;
		
		private var equipedBook:String = "Normal";*/
		
		//private var background:FlxSprite;
		
		//private var backgroundMC:MovieClip;
		private var background:FlxSprite;
		//private var backgroundLoaded:Boolean = false;
		
		private var cameraClone:FlxSprite;
		
		private var debug:FlxText;
		private var playerEquip:FlxText;
		private var playerHealth:FlxText;
		private var playerScore:FlxText;
		private var playerLevel:FlxText;
		private var playerAmmo:FlxText;
		private var playerGold:FlxText;
		private var playerWave:FlxText;
		private var playerEnemyCount:FlxText;
		
		public static var playerCenter:centerPoint;
		public static var bulletCenter:bulletCenterPoint;
		public static var goldCenter:goldCenterPoint;
		public static var orb:Orb;
		public static var player:Player;
		public static var playerBullets:BulletManager;
		public static var enemies:EnemyManager;
		
		//private var rocketPositionX:Number;
		//private var rocketPositionY:Number;
		
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void 
		{
			super.create();
			
			//trace(Registry.enemies.waveEvent);
			
			GameConfig._currentState = "Play";
			
			//FlxG.showBounds(0, 0, 3200, 1760);
			FlxG.worldBounds.x = 0;
			FlxG.worldBounds.y = 0;
			FlxG.worldBounds.width = 1400;//3200;
			FlxG.worldBounds.height = 770;//1760;
			FlxG.camera.setBounds(0, 0, 1400, 770);// 3200, 1760);
			
			
			//backgroundMC = _backgroundMC;
			//background.loadMovieClip(backgroundMC, 1395, 767,false, false);
			//add(background);
			//backgroundLoaded = true;
			//backgroundMC.gotoAndPlay(1);
			
			background = new FlxSprite(0, 0, backgroundPNG);
			add(background);
			
			
			debug = new FlxText(0, 0, 400, "");
			playerEquip = new FlxText(0, 0, 400, "");
			playerScore = new FlxText(0, 20, 400, "");
			playerHealth = new FlxText(0, 40, 400, "");
			playerLevel = new FlxText(0, 60, 400, "");
			playerAmmo = new FlxText(0, 80, 400, "");
			playerGold = new FlxText(0, 100, 400, "");
			playerWave = new FlxText(0, 120, 400, "");
			playerEnemyCount = new FlxText(0, 140, 400, "");
			
			debug.scrollFactor.x = 0;
			debug.scrollFactor.y = 0;
			playerEquip.scrollFactor.x = 0;
			playerEquip.scrollFactor.y = 0;
			playerHealth.scrollFactor.x = 0;
			playerHealth.scrollFactor.y = 0;
			playerScore.scrollFactor.x = 0;
			playerScore.scrollFactor.y = 0;
			playerLevel.scrollFactor.x = 0;
			playerLevel.scrollFactor.y = 0;
			playerAmmo.scrollFactor.x = 0;
			playerAmmo.scrollFactor.y = 0;
			playerGold.scrollFactor.x = 0;
			playerGold.scrollFactor.y = 0;
			playerWave.scrollFactor.x = 0;
			playerWave.scrollFactor.y = 0;
			playerEnemyCount.scrollFactor.x = 0;
			playerEnemyCount.scrollFactor.y = 0;
			
			//add(Registry.playerConfig);
			//add(Registry);
			//add(Registry.player);
			//add(Registry.orb);
			//add(Registry.enemies);
			///add(Registry.enemyBullets);
			//add(Registry.playerCenter);
			//add(Registry.playerBullets);
			//add(Registry.bulletCenter);
			playerCenter = new centerPoint;
			bulletCenter = new bulletCenterPoint;
			goldCenter = new goldCenterPoint;
			orb = new Orb;
			player = new Player;
			playerBullets = new BulletManager;
			enemies = new EnemyManager;
			
			playerBullets.loadWeapons();
			//Registry.playerBullets.loadWeapons();
			
			//Registry.playerBullets.createWeapons(Registry.player.currentPrimary);
			//Registry.playerBullets.createWeapons(Registry.player.currentSecondary);
			
			//FlxG.camera.follow(Registry.player, 3);
			FlxG.camera.follow(player, 3);
			
			add(playerEquip);
			add(playerHealth);
			add(playerScore);
			add(playerLevel);
			add(playerAmmo);
			add(playerGold);
			add(playerWave);
			add(playerEnemyCount);
			
			//{
			//GameConfig.playerDetails.loadEquipment();
			
			//private var walls:FlxGroup;
			
			//walls = FlxCollision.createCameraWall(FlxG.camera, FlxCollision.CAMERA_WALL_INSIDE, 32, false);
			//}
			
		}
		
		override public function update():void
		{
			super.update();
			
			//REGENERATE HP PER SECOND
			if (Registry.player.health != Registry.player.maxHealth && Registry.player.alive)
			{
				Registry.player.health = Registry.player.health + GameConfig._currentUpgrades[3];
				//trace(GameConfig._currentUpgrades[3]);
			}
			
			if (Registry.player.mana != Registry.player.maxMana && Registry.player.alive)
			{
				Registry.player.mana = Registry.player.mana + GameConfig._currentUpgrades[1];
				//trace(GameConfig._currentUpgrades[3]);
			}
			
			if (Registry.player.mana > 0 && Registry.player.alive && Registry.player.phased)
			{
				Registry.player.mana -= 5;
				//trace(GameConfig._currentUpgrades[3]);
			}
			else if (Registry.player.mana <= 0)
			{
				Registry.player.phased = false;
			}
			
			if (Registry.enemies.waveEvent == "Completed")
			{
				//menuDelay = new FlxDelay(1000);
				//menuDelay.start();
				//menuDelay.callback = changeStates;
				changeStates();
			}
			
			Registry.orb.updateAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter , false));
			
			
			//ENEMY COLLISIONS
			FlxG.overlap(Registry.enemies, Registry.player, Registry.player.enemyHitPlayer);
			
			//GOLD COLLISIONS
			FlxG.overlap(Registry.player, Registry.playerBullets.goldSmall.group, Registry.player.goldHitPlayer);
			FlxG.overlap(Registry.player, Registry.playerBullets.goldMedium.group, Registry.player.goldHitPlayer);
			FlxG.overlap(Registry.player, Registry.playerBullets.goldLarge.group, Registry.player.goldHitPlayer);
			
			//BULLET COLLISIONS
			//PRIMARY
			switch (GameConfig._primaryId)
			{
				//Basic/Gravity/Rapid/Spread
				case 0:	
				case 2:
				case 8:
				case 11:
				FlxG.overlap(Registry.playerBullets.primaryWeapon.group, Registry.enemies, Registry.enemies.bulletHitEnemy);
				//FlxG.collide(Registry.playerBullets.primaryMovieWeapon.group, Registry.enemies, Registry.enemies.bulletHitEnemy);
				break;
				
				//Knockback
				case 3:
				FlxG.collide(Registry.playerBullets.primaryWeapon.group, Registry.enemies, Registry.enemies.bulletHitEnemy);
				break;
				
				//Flame/Laser/Melee/Pierce/Shotgun
				case 1:
				case 4:
				case 5:
				case 7:
				case 10:
				FlxG.overlap(Registry.playerBullets.primaryWeapon.group, Registry.enemies, Registry.enemies.bulletPierceEnemy);
				break;
				
				//Mine/Rocket
				case 6:
				case 9:
				FlxG.overlap(Registry.playerBullets.primaryWeapon.group, Registry.enemies, Registry.enemies.bulletExplodeEnemy);
				FlxG.overlap(Registry.playerBullets.explosionWeapon.group, Registry.enemies, Registry.enemies.bulletPierceEnemy);
				break;
			}
			
			//SECONDARY
			switch (GameConfig._secondaryId)
			{
				//Basic/Gravity/Rapid/Spread
				case 0:	
				case 2:
				case 8:
				case 11:
				FlxG.overlap(Registry.playerBullets.secondaryWeapon.group, Registry.enemies, Registry.enemies.bulletHitEnemy);
				//FlxG.collide(Registry.playerBullets.primaryMovieWeapon.group, Registry.enemies, Registry.enemies.bulletHitEnemy);
				break;
				
				//Knockback
				case 3:
				FlxG.collide(Registry.playerBullets.secondaryWeapon.group, Registry.enemies, Registry.enemies.bulletHitEnemy);
				break;
				
				//Flame/Laser/Melee/Pierce/Shotgun
				case 1:
				case 4:
				case 5:
				case 7:
				case 10:
				FlxG.overlap(Registry.playerBullets.secondaryWeapon.group, Registry.enemies, Registry.enemies.bulletPierceEnemy);
				break;
				
				//Mine/Rocket
				case 6:
				case 9:
				FlxG.overlap(Registry.playerBullets.secondaryWeapon.group, Registry.enemies, Registry.enemies.bulletExplodeEnemy);
				FlxG.overlap(Registry.playerBullets.explosionWeapon.group, Registry.enemies, Registry.enemies.bulletPierceEnemy);
				break;
				
			}
			
			//BOMBS
			switch (GameConfig._primaryId)
			{
				//Basic/Rapid
				case 0:
				case 1:
				
				case 4:
				
				
				
				
				case 11:
				FlxG.overlap(Registry.playerBullets.bombWeapon.group, Registry.enemies, Registry.enemies.bulletPierceEnemy);
				break;
				
				//Pierce
				case 2:	
				case 7:
				case 8:
				case 10:
				FlxG.overlap(Registry.playerBullets.bombMovieWeapon.group, Registry.enemies, Registry.enemies.bulletPierceEnemy);
				break;
				
				//Mine/Rocket
				case 6:
				case 9:
				FlxG.overlap(Registry.playerBullets.bombMovieWeapon.group, Registry.enemies, Registry.enemies.bulletBombExplodeEnemy);
				FlxG.overlap(Registry.playerBullets.bombExplosionWeapon.group, Registry.enemies, Registry.enemies.bulletPierceEnemy);
				break;
				
				//Knockback
				case 3:
				FlxG.collide(Registry.playerBullets.bombWeapon.group, Registry.enemies, Registry.enemies.bulletHitEnemy);
				break;
				
				//Melee
				case 5:
				FlxG.overlap(Registry.playerBullets.bombMovieWeapon.group, Registry.enemies, Registry.enemies.bulletPierceEnemy);
				break;
			}
			
			//ENEMY BULLETS
			//FlxG.overlap(Registry.enemyBullets, Registry.player, Registry.player.bulletHitPlayer);
			
			//PLAYER PHASING
			if (FlxG.keys.justPressed("SHIFT"))
			{
				if (Registry.player.mana > 100 && !Registry.player.phased)
				{
					Registry.player.mana -= 100;
					Registry.player.phased = true;
				}
				else if (Registry.player.phased)
				{
					Registry.player.phased = false;
				}
			}
			//BOMB FIRED
			if (FlxG.keys.pressed("SPACE"))
			{
				switch (GameConfig._primaryId)
				{
					case 0:

					
					
					case 11:
					Registry.playerBullets.bombWeapon.fireSpread(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true), 190, 19);
					break;
					
					//Mine/Rocket
					case 6:
					Registry.playerBullets.bombMovieWeapon.fireMultiple(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true), 3);
					break;
					
					//Rocket
					case 9:
					Registry.playerBullets.bombMovieWeapon.fireSpread(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true), 30, 4);
					break;
					
					//Shotgun
					case 10:
					Registry.playerBullets.bombMovieWeapon.fireMultiple(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true), 10);	
					break;
					
					case 1:
					case 3:
					case 4:
					
					Registry.playerBullets.bombWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
					break;
					
					case 2:
					Registry.playerBullets.bombMovieWeapon.fireSpread(270, 45, 5);
					break;
					
					case 5:
					case 7:
					case 8:
					Registry.playerBullets.bombMovieWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
					break;
				}
				
			}
			//BULLETS FIRED
			if (FlxG.mouse.pressed() && Registry.player.alive)
			{
				//PRIMARY//
				switch (GameConfig._primaryId)
				{
					//Basic/Flame/Gravity/Knockback/Pierce/Melee/Rapid
					case 0:
					case 1:
					case 2:
					case 3:
					case 5:
					case 7:
					case 8:
					Registry.playerBullets.primaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
					//Registry.playerBullets.primaryMovieWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
					break;
					
					//Laser
					case 4:
					Registry.playerBullets.primaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
					break;
					
					//Rocket/Mine
					case 6:
					case 9:
					Registry.playerBullets.primaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
					break;
					
					
					//Shotgun
					case 10:
					Registry.playerBullets.primaryWeapon.fireMultiple(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true), 4)
					break;
					
					//Spread
					case 11:
					Registry.playerBullets.primaryWeapon.fireSpread(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true), 20,4)
					break;
					
				}
				
				switch (GameConfig._secondaryId)
				{
					//Basic/Flame/Gravity/Knockback/Pierce/Melee/Rapid
					case 0:
					case 1:
					case 2:
					case 3:
					case 5:
					case 7:
					case 8:
					Registry.playerBullets.secondaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
					//Registry.playerBullets.primaryMovieWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
					break;
					
					//Laser
					case 4:
					Registry.playerBullets.secondaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
					break;
					
					//Rocket/Mine
					case 6:
					case 9:
					Registry.playerBullets.secondaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
					break;
					
					
					//Shotgun
					case 10:
					Registry.playerBullets.secondaryWeapon.fireMultiple(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true), 4)
					break;
					
					//Spread
					case 11:
					Registry.playerBullets.secondaryWeapon.fireSpread(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true), 20,4)
					break;
					
				}
				
				
				
				
				//SECONDARY//
				//Registry.playerBullets.secondaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(Registry.playerCenter, true));
				
				
			}
			if (FlxG.keys.pressed("P"))
				{
					GameConfig._currentGold += 10000;
					GameConfig._maxGold += 10000;
				}
			if (FlxG.keys.justPressed("ENTER"))
			{
				switchToMenu();
			}
			//UPDATE TEXT DISPLAYS
			//debug.text = "Bullet Pool: " + Registry.playerBullets.primaryWeapon.countLiving() + "/" + Registry.playerBullets.primaryWeapon.length;
			/*playerEquip.text = "Equiped Books: " + GameConfig._primaryId + "/" + GameConfig._secondaryId;// + Registry.playerConfig.currentPrimary.wType + "/" +Registry.playerConfig.currentSecondary.wType;
			playerHealth.text = "Current Health: " + Registry.player.health + "/" + Registry.player.maxHealth;
			playerScore.text = "Current Score: " + FlxG.score;
			playerLevel.text = "Current Mana: " + Registry.player.mana + "/" + Registry.player.maxMana;// + Registry.playerConfig.currentPrimary.wCurrentLevel + ". Exp needed to level up: " + Registry.playerConfig.currentPrimary.wCurrentExp + "/" + Registry.playerConfig.currentPrimary.wMaxExp;
			playerAmmo.text = "Player Phased: " + Registry.player.phased;// + Registry.playerConfig.currentSecondary.wCurrentLevel + ". Exp needed to level up: " + Registry.playerConfig.currentSecondary.wCurrentExp + "/" + Registry.playerConfig.currentSecondary.wMaxExp;
			playerGold.text = "Current Gold: " + GameConfig._currentGold;// + Registry.playerConfig.currentGold;
			playerWave.text = "Current Wave: " + (Registry.enemies.currentWave+1) + "/" + Registry.enemies.maxWaves;
			playerEnemyCount.text = "Enemies remaining: " + Registry.enemies.waveLength + "/" + Registry.enemies.waveTotal;*/
			
			playerEquip.text = "Equiped Books: " + GameConfig._primaryId + "/" + GameConfig._secondaryId;// + Registry.playerConfig.currentPrimary.wType + "/" +Registry.playerConfig.currentSecondary.wType;
			playerHealth.text = "Current Health: " + player.health + "/" + player.maxHealth;
			playerScore.text = "Current Score: " + FlxG.score;
			playerLevel.text = "Current Mana: " + player.mana + "/" + player.maxMana;// + Registry.playerConfig.currentPrimary.wCurrentLevel + ". Exp needed to level up: " + Registry.playerConfig.currentPrimary.wCurrentExp + "/" + Registry.playerConfig.currentPrimary.wMaxExp;
			playerAmmo.text = "Player Phased: " + player.phased;// + Registry.playerConfig.currentSecondary.wCurrentLevel + ". Exp needed to level up: " + Registry.playerConfig.currentSecondary.wCurrentExp + "/" + Registry.playerConfig.currentSecondary.wMaxExp;
			playerGold.text = "Current Gold: " + GameConfig._currentGold;// + Registry.playerConfig.currentGold;
			playerWave.text = "Current Wave: " + (enemies.currentWave+1) + "/" + enemies.maxWaves;
			playerEnemyCount.text = "Enemies remaining: " + enemies.waveLength + "/" + enemies.waveTotal;
			
			/*if (Registry.enemies.waveEvent == "Completed")
			{
				changeStates();
			}*/
		}
		public function changeStates():void
		{
			if (GameConfig._currentLevel == GameConfig._maxLevel && GameConfig._maxLevel < 12)
			{
				GameConfig._maxLevel += 1;
			}
			GameConfig.saveConfigToData();
			/*remove(Registry.player);
			remove(Registry.orb);
			remove(Registry.enemies);
			remove(Registry.playerCenter);
			remove(Registry.playerBullets);
			
			remove(playerEquip);
			remove(playerHealth);
			remove(playerScore);
			remove(playerLevel);
			remove(playerAmmo);
			remove(playerGold);
			remove(playerWave);
			remove(playerEnemyCount);*/
			//Registry.playerCenter.destroy();
			//Registry.bulletCenter.destroy();
			//Registry.goldCenter.destroy();
			//Registry.orb.destroy();
			//Registry.player.destroy();
			//Registry.playerBullets.clear();
			//Registry.enemies.destroy();
			
			//Registry.enemies.waveEvent = "Summoning";
			enemies.waveEvent = "Summoning";
			
			remove(playerCenter);
			remove(bulletCenter);
			remove(goldCenter);
			remove(orb);
			remove(player);
			remove(playerBullets);
			remove(enemies);
			
			//remove(Registry.playerCenter);
			//remove(Registry.bulletCenter);
			//remove(Registry.goldCenter);
			//remove(Registry.orb);
			//remove(Registry.player);
			//remove(Registry.playerBullets);
			//remove(Registry.enemies);
			//Registry.playerCenter.destroy();
			//Registry.bulletCenter.destroy();
			//Registry.goldCenter.destroy();
			//Registry.orb.destroy();
			//Registry.player.destroy();
			//Registry.playerBullets.destroy();
			//Registry.enemies.destroy();
			
			
			//remove(Registry);
			//Registry.player.x = 3200 / 2;
			//Registry.player.y = 1760 / 2;
			
			//Registry.enemies.waveEvent = "Summoning";
			//FlxG.switchState(new MenuState);
			
			//destroy();
			
			//FlxG.resetState();
			//GameConfig._waveEvent = "Summoning";
			
		}
		private function switchToMenu():void
		{
			FlxG.switchState(new MenuState);
		}
	}
}