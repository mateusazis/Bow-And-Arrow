package  
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	public class Fase extends World
	{
		protected var numberOfTargets : int;
		public function Fase() 
		{
			trace("const super");
			add(new Background);
			add(new Player);
			addTargets();
			add(Score.getInstance());
		}
		
		//avança de level no modo teste
		override public function update() : void {
			super.update();
			if (Input.pressed(Key.ENTER))
				avancarFase();
		}
		
		public function addTargets() : void {}
		
		public function decrementTargets() : void {
			numberOfTargets--;
			if (numberOfTargets <= 0)
				avancarFase();
		}
		
		private function avancarFase() : void {
			remove(Score.getInstance());
			var f : Fase = getNextLevel();
			FP.world = f;
		}
		
		protected function getNextLevel() : Fase { return null; }
		
	}

}