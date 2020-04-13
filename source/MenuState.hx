package;

import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxState;

class MenuState extends FlxState {
	var playButton:FlxButton;
	var titleText:FlxText;
	var optionsButton:FlxButton;

	override public function create() {
		titleText = new FlxText(20, 0, 0, "HaxeFlixel\nTutorial\nGame", 22);
		titleText.alignment = CENTER;
		titleText.screenCenter(X);
		add(titleText);

		playButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.x = (FlxG.width / 2) - playButton.width - 10;
		playButton.y = FlxG.height - playButton.height - 10;
		add(playButton);

		optionsButton = new FlxButton(0, 0, "Options", clickOptions);
		optionsButton.x = (FlxG.width / 2) + 10;
		optionsButton.y = FlxG.height - optionsButton.height - 10;
		add(optionsButton);
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
}
