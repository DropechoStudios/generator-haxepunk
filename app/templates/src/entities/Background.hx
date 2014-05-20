package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Backdrop;

class Background extends Entity
{
    private var image:Backdrop;

    public function new(x:Int, y:Int)
    {
        super(x, y);
        // image = new Backdrop("gfx/background/black.png", true, true);
        // image.scrollX = 0.1;
        // image.scrollY = 0.1;
        // graphic = image;
        layer = 10000;
    }

    public override function update(){
        super.update();
    }
}
