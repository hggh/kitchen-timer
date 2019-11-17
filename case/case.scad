include <mico_usb_breakout.scad>;
BOX_SIZE_X = 90;
BOX_SIZE_LOWER_Y = 28;
BOX_SIZE_BACK_LOWER_Y = 30;

DISPLAY_POS_X = 10;
DISPLAY_SIZE_X = 30.5;

module back_inlay() {
    difference() {
            cube([BOX_SIZE_X-4, BOX_SIZE_BACK_LOWER_Y-4, 21]);
            rotate([55, 0, 0]) {
                translate([-1, 0, 0]) {
                    cube([BOX_SIZE_X+2, 50, 60]);
                }
            }
        }
}


module back_top() {
    cube([BOX_SIZE_X, BOX_SIZE_BACK_LOWER_Y, 25]);
    translate([0, 0, 25]) {
        difference() {
            cube([BOX_SIZE_X, BOX_SIZE_BACK_LOWER_Y, 25]);
            rotate([55, 0, 0]) {
                translate([-1, 0, 0]) {
                    cube([BOX_SIZE_X+2, 50, 25]);
                }
            }
            // display
            translate([DISPLAY_POS_X, 25/2, 0]) {
                rotate([55, 0, 0]) {
                    cube([DISPLAY_SIZE_X, 14.5, 20]);
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
    BUTTON_SPACE_X = (BOX_SIZE_X - DISPLAY_SIZE_X - DISPLAY_POS_X) / 2;
    BUTTON_POS_X = DISPLAY_POS_X + DISPLAY_SIZE_X + BUTTON_SPACE_X;

    difference() {
        cube([BOX_SIZE_X, BOX_SIZE_LOWER_Y, 25]);
        translate([2, 2, -1]) {
            cube([BOX_SIZE_X-4, 28, 25-1]);
        }
        translate([BUTTON_POS_X, 28/2, 25]) {
            rotate([0, 0, 90]) {
                cylinder(d=7.5, h=20, center=true, $fn=80);
            }
        }
    }
    
    
    translate([BUTTON_POS_X, 28/2, 25-2-(4/2)]) {
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
                cube([BOX_SIZE_X-4, BOX_SIZE_BACK_LOWER_Y, 25]);
            }
            // buzzer
            translate([10, 30, 42]) {
                rotate([90, 0, 0]) { 
                    cylinder(d=1.2, h=4, $fn=80, center=true);
                }
            }
            translate([7.5, 30, 42]) {
                rotate([90, 0, 0]) { 
                    cylinder(d=1.2, h=4, $fn=80, center=true);
                }
            }
            translate([8.75, 30, 44]) {
                rotate([90, 0, 0]) { 
                    cylinder(d=1.2, h=4, $fn=80, center=true);
                }
            }
            translate([8.75, 30, 40.5]) {
                rotate([90, 0, 0]) { 
                    cylinder(d=1.2, h=4, $fn=80, center=true);
                }
            }
            
            translate([2, 4, 23]) {
                cube([BOX_SIZE_X-4, 24, 4]);
            }
            translate([BOX_SIZE_X-8, 56-28, 22 - 4]) {
                cube([6, 4, 15]);
            }

        }

    }
    translate([2, 2, 2]) {
        mutter_halter();
    }
    translate([BOX_SIZE_X-2-7, 2, 2]) {
        mutter_halter();
    }
    translate([2, 28+BOX_SIZE_BACK_LOWER_Y-2-7, 2]) {
        mutter_halter();
    }
    translate([BOX_SIZE_X-2-7, 28+BOX_SIZE_BACK_LOWER_Y-2-7, 2]) {
        mutter_halter();
    }
    translate([BOX_SIZE_X - 6 - 2, 28 + BOX_SIZE_BACK_LOWER_Y - 2, 32]) {
        rotate([90, 180, 90]) usb_breakout();
    }
}



// Bodenplatte
translate([90, 2, -1.2]) {
    cube([70-4 - 0.5, 28+25-4 - 0.5, 1.2]);
    translate([2, 2, 2]) {
        cylinder(d=3.2, h=2, $fn=80);
    }
}