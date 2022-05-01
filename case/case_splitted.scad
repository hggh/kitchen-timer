use <hggh/mico_usb_breakout_holder.scad>
use <hggh/usb_c_breakout_case_holder.scad>
include <BOSL/constants.scad>
use <BOSL/shapes.scad>


BOX_SIZE_X = 96;
BOX_SIZE_LOWER_Y = 28;
BOX_SIZE_BACK_LOWER_Y = 35;
BOX_SIZE_LOWER_Z = 28;

DISPLAY_POS_X = 10;
DISPLAY_SIZE_X = 30.9;





module floor_plate() {
    size_x = BOX_SIZE_X - 4;
    size_y = BOX_SIZE_LOWER_Y + BOX_SIZE_BACK_LOWER_Y - 4;
    difference() {
        translate([0.5, 0.5, 0]) cube([size_x - 1, size_y - 1, 2]);
        translate([4, 4, -1 ]) cylinder(d=3.2, h=4, $fn=80);
        translate([4, size_y - 4, -1 ]) cylinder(d=3.2, h=4, $fn=80);
        translate([size_x-4, 4, -1 ]) cylinder(d=3.2, h=4, $fn=80);
        translate([size_x-4, size_y - 3.5, -1 ]) cylinder(d=3.2, h=4, $fn=80);

        translate([-0.1, BOX_SIZE_LOWER_Y-10 -4.5, -1]) {
            cube([2.6, 26, 4]);
        }

        translate([size_x-2.5, BOX_SIZE_LOWER_Y-10 -4.5, -1]) {
            cube([2.6, 26, 4]);
        }
    }
}

module mutter_halter() {
    difference() {
        cube([8, 8, 6]);
        translate([8/2, 8/2, 2]) {
            cylinder(r = 5.5 / 2 / cos(180 / 6) + 0.05, h=4.1, $fn=6);
        }
        translate([8/2, 8/2, -0.01]) {
            cylinder(d=3.2, h=3.5, $fn=80);
        }
    }
}

module mutter_halter_front() {
    difference() {
        cube([8, 8, 6]);
        translate([8/2, 8/2, 2]) {
            cylinder(r = 5.5 / 2 / cos(180 / 6) + 0.05, h=4.1, $fn=6);
        }
        translate([8/2, 8/2, -0.01]) {
            cylinder(d=3.2, h=3.5, $fn=80);
        }
    }
}

module front() {
    union() {
        BUTTON_SPACE_X = (BOX_SIZE_X - DISPLAY_SIZE_X - DISPLAY_POS_X) / 2;
        BUTTON_POS_X = DISPLAY_POS_X + DISPLAY_SIZE_X + BUTTON_SPACE_X;
    
        difference() {
            cube([BOX_SIZE_X, BOX_SIZE_LOWER_Y, BOX_SIZE_LOWER_Z]);
            translate([2, 2, -1]) {
                cube([BOX_SIZE_X-4, 28, BOX_SIZE_LOWER_Z-1]);
            }
            translate([BUTTON_POS_X, 28/2, BOX_SIZE_LOWER_Z]) {
                rotate([0, 0, 90]) {
                    cylinder(d=7.5, h=20, center=true, $fn=80);
                }
            }
        }
        difference() {
            translate([BUTTON_POS_X - (16/2), 28/2 - (16/2) , BOX_SIZE_LOWER_Z-3]) {
                cube([16, 16, 1]);
            }
            translate([BUTTON_POS_X, 28/2, BOX_SIZE_LOWER_Z]) {
                rotate([0, 0, 90]) {
                    cylinder(d=7.5, h=20, center=true, $fn=80);
                }
           }
        }
        translate([BUTTON_POS_X - (16/2), 28/2 - (16/2), BOX_SIZE_LOWER_Z-7]) {
            difference() {
                cube([16, 16, 4]);
                translate([1.5, 1.5, -1]) cube([13, 13, 5]);
            }
        }
        translate([2, 2, 3.5]) {
            mutter_halter_front();
        }
        translate([BOX_SIZE_X-2-8, 2, 3.5]) {
            mutter_halter_front();
        }
        // klebeflächen
        translate([2, BOX_SIZE_LOWER_Y-10]) {
            cube([2, 20, 12]);
        }
        translate([BOX_SIZE_X-4, BOX_SIZE_LOWER_Y-10]) {
            cube([2, 20, 12]);
        }
    }
}

TIMER_SIZE_X = 96;
TIMER_BACK_SIZE_Y = 37;
TIMER_BACK_TOP_SIZE_Z = 28;


module timer_back_case() {
    difference() {
            cube([TIMER_SIZE_X, TIMER_BACK_SIZE_Y, TIMER_BACK_TOP_SIZE_Z]);
            translate([2, -2, -1]) {
                cube([BOX_SIZE_X-4, TIMER_BACK_SIZE_Y, TIMER_BACK_TOP_SIZE_Z - 2]);
                translate([0, 4, 0]) {
                    cube([TIMER_SIZE_X - 4, TIMER_BACK_SIZE_Y - 4, TIMER_BACK_TOP_SIZE_Z + 2]);
                }
            }
            translate([2, -2, BOX_SIZE_LOWER_Z]) {
                cube([BOX_SIZE_X-4, BOX_SIZE_BACK_LOWER_Y, 2]);
            }
        }

    translate([2, -4,  TIMER_BACK_TOP_SIZE_Z - 4]) {
        cube([BOX_SIZE_X-4, 6, 2]);
    }
    translate([TIMER_SIZE_X/2, TIMER_BACK_SIZE_Y/2, 28]) {
        union() {
            rotate([0, 0, 90]) {
                difference() {
                    prismoid(
                        size1=[TIMER_BACK_SIZE_Y, TIMER_SIZE_X],
                        size2=[15, TIMER_SIZE_X], h=TIMER_BACK_TOP_SIZE_Z,
                        shift=[11,0]);
         
                    prismoid(
                        size1=[TIMER_BACK_SIZE_Y-4, TIMER_SIZE_X-4],
                        size2=[15-4, TIMER_SIZE_X-4], h=TIMER_BACK_TOP_SIZE_Z -2,
                        shift=[11,0]);

                }
            }
        }
    }

}


module timer_back() {
    difference() {
        timer_back_case();
        // display cutout
        translate([DISPLAY_POS_X, BOX_SIZE_LOWER_Z/2, 28]) {
            rotate([55, 0, 0])
                cube([DISPLAY_SIZE_X, 14.5, 20]);
        }
        // switch cutout
        translate([10, BOX_SIZE_LOWER_Z - 2, 47.8]) {
            cube([11.6, 20, 6.2]);
        }
        // USB-C Connector
        translate([TIMER_SIZE_X - 2 - 15 -2, TIMER_BACK_SIZE_Y - 2, 15]) {
            translate([1.5, -10, 7.5]) {
                cube([12, 30, 20]);
            }
        }
    }       
    translate([2, TIMER_BACK_SIZE_Y - 2 - 8, 3.5]) {
        mutter_halter();
    }
    translate([TIMER_SIZE_X - 2-8, TIMER_BACK_SIZE_Y - 2 - 8, 3.5]) {
        mutter_halter();
    }

    // Print the USB- Connecter extra mount it via screws
    translate([TIMER_SIZE_X - 2 - 15 - 2, TIMER_BACK_SIZE_Y - 2, 15]) {
        translate([15/2, -6, 3.5]) {
            rotate([270, 0, 0]) cylinder(d=3.0, h=6, $fn=190);
        }
        translate([15/2, -6, 35-3.5]) {
            rotate([270, 0, 0]) cylinder(d=3.0, h=6, $fn=190);
        }
        //rotate([180, 270, 0]) usb_c_breakout_case_holder();
    }
}

translate([0, 0, 0]) {
    timer_back();
}

translate([0, -80, 0]) {
    front();
}

translate([2.25, 50, -1]) {
    floor_plate();
}

translate([TIMER_SIZE_X - 2 - 15 - 2, 50, 15]) {
    rotate([180, 270, 0]) usb_c_breakout_case_holder();
}