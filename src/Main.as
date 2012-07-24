package 
{
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import splash.Splash;
	
	public class Main extends Engine
	{
		
		public function Main()
		{
			super(800, 600, 60, false);
		}
		
		override public function init():void 
		{
			splashComplete();
			//var s:Splash = new Splash;
			//FP.world.add(s);
			//s.start(splashComplete);
		}
		
		public function splashComplete():void
		{
			FP.world = new Fase1;
		}
	}
}