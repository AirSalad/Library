package  
{
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.plugin.photonstorm.FlxMovieWeapon;
	
	public class EnemyBulletManager extends FlxGroup
	{	
		//Small 20x20/Medium 30x30/Large 45x45/Extra Large 150x150/Extra extra Large 250x250
		[Embed(source = '../assets/bullet.png')]private var bulletPNG:Class;
		
		[Embed(source = '../assets/playerExplosion.png')]private var explosionPNG:Class;
		[Embed(source = '../assets/playerSmash.png')]private var smashPNG:Class;
		
		[Embed(source = '../assets/bullet.png')]private var basicPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var flamePNG:Class;
		[Embed(source = '../assets/bullet.png')]private var gravityPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var knockbackPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var laserPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var meleePNG:Class;
		[Embed(source = '../assets/bullet.png')]private var minePNG:Class;
		[Embed(source = '../assets/bullet.png')]private var piercePNG:Class;
		[Embed(source = '../assets/bullet.png')]private var rapidPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var rocketPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var shotgunPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var spreadPNG:Class;
		
		private var bulletMC:MovieClip;
		
		private var basicMC:MovieClip;
		private var flameMC:MovieClip;
		private var gravityMC:MovieClip;
		private var knockbackMC:MovieClip;
		private var laserMC:MovieClip;
		private var meleeMC:MovieClip;
		private var mineMC:MovieClip;
		private var pierceMC:MovieClip;
		private var rapidMC:MovieClip;
		private var rocketMC:MovieClip;
		private var shotgunMC:MovieClip;
		private var spreadMC:MovieClip;
		
		
		
		private var explosionMC:MovieClip;

		
		public var currentWeapon:Object = { wId:int,
											wType:String,
											wDamage:int,
											wFireRate:int,
											wVelocity:int,
											wMaxSpeed:int,
											wCurrentExp:int,
											wMaxExp:int,
											wCurrentLevel:int,
											wMaxLevel:int,
											wGoldCost:int };
	
		//private var enemyReaction:* = PlayState.enemies.bulletHitEnemy;
		public var primaryWeapon:FlxMovieWeapon;
		public var explosionWeapon:FlxMovieWeapon;
		public var bombWeapon:FlxWeapon;
		//public var testbombWeapon:FlxWeapon;
		public var primaryMovieWeapon:FlxMovieWeapon;
		//public var explosionWeapon:FlxWeapon;
		
		
		private var defaultObject:Object = {   wId:int,
											wType:String,
											wBulletPool:int,
											wMagSize:int,
											wReloadSpeed:int,
											wBulletsFired:int,
											wCurrentLevel:int,
											wDamage:int,
											wLife:int,
											wFireRate:int,
											wVelocity:int,
											wMaxSpeed:int };
		
		private var basicObject:Object = {   wId:int,
											wType:String,
											wBulletPool:int,
											wMagSize:int,
											wMagSpeed:int,
											wReloadSpeed:int,
											wBulletsFired:int,
											wCurrentLevel:int,
											wDamage:int,
											wLife:int,
											wFireRate:int,
											wVelocity:int,
											wMaxSpeed:int };
		private var flameObject:Object;
		private var gravityObject:Object;
		private var knockbackObject:Object;
		private var laserObject:Object;
		private var meleeObject:Object;
		private var mineObject:Object;
		private var pierceObject:Object;
		private var rapidObject:Object;
		private var rocketObject:Object;
		private var shotgunObject:Object;
		private var spreadObject:Object;
		
		private var explosiveObject:Object;
		
		public var rocketPositionX:Number;
		public var rocketPositionY:Number;
		
		public function EnemyBulletManager() 
		{
			super();
			
			bulletMC = new BasicBullet;
			basicMC = new BasicBullet;
			flameMC = new BasicBullet;
			gravityMC = new BasicBullet;
			knockbackMC = new BasicBullet;
			laserMC = new BasicBullet;
			meleeMC = new MeleeBullet;
			mineMC = new MineBullet;
			pierceMC = new PierceBullet;
			rapidMC = new BasicBullet;
			rocketMC = new BasicBullet;
			shotgunMC = new BasicBullet;
			spreadMC = new BasicBullet;
			
			explosionMC = new ExplosiveBullet;
			
		}
		private function loadWeaponData():void
		{
			/////////////////////////////////////////BULLETS/////////////////////////////////////////////////
			
			basicObject = { wId: 0,
							wType: "Basic",
							wBulletPool: 40,
							wMagSize: 1,
							wMagSpeed: 500,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 100,
							wLife: 2000,
							wFireRate: 0,
							wVelocity: 1000,
							wMaxSpeed: 600 };
			
			flameObject = { wId: 1,
							wType: "Flame",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 4,
							wLife: 700,
							wFireRate: 50,
							wVelocity: 250,
							wMaxSpeed: 100 };
			
			gravityObject = { wId: 2,
							wType: "Gravity",
							wBulletPool: 40,
							wMagSize: 2,
							wMagSpeed: 250,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 20000,
							wFireRate: 50,
							wVelocity: 500,
							wMaxSpeed: 600 };
			
			knockbackObject = { wId: 3,
							wType: "Knockback",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 20000,
							wFireRate: 500,
							wVelocity: 1000,
							wMaxSpeed: 600 };
			
			laserObject = { wId: 4,
							wType: "Laser",
							wBulletPool: 120,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 700,
							wFireRate: 2,
							wVelocity: 500,
							wMaxSpeed: 600 };
							
			meleeObject = { wId: 5,
							wType: "Melee",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 10,
							wLife: 100,
							wFireRate: 500,
							wVelocity: 0,
							wMaxSpeed: 0 };
							
			mineObject = { wId: 6,
							wType: "Mine",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 10000,
							wFireRate: 1000,
							wVelocity: 0,
							wMaxSpeed: 0 };
							
			pierceObject = { wId: 7,
							wType: "Pierce",
							wBulletPool: 40,
							wMagSize: 3,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 2000,
							wFireRate: 750,
							wVelocity: 750,
							wMaxSpeed: 750 };
							
			rapidObject = { wId: 8,
							wType: "Rapid",
							wBulletPool: 40,
							wMagSize: 5,
							wMagSpeed: 1000,
							wReloadSpeed: 100,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 20000,
							wFireRate: 50,
							wVelocity: 500,
							wMaxSpeed: 600 };
							
			rocketObject = { wId: 9,
							wType: "Rocket",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 20000,
							wFireRate: 500,
							wVelocity: 500,
							wMaxSpeed: 600 };
							
			shotgunObject = { wId: 10,
							wType: "Shotgun",
							wBulletPool: 40,
							wMagSize: 4,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 1000,
							wFireRate: 0,
							wVelocity: 700,
							wMaxSpeed: 600 };
							
			spreadObject = { wId: 11,
							wType: "Spread",
							wBulletPool: 40,
							wMagSize: 7,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 20000,
							wFireRate: 0,
							wVelocity: 500,
							wMaxSpeed: 600 };
							
			explosiveObject = { wId: 20,
							wType: "Exposive",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 200,
							wFireRate: 0,
							wVelocity: 0,
							wMaxSpeed: 0 };
		}
		public function loadWeapons():void
		{
			switch (GameConfig._primaryId)
			{
				case 0://Basic
				/*primaryMovieWeapon = new FlxMovieWeapon("Basic", PlayState.playerCenter);
				//primaryMovieWeapon.makeImageBullet(basicObject.wBulletPool, bulletPNG);
				primaryMovieWeapon.makeMovieBullet(basicObject.wBulletPool, basicMC);
				primaryMovieWeapon.setBulletDamage(basicObject.wDamage);
				primaryMovieWeapon.setFireRate(basicObject.wFireRate);
				primaryMovieWeapon.setBulletLifeSpan(basicObject.wLife);
				primaryMovieWeapon.setBulletSpeed(basicObject.wVelocity);
				primaryMovieWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryMovieWeapon.setBulletMagazine(basicObject.wMagSize, basicObject.wMagSpeed);
				add(primaryMovieWeapon.group);*/
					
				primaryWeapon = new FlxMovieWeapon("Basic", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(basicObject.wBulletPool, bulletPNG);
				primaryWeapon.makeMovieBullet(basicObject.wBulletPool, basicMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(basicObject.wDamage);
				primaryWeapon.setFireRate(basicObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(basicObject.wLife);
				primaryWeapon.setBulletSpeed(basicObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(basicObject.wMagSize, basicObject.wMagSpeed);
				add(primaryWeapon.group);
				break;
				
				case 1://Flame
				primaryWeapon = new FlxMovieWeapon("Flame", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(flameObject.wBulletPool, flamePNG);
				primaryWeapon.makeMovieBullet(flameObject.wBulletPool, flameMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(flameObject.wDamage);
				primaryWeapon.setFireRate(flameObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(flameObject.wLife);
				primaryWeapon.setBulletSpeed(flameObject.wVelocity);
				primaryWeapon.setBulletRandomFactor(30, 100);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(flameObject.wMagSize, flameObject.wMagSpeed);
				add(primaryWeapon.group);
				break;
				
				case 2://Gravity
				primaryWeapon = new FlxMovieWeapon("Gravity", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(gravityObject.wBulletPool, gravityPNG);
				primaryWeapon.makeMovieBullet(gravityObject.wBulletPool, gravityMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(gravityObject.wDamage);
				primaryWeapon.setFireRate(gravityObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(gravityObject.wLife);
				primaryWeapon.setBulletSpeed(gravityObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletGravity(0, 1500);
				primaryWeapon.setBulletMagazine(gravityObject.wMagSize, gravityObject.wMagSpeed);
				add(primaryWeapon.group);
				break;
				
				case 3://Knockback
				primaryWeapon = new FlxMovieWeapon("Knockback", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(knockbackObject.wBulletPool, knockbackPNG);
				primaryWeapon.makeMovieBullet(knockbackObject.wBulletPool, knockbackMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(knockbackObject.wDamage);
				primaryWeapon.setFireRate(knockbackObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(knockbackObject.wLife);
				primaryWeapon.setBulletSpeed(knockbackObject.wVelocity);
				primaryWeapon.setBulletElasticity(1);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(knockbackObject.wMagSize, knockbackObject.wMagSpeed);
				add(primaryWeapon.group);
				break;
				
				case 4://Laser
				primaryWeapon = new FlxMovieWeapon("Basic", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(laserObject.wBulletPool, laserPNG);
				primaryWeapon.makeMovieBullet(laserObject.wBulletPool, laserMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(laserObject.wDamage);
				primaryWeapon.setFireRate(laserObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(laserObject.wLife);
				primaryWeapon.setBulletSpeed(laserObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(laserObject.wMagSize, laserObject.wMagSpeed);
				add(primaryWeapon.group);
				break;
				
				case 5://Melee
				primaryWeapon = new FlxMovieWeapon("Melee", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(meleeObject.wBulletPool, meleePNG);
				//primaryWeapon.makePixelBullet(40, 100, 100, 0xffffffff, -50, -50);
				primaryWeapon.makeMovieBullet(meleeObject.wBulletPool, meleeMC, 0, 0, 250, 250);
				primaryWeapon.setBulletDamage(meleeObject.wDamage);
				primaryWeapon.setFireRate(meleeObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(meleeObject.wLife);
				primaryWeapon.setBulletSpeed(meleeObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -125, -125);
				primaryWeapon.setBulletMagazine(meleeObject.wMagSize, meleeObject.wMagSpeed);
				add(primaryWeapon.group);
				break;
				
				case 6://Mine
				primaryWeapon = new FlxMovieWeapon("Mine", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(mineObject.wBulletPool, minePNG);
				primaryWeapon.makeMovieBullet(mineObject.wBulletPool, mineMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(mineObject.wDamage);
				primaryWeapon.setFireRate(mineObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(mineObject.wLife);
				primaryWeapon.setBulletSpeed(mineObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(mineObject.wMagSize, mineObject.wMagSpeed);
				add(primaryWeapon.group);
				
				explosionWeapon = new FlxMovieWeapon("Explosion", PlayState.bulletCenter);//primaryWeapon);
				//explosionWeapon.makeImageBullet(mineObject.wBulletPool, explosionPNG);
				explosionWeapon.makeMovieBullet(explosiveObject.wBulletPool, explosionMC, 0, 0, 150, 150);
				explosionWeapon.setBulletDamage(explosiveObject.wDamage);
				explosionWeapon.setFireRate(explosiveObject.wFireRate);
				explosionWeapon.setBulletLifeSpan(explosiveObject.wLife);
				explosionWeapon.setBulletSpeed(explosiveObject.wVelocity);
				explosionWeapon.setParent(PlayState.bulletCenter, "x", "y", -75, -75);
				explosionWeapon.setBulletMagazine(explosiveObject.wMagSize, explosiveObject.wMagSpeed);
				add(explosionWeapon.group);
				break;
				
				
				
				case 7://Pierce
				primaryWeapon = new FlxMovieWeapon("Pierce", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(pierceObject.wBulletPool, piercePNG);
				primaryWeapon.makeMovieBullet(pierceObject.wBulletPool, pierceMC, 0, 0, 30, 30);
				primaryWeapon.setBulletDamage(pierceObject.wDamage);
				primaryWeapon.setFireRate(pierceObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(pierceObject.wLife);
				primaryWeapon.setBulletSpeed(pierceObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -15, -15);
				primaryWeapon.setBulletElasticity(1);
				primaryWeapon.setBulletMagazine(pierceObject.wMagSize, pierceObject.wMagSpeed);
				add(primaryWeapon.group);
				break;
				
				case 8://Rapid
				primaryWeapon = new FlxMovieWeapon("Rapid", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(rapidObject.wBulletPool, rapidPNG);
				primaryWeapon.makeMovieBullet(rapidObject.wBulletPool, rapidMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(rapidObject.wDamage);
				primaryWeapon.setFireRate(rapidObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(rapidObject.wLife);
				primaryWeapon.setBulletSpeed(rapidObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(rapidObject.wMagSize, rapidObject.wMagSpeed);
				add(primaryWeapon.group);
				break;
				
				case 9://Rocket
				primaryWeapon = new FlxMovieWeapon("Rocket", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(rocketObject.wBulletPool, rocketPNG);
				primaryWeapon.makeMovieBullet(rocketObject.wBulletPool, rocketMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(rocketObject.wDamage);
				primaryWeapon.setFireRate(rocketObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(rocketObject.wLife);
				primaryWeapon.setBulletSpeed(rocketObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(rocketObject.wMagSize, rocketObject.wMagSpeed);
				add(primaryWeapon.group);
				
				explosionWeapon = new FlxMovieWeapon("Explosion", PlayState.bulletCenter);//primaryWeapon);
				//explosionWeapon.makeImageBullet(mineObject.wBulletPool, explosionPNG);
				//explosionWeapon.makePixelBullet(40, 150, 150, 0xffffffff, -75, -75);
				explosionWeapon.makeMovieBullet(explosiveObject.wBulletPool, explosionMC, 0, 0, 150, 150);
				explosionWeapon.setBulletDamage(explosiveObject.wDamage);
				explosionWeapon.setFireRate(explosiveObject.wFireRate);
				explosionWeapon.setBulletLifeSpan(explosiveObject.wLife);
				explosionWeapon.setBulletSpeed(explosiveObject.wVelocity);
				explosionWeapon.setParent(PlayState.bulletCenter, "x", "y", -75, -75);
				explosionWeapon.setBulletMagazine(explosiveObject.wMagSize, explosiveObject.wMagSpeed);
				add(explosionWeapon.group);
				break;
				
				case 10://Shotgun
				primaryWeapon = new FlxMovieWeapon("Shotgun", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(shotgunObject.wBulletPool, shotgunPNG);
				primaryWeapon.makeMovieBullet(shotgunObject.wBulletPool, shotgunMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(shotgunObject.wDamage);
				primaryWeapon.setFireRate(shotgunObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(shotgunObject.wLife);
				primaryWeapon.setBulletSpeed(shotgunObject.wVelocity);
				primaryWeapon.setBulletRandomFactor(15, 150);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(shotgunObject.wMagSize, shotgunObject.wMagSpeed);
				add(primaryWeapon.group);
				break;
				
				case 11://Spread
				primaryWeapon = new FlxMovieWeapon("Spread", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(spreadObject.wBulletPool, spreadPNG);
				primaryWeapon.makeMovieBullet(spreadObject.wBulletPool, spreadMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(spreadObject.wDamage);
				primaryWeapon.setFireRate(spreadObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(spreadObject.wLife);
				primaryWeapon.setBulletSpeed(spreadObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(spreadObject.wMagSize, spreadObject.wMagSpeed);
				add(primaryWeapon.group);
				
				break;
			}
			
		}
		
		public function createExplosive(bullet:FlxObject, enemy:FlxObject):void
		{
			//trace("Rocket Dispatched");
			
			enemy.hurt(bullet.damage);
			
			rocketPositionX = bullet.x;
			rocketPositionY = bullet.y;
			
			//trace(rocketPositionX);
			//trace(rocketPositionY);
			
			//rocketBulletSubA.setFiringPosition(rocketPositionX, rocketPositionY, 0, 0);
			//rocketBulletSubA.fire();
			
			FlxG.score += 5;
			
			bullet.kill();
		}
	}

}