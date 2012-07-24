package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Arrow extends Entity
	{
		[Embed(source = 'sprites/arrow.png')] private const IMG_ARROW:Class;
		private var speed : Number = 800 / 2;
		
		public function Arrow(x : Number, y : Number) 
		{
			super(x, y);
			var img : Image = new Image(IMG_ARROW);
			graphic = img;
			y -= img.height / 2;
			setHitboxTo(img);
			type = "arrow";
			FP.world.bringToFront(this);
		}
		
		override public function update() : void {
			x += FP.elapsed * speed;
			if (x >= 800)
				FP.world.remove(this);
			var target : Target = collide("target", x, y) as Target;
			if (target)
				target.die();
		}
		
	}

}