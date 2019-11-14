/// @description  view_follow(object, padding)
/// @function  view_follow
/// @param object
/// @param  padding
// Ensures that view can fit all objects of given kind.
// Returns number of objects fit.
var vw, vh, vb, vm, // (view related)
    x1, y1, x2, y2, // (bounding box)
    xm, ym, n; // (medians and count)
n = 0
with (argument0) {
    if (n == 0) {
        x1 = x; x2 = x; xm = x
        y1 = y; y2 = y; ym = y
    } else {
        x1 = min(x1, x); x2 = max(x2, x); xm += x
        y1 = min(y1, y); y2 = max(y2, y); ym += y
    }
    n += 1
}
if (n == 0) return 0 // nothing to follow
xm /= n // (x median)
ym /= n // (y median)
vb = argument1 * 2 // (view border)
vw = __view_get( e__VW.WPort, 0 ) // (view width)
vh = __view_get( e__VW.HPort, 0 ) // (view height)
vm = max(1, (x2 - x1) / (vw - vb), (y2 - y1) / (vh - vb))
__view_set( e__VW.WView, 0, vm * vw )
__view_set( e__VW.HView, 0, vm * vh )
__view_set( e__VW.XView, 0, (x1 + x2) / 2 - __view_get( e__VW.WView, 0 ) / 2 )
__view_set( e__VW.YView, 0, (y1 + y2) / 2 - __view_get( e__VW.HView, 0 ) / 2 )
return n
