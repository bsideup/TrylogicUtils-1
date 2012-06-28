package tl.utils{	import flash.display.*;	public function hitAreaMe( target : Sprite, bitmap : Bitmap, grainSize : uint = 5, treshold : uint = 127 ) : void	{		var hitArea : Sprite = createHitArea( bitmap.bitmapData, grainSize, treshold );		hitArea.mouseEnabled = hitArea.mouseChildren = false;		hitArea.x = bitmap.x;		hitArea.y = bitmap.y;		target.hitArea = hitArea;		target.addChildAt( hitArea, 0 ).alpha = 0;	}}import flash.display.BitmapData;import flash.display.Sprite;function createHitArea( bitmapData : BitmapData, grainSize : uint = 1, treshold : uint = 127 ) : Sprite{	var _hitarea : Sprite = new Sprite();	_hitarea.graphics.beginFill( 0x000000, 1.0 );	for ( var x : uint = 0; x < bitmapData.width; x += grainSize )	{		for ( var y : uint = grainSize; y < bitmapData.height; y += grainSize )		{			if ( x <= bitmapData.width && y <= bitmapData.height && ((bitmapData.getPixel32( x, y ) >> 24 & 0xFF) > treshold) )			{				_hitarea.graphics.drawRect( x, y, grainSize, grainSize );			}		}	}	_hitarea.graphics.endFill();	return _hitarea;}