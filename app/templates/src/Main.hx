import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class Main extends Engine
{
    override public function init()
    {
        Input.define("start", [Key.ENTER]);
        Input.define("exit", [Key.ESCAPE, 27]);

#if debug
        HXP.console.enable();
#end
        HXP.scene = new scenes.MainMenu();
    }

    public static function main() { new Main(); }
}
