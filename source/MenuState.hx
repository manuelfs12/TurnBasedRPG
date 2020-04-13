package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;

class MenuState extends FlxState {
	var playButton:FlxButton;
	var titleText:FlxText;
	var optionsButton:FlxButton;

	#if desktop
	var exitButton:FlxButton;
	#end

	override public function create() {
		titleText = new FlxText(20, 0, 0, "HaxeFlixel\nTutorial\nGame", 22);
		titleText.alignment = CENTER;
		titleText.screenCenter(X);
		add(titleText);

		playButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.onUp.sound = FlxG.sound.load(AssetPaths.select__wav);
		playButton.x = (FlxG.width / 2) - playButton.width - 10;
		playButton.y = FlxG.height - playButton.height - 10;
		add(playButton);

		optionsButton = new FlxButton(0, 0, "Options", clickOptions);
		optionsButton.onUp.sound = FlxG.sound.load(AssetPaths.select__wav);
		optionsButton.x = (FlxG.width / 2) + 10;
		optionsButton.y = FlxG.height - optionsButton.height - 10;
		add(optionsButton);

		#if desktop
		exitButton = new FlxButton(FlxG.width - 28, 8, "X", clickExit);
		exitButton.loadGraphic(AssetPaths.button__png, true, 20, 20);
		add(exitButton);
		#end

		if (FlxG.sound.music == null) // don't restart the music if it's already playing
		{
			FlxG.sound.playMusic(AssetPaths.HaxeFlixel_Tutorial_Game__ogg, 1, true);
		}
		super.create();
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	function clickPlay() {
		FlxG.switchState(new PlayState());
	}

	function clickOptions() {
		FlxG.switchState(new OptionsState());
	}

	#if desktop
	function clickExit() {
		Sys.exit(0);
	}
	#end
}
