package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Lord_X
	 */
	public class Player extends Entity
	{
		[Embed(source = 'sprites/hero_without_arrow.png')] private const UNARMED:Class;
		[Embed(source = 'sprites/hero_stand.png')] private const STAND:Class;
		[Embed(source = 'sprites/hero_armed.png')] private const ARMED:Class;
		
		private var imgArmed : Image;
		private var imgStand : Image;
		private var imgUnarmed : Image;
		private var state: int;
		private const STATE_ARMED : int = 0;
		private const STATE_STAND : int = 1;
		private const STATE_UNARMED : int = 2;
		
		public function Player() 
		{
			imgArmed = new Image(ARMED);
			imgUnarmed = new Image(UNARMED);
			imgStand = new Image(STAND);
			setState(STATE_STAND);
		}
		
		private function setState(newState : int) : void {
			var newSprite : Image;
			switch(newState) {
				case STATE_ARMED:
					newSprite = imgArmed;
					break;
				case STATE_UNARMED:
					newSprite = imgUnarmed;
					break;
				case STATE_STAND:
					newSprite = imgStand;
					break;
			}
			state = newState;
			graphic = newSprite;
			width = newSprite.width;
			height = newSprite.height;
		}
		
		private function adjustY() : void {
			y = Input.mouseY - height / 2;
			if (y < 0)
				y = 0;
			if (y + height > 600)
				y = 600 - height;
		}
		
		private function proccessInput() : void {
			switch(state) {
				case STATE_UNARMED:
					if (Input.mouseReleased)
						setState(STATE_STAND);
					break;
				case STATE_STAND:
					if (Input.mousePressed)
						setState(STATE_ARMED);
					break;
				case STATE_ARMED:
					if (Input.mouseReleased){
						setState(STATE_UNARMED);
						shootArrow();
					}
					break;
			}
		}
		
		private function shootArrow() : void {
			var arrow : Arrow = new Arrow(x + width, y + 40);
			FP.world.add(arrow);
		}
		
		override public function update() : void {
			adjustY();
			proccessInput();
		}		
	}

}