package  
{
	import net.flashpunk.FP;
	public class Fase1 extends Fase
	{		
		override public function addTargets() : void {
			numberOfTargets = 10;
			var ballonX : Number = 200;
			for (var i : int = 0; i < 10; i++)
				add(new Balloon(ballonX + i * 25, 500, 600 / 5));
		}
		
		override protected function getNextLevel() : Fase {
			return new Fase2;
		}
	}
}