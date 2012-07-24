package  
{
	import net.flashpunk.FP;
	public class Fase3 extends Fase
	{		
		override public function addTargets() : void {
			numberOfTargets = 10;
			var ballonX : Number = 200;
			for (var i : int = 0; i < 10; i++)
				add(new Buterfly(ballonX + Math.random() * 601 - 35, Math.random() * 601 - 32));
		}
		
		override protected function getNextLevel() : Fase {
			return new Fase1;
		}
	}
}