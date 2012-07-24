package  
{
	import net.flashpunk.FP;
	public class Fase2 extends Fase
	{		
		override public function addTargets() : void {
			numberOfTargets = 10;
			var ballonX : Number = 200;
			for (var i : int = 0; i < 10; i++)
				add(new Balloon(ballonX + Math.random() * 601 - 25, Math.random() * 601 - 39, 600 / 5));
			for (i = 0; i < 5; i++)
				add(new YellowBalloon(ballonX + Math.random() * 601 - 25, Math.random() * 601 - 39, 600 / 5));
		}
		
		override protected function getNextLevel() : Fase {
			return new Fase3;
		}
	}
}