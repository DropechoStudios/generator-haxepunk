package entities;

import com.haxepunk.Entity;
import Settings;

class BaseEntity extends Entity {
    public var updatesWhilePaused:Bool;

    public override function update(){
        if(!Settings.paused || updatesWhilePaused){
            super.update();
        }
    }
}
