package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Touch;

#if flash
    import flash.system.System;
#end

class BaseScene extends Scene
{
    public override function begin()
    {
        HXP.setCamera(0,0);
        super.begin();
    }

    public override function update()
    {
        super.update();
        checkInput();
    }

    private function switchScene(newScene:Scene){
        HXP.scene = newScene;
        super.end();
    }

    private function checkInput() {}

    private function getTouches() {
        return Input.touches;
    }

    private function getTouchCount() {
        return Lambda.count(getTouches());
    }

    private function quitGame(){
        super.end();

        #if cpp
            Sys.exit(0);
        #elseif flash
            System.exit(0);
        #end
    }

    private function setBackgroundColor(color:Int){
        #if (flash || html5)
            HXP.screen.color = color;
        #else
            var base = Image.createRect(HXP.width, HXP.height, color, 1);
            base.scrollX = base.scrollY = 0;
            addGraphic(base).layer = 100;    // set the layer to a value that's behind other onscreen objects
        #end
    }
}
