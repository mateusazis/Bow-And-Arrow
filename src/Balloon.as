package  
{
	import flash.display.LineScaleMode;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Balloon extends Target
	{
		[Embed(source = 'sprites/ballon.png')] private const IMG_BALLOON:Class;
		[Embed(source = 'sprites/ballon_dead.png')] private const IMG_BALLOON_DEAD:Class;
		private var upSpeed : Number;
		protected var deadImg : Image;
		private static const fallingSpeed : Number = 600 / 3;
		
		protected var scoreIncrement : int = 100;
		
		public function Balloon(x : Number, y : Number, speed : Number) 
		{
			super(x, y);
			upSpeed = -speed;
			var img : Image = new Image(IMG_BALLOON);
			deadImg = new Image(IMG_BALLOON_DEAD);
			graphic = img;
			setHitbox(img.width, 25);
		}
		
		override public function update() : void {
			var variation : Number = FP.elapsed * (alive ? upSpeed : fallingSpeed);
			y += variation;
			if (!alive && y >= 600)
				disappear();
			if (y + height < 0)
				y = 600;
		}
		
		override public function die(): void {
			if (alive) {
				alive = false;
				var oldWidth : int = width;
				graphic = deadImg;
				x = x + (oldWidth - deadImg.width) / 2;
				Score.getInstance().increaseScore(scoreIncrement);
			}
		}
		
	}

}