package
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	
	import raj.soundlite.MBG;
	import raj.soundlite.MSFX;
	import raj.soundlite.MSound;
	import raj.soundlite.MSoundGroup;

	public class SoundLite extends Sprite
	{
		private var gem0:MSound = new MSound(new Embeds.gem0_mp3());
		private var gem1:MSound = new MSound(new Embeds.gem1_mp3());
		private var gem2:MSound = new MSound(new Embeds.gem2_mp3());
		private var gem3:MSound = new MSound(new Embeds.gem3_mp3());
		private var gem4:MSound = new MSound(new Embeds.gem4_mp3());
		private var allgems:Array = new Array(gem0, gem1, gem2, gem3, gem4);
		private var gems:MSoundGroup = new MSoundGroup(allgems);
		
		private var msound:MSound = new MSound(new Embeds.bg1_mp3(), 1000, 0.4);
		private var msound1:MSound = new MSound(new Embeds.bg2_mp3(), 1000, 2);
		private var allbgs:Array = new Array(msound, msound1);
		
		public function SoundLite()
		{
			//always to be called first in any application
			MBG.init();
			MSFX.init();
			
			//set up the instructions
			var instructions:TextField = new TextField();
			instructions.width = 500; instructions.height = 500;
			instructions.selectable = false;
			instructions.x = 40; instructions.y = 40;
			var tf:TextFormat = new TextFormat("sans serif", 22);
			instructions.defaultTextFormat = tf;
			instructions.text = "Press keys 6 or 7 for playing BG music \n" +
								"Press M to toggle mute BG \n \n" +
								"Press keys 1 to 5 for playing SFX \n" +
								"Press N to toggle mute SFX \n";
								"Press SPACE to play a random SFX";
			addChild(instructions);
			
			//finally the event listener for keyboard
			stage.addEventListener(KeyboardEvent.KEY_UP, keyHandle, false, 0, true);
		}
		
		
		private function keyHandle(e:KeyboardEvent):void
		{
			if (e.keyCode >= Keyboard.NUMBER_1 && e.keyCode <= Keyboard.NUMBER_5)
			{
				MSFX.play(allgems[e.keyCode - Keyboard.NUMBER_1]);
			}
			else if (e.keyCode == Keyboard.NUMBER_6 || e.keyCode == Keyboard.NUMBER_7)
			{
				MBG.play(allbgs[e.keyCode - Keyboard.NUMBER_6]);
			}
			else if (e.keyCode == Keyboard.M)
				MBG.toggleMute();
			else if (e.keyCode == Keyboard.N)
				MSFX.toggleMute();
		}
	}
}