package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	public class Score extends Entity 
	{
		private var score : int = 0;
		private var txt : Text;
		public static var instance : Score;
		
		public function Score() 
		{
			txt = new Text("Score: " + score, 600, 0);
			graphic = txt;
			instance = this;
		}
		
		public static function create(value : int) : Score{
			var resp : Score = new Score;
			resp.score = value;
			return resp;
		}
		
		public function getValue() : int {
			return score;
		}
		
		override public function update(): void {
			trace("score updated");
		}
		
		override public function render() : void {
			trace("rendered");
			super.render();
		}
		
		public static function getInstance() : Score {
			trace("get instance");
			if (!instance)
				instance = new Score;
			return instance;
		}
		
		public function increaseScore(amount : int) : void {
			score += amount;
			txt.text = "Score: " + score;
		}
		
	}

}