package scenes;

import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.graphics.Text;

import Settings;

class Credits extends BaseScene
{
    public override function begin()
    {
        super.begin();

        displayCreditsText();
        setBackgroundColor(0);
    }

    private function displayCreditsText(){
        var screen = HXP.screen;

        var dropechoText = new Text("Created by: <%= company %>");
        dropechoText.size = 16;
        dropechoText.x = 0;
        dropechoText.y = screen.height - 16;
        dropechoText.alpha = 255;
        dropechoText.color = 0xFFFFFF;
        addGraphic(dropechoText);
    }

    private override function checkInput(){
        if((Input.released("start")) || Input.released("exit")){
            switchScene(Settings.menu);
        }
    }
}
