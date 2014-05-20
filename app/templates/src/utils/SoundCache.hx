package utils;

import com.haxepunk.Sfx;

class SoundCache
{
    private static var CachedSFX:Map<String, Sfx> = new Map<String, Sfx>();

    public static function playMusic(name:String){
        var sfx = CachedSFX.get(name);

        if(sfx == null){
            sfx = new Sfx('music/' + name + '.mp3');
            CachedSFX.set(name, sfx);
        }

        sfx.loop();
        sfx.type = "MUSIC";
        Settings.backgroundMusic = sfx;
    }

    public static function getSfx(name:String) : Sfx {
        var fileName = name + Settings.soundEffectsFileType;
        var sfx = CachedSFX.get(fileName);

        if(sfx == null){
            sfx = new Sfx(fileName);
            CachedSFX.set(fileName, sfx);
        }

        return sfx;
    }
}
