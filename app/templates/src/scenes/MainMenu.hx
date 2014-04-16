package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;
import com.haxepunk.graphics.Text;

import Settings;

class MainMenu extends BaseScene
{
    public override function begin()
    {
        // playMusic("sfx/Menu.mp3");
        displayIntroText();
        super.begin();
    }

    private function displayIntroText(){
        var screen = HXP.screen;
        var playText:Text;

        var titleText = new Text("Wormhole in one.");
        titleText.size = 64;
        titleText.x = (screen.width / 2) - 320;
        titleText.y = screen.height - 256;
        titleText.alpha = 255;
        titleText.color = 0xFFFFFF;
        addGraphic(titleText);

        if(Settings.IsMobile) {
            playText = new Text("Tap to play.");
        } else {
            playText = new Text("Press 'ENTER' to play.");
        }
        playText.size = 64;
        playText.x = (screen.width / 2) - 320;
        playText.y = screen.height - 128;
        playText.alpha = 255;
        playText.color = 0xFFFFFF;
        addGraphic(playText);
    }

    private override function checkInput(){
        if((Input.check("start")) || getTouchCount() > 0){
            //switchScene(new Level1());
        }
        if(Input.check("exit")){
            quitGame();
        }
    }
}
