package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	public class Buterfly extends Target
	{
		[Embed(source = 'sprites/butterfly.png')] private const BUTTERFLY_FREE:Class;
		[Embed(source = 'sprites/butterfly_bubled.png')] private const BUTTERFLY_BUBLED:Class;
		private static var generalSpeed : Number = 600 / 5;
		private var speed : Number;
		private static const flyAwaySpeed : Number = 100;
		private var imgFree : Image;
		
		public function Buterfly(x : Number, y : Number) 
		{
			super(x, y);
			var imgBubled : Image = new Image(BUTTERFLY_BUBLED);
			imgFree = new Image(BUTTERFLY_FREE);
			graphic = imgBubled;
			setHitboxTo(imgBubled);
			if (Math.random() > 0.5)
				speed *= -1;
			speed = generalSpeed;
		}
		
		override public function update() : void {
			if (alive) {
				y += speed * FP.elapsed;
				if (y <= 0)
					speed = generalSpeed;
				if(y + height >= 600)
					speed = -generalSpeed;
			} else {
				var decrement : Number = FP.elapsed * flyAwaySpeed;
				x -= decrement;
				y -= decrement;
				if (x + width <= 0 || y + height <= 0)
					FP.world.remove(this);
			}
		}
		
		override public function die() : void {
			if (alive) {
				alive = false;
				var oldHeight : int = height;
				graphic = imgFree;
				y = y + oldHeight - imgFree.height;
				Score.getInstance().increaseScore(100);
			}
		}
		
	}

}