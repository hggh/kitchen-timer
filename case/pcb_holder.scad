$fn=190;

translate([-3, -2.5, -1]) {
    cube([44 + 3 + 3, 5, 1.2]);
}
cylinder(d=5, h=5);
cylinder(d=3, h=15);
translate([44, 0, 0]) {
    cylinder(d=5, h=5);
    cylinder(d=3, h=15);
}