import nape.space.Space;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;

class Settings {
    //Sound data
    public static var MaxVolume:Int = 11;
    public static var Volume:Int = 11;
    public static var SfxMuted:Bool = false;
    public static var SoundMuted:Bool = false;
    public static var sfx:Sfx;

    //Game data, i.e. current level, etc.


    public static var TextSize = 25;

    //Settings variable on mobile.
#if android
    public static var IsMobile:Bool = true;
    public static var SoundEffectsFileType = ".ogg";
#else
    public static var IsMobile:Bool = false;
    public static var SoundEffectsFileType = ".mp3";
#end

}
