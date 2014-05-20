import nape.space.Space;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;

class Settings {
    //Sound data
    public static var maxVolume:Int = 11;
    public static var volume:Int = 11;
    public static var sfxMuted:Bool = false;
    public static var soundMuted:Bool = false;

    //Game data
    public static var paused:Bool = false;
    public static var systemPause:Bool = false;

    //UI Stuff
    public static var textSize = 25;

#if android
    public static var soundEffectsFileType = ".ogg";
#else
    public static var soundEffectsFileType = ".mp3";
#end

    public static var menu:scenes.MainMenu = new scenes.MainMenu();
    public static var credits:scenes.Credits = new scenes.Credits();

#if android
    public static var isMobile:Bool = true;
#else
    public static var isMobile:Bool = false;
#end

    public static function restoreDefault(){
        paused = false;
    }
}
