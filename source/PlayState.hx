package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
    var _sprite: FlxSprite;
    var _bg: FlxSprite;

    override public function create()
    {
        super.create();

        // Background
        _bg = new FlxSprite();
        _bg.loadGraphic("assets/images/ProjectUtumno_full.png");
        _bg.x = 0;
        _bg.y = 0;
        add(_bg);

        // Player
        _sprite = new FlxSprite();
        _sprite.makeGraphic(32, 32, FlxColor.RED);
        //_sprite.screenCenter();
        _sprite.x = 0;
        _sprite.y = 0;
        add(_sprite);

        FlxG.camera.follow(_sprite, FlxCameraFollowStyle.TOPDOWN_TIGHT);
        FlxG.camera.zoom = 1.0;
        FlxG.camera.followLerp = 0.2;
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        var up:Bool = FlxG.keys.anyPressed([UP, W]);
        var down:Bool = FlxG.keys.anyPressed([DOWN, S]);
        var left:Bool = FlxG.keys.anyPressed([LEFT, A]);
        var right:Bool = FlxG.keys.anyPressed([RIGHT, D]);

        if (up && down)
            up = down = false;
        if (left && right)
            left = right = false;

        if (up)
            _sprite.velocity.y = -100;
        else if (down)
            _sprite.velocity.y = 100;
        else 
            _sprite.velocity.y = 0;

        if (left)
            _sprite.velocity.x = -100;
        else if (right)
            _sprite.velocity.x = 100;
        else
            _sprite.velocity.x = 0;
    }
}
