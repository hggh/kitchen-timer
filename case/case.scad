module back_inlay() {
    difference() {
            cube([70-4, 25-4, 21]);
            rotate([55, 0, 0]) {
                translate([-1, 0, 0]) {
                    cube([72, 50, 60]);
                }
            }
        }
}


module back_top() {
    cube([70, 25, 25]);
    translate([0, 0, 25]) {
        difference() {
            cube([70, 25, 25]);
            rotate([55, 0, 0]) {
                translate([-1, 0, 0]) {
                    cube([82, 50, 25]);
                }
            }
            // display
            translate([9, 25/2, 0]) {
                rotate([55, 0, 0]) {
                    cube([30.5, 14.5, 20]);
                }
            }
            translate([2, 2, 0]) {
                back_inlay();
            }
        }
    }
}

module mutter_halter() {
    difference() {
        cube([7, 7, 4]);
        translate([7/2, 7/2, 2]) {
            cylinder(r = 5.5 / 2 / cos(180 / 6) + 0.05, h=3.1, $fn=6);
        }
        translate([7/2, 7/2, -0.01]) {
            cylinder(d=3.2, h=3, $fn=80);
        }
    }
}

union() {
    difference() {
        cube([70, 28, 25]);
        translate([2, 2, -1]) {
            cube([70-4, 28, 25-1]);
        }
        translate([54.65, 28/2, 25]) {
            rotate([0, 0, 90]) {
                cylinder(d=7.5, h=20, center=true, $fn=80);
            }
        }
    }
    translate([54.65, 28/2, 25-2-(4/2)]) {
        difference() {
            cube([16, 16, 4], center=true);
            cylinder(d=7.5, h=60, center=true, $fn=80);
            translate([0, 0, 0]) {
                cube([13, 13, 5], center=true);
            }
        }
    }
    translate([0, 28, 0]) {
        difference() {
            back_top();
            translate([2, -2, -1]) {
                cube([70-4, 25, 25]);
            }
            translate([2, 4, 23]) {
                cube([70-4, 19, 4]);
            }

        }

    }
    translate([2, 2, 2]) {
        mutter_halter();
    }
    translate([70-2-7, 2, 2]) {
        mutter_halter();
    }
    translate([2, 28+25-2-7, 2]) {
        mutter_halter();
    }
    translate([70-2-7, 28+25-2-7, 2]) {
        mutter_halter();
    }
    
}


// Bodenplatte
translate([80, 2, -1.2]) {
    cube([70-4 - 0.5, 28+25-4 - 0.5, 1.2]);
    translate([2, 2, 2]) {
        cylinder(d=3.2, h=2, $fn=80);
    }
}