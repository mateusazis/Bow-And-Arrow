package  
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	
	public class Background extends Entity
	{
		[Embed(source = 'sprites/fundo.png')] private const IMGFUNDO:Class;
		
		public function Background() 
		{
			graphic = new Backdrop(IMGFUNDO);
		}
		
	}

}