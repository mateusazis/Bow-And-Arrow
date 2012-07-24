package  
{
	import flash.display.LineScaleMode;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	public class Target extends Entity
	{
		private var isObjective : Boolean = true;
		protected var alive : Boolean = true;
		
		public function Target(x : Number, y : Number) {
			super(x, y);
			type = "target";
		}
		
		protected function setIsObjective(value : Boolean) : void {
			isOobjective = value;
		}
		
		protected function disappear() : void {
			var fase : Fase = FP.world as Fase;
			fase.remove(this);
			if(isOobjective)
				fase.decrementTargets();
		}
		
		public function die() : void {
			
		}
		
	}

}