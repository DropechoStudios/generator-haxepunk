package scenes;

import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Touch;

import Settings;

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

    public override function end(){
        endScene();
    }

    public override function focusGained(){
        if(Settings.systemPause){
            Settings.paused = false;
        }
        Settings.systemPause = false;
    }

    public override function focusLost(){
        if(!Settings.paused){
            Settings.systemPause = true;
        }
        Settings.paused = true;
    }

    private function playMusic(soundFile:String){
        //utils.SoundCache.playMusic(soundFile);
    }

    private function switchScene(newScene:Scene){
        HXP.scene = newScene;
        endScene();
    }

    private function checkInput() {}

    private function getTouches() {
        return Input.touches;
    }

    private function getTouchCount() {
        return Lambda.count(getTouches());
    }

    private function endScene(){
        super.end();
    }

    private function quitGame(){
        endScene();
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
