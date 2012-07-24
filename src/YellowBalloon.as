package  
{
	import net.flashpunk.graphics.Image;
	public class YellowBalloon  extends Balloon
	{
		[Embed(source = 'sprites/ballon_yellow.png')] private const IMG_BALLOON_YELLOW:Class;
		[Embed(source = 'sprites/ballon_yellow_dead.png')] private const IMG_BALLOON_YELLOW_DEAD:Class;
		
		public function YellowBalloon(x : Number, y : Number, speed : Number) 
		{
			super(x, y, speed);
			var img : Image = new Image(IMG_BALLOON_YELLOW);
			graphic = img;
			deadImg = new Image(IMG_BALLOON_YELLOW_DEAD);
			scoreIncrement = -100;
			setIsObjective(false);
		}
		
	}

}