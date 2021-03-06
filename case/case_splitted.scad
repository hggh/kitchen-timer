use <hggh/mico_usb_breakout_holder.scad>

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
        translate([3.5, 3.5, -1 ]) cylinder(d=3.2, h=4, $fn=80);
        translate([3.5, size_y - 3.5, -1 ]) cylinder(d=3.2, h=4, $fn=80);
        translate([size_x-3.5, 3.5, -1 ]) cylinder(d=3.2, h=4, $fn=80);
        translate([size_x-3.5, size_y - 3.5, -1 ]) cylinder(d=3.2, h=4, $fn=80);

        translate([-0.1, BOX_SIZE_LOWER_Y-10 -4.5, -1]) {
            cube([2.6, 26, 4]);
        }

        translate([size_x-2.5, BOX_SIZE_LOWER_Y-10 -4.5, -1]) {
            cube([2.6, 26, 4]);
        }
    }
}


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
    union() {
        difference() {
            cube([BOX_SIZE_X, BOX_SIZE_BACK_LOWER_Y, BOX_SIZE_LOWER_Z]);
            translate([2, -2, -1]) {
                cube([BOX_SIZE_X-4, BOX_SIZE_BACK_LOWER_Y, BOX_SIZE_LOWER_Z-2]);
                translate([0, 4, 0]) {
                    cube([BOX_SIZE_X-4, BOX_SIZE_BACK_LOWER_Y -4, BOX_SIZE_LOWER_Z+2]);
                }
            }
            translate([2, -2, BOX_SIZE_LOWER_Z]) {
                cube([BOX_SIZE_X-4, BOX_SIZE_BACK_LOWER_Y, 2]);
            }
        }
        translate([0, 0, BOX_SIZE_LOWER_Z]) {
            difference() {
                cube([BOX_SIZE_X, BOX_SIZE_BACK_LOWER_Y, BOX_SIZE_LOWER_Z]);
                rotate([55, 0, 0]) {
                    translate([-1, 0, 0]) {
                        cube([BOX_SIZE_X+2, 50, BOX_SIZE_LOWER_Z]);
                    }
                }
                // display
                translate([DISPLAY_POS_X, BOX_SIZE_LOWER_Z/2, 0]) {
                    rotate([55, 0, 0]) {
                        cube([DISPLAY_SIZE_X, 14.5, 20]);
                    }
                }
                translate([2, 2, -1]) {
                    back_inlay();
                }
            }
        }
        // klebefläche
        translate([2, -4, BOX_SIZE_BACK_LOWER_Y -11 ]) {
            cube([BOX_SIZE_X-4, 6, 2]);
        }
    }
}

module back() {
    union() {
        difference() {
            back_top();
            // buzzer
            translate([BOX_SIZE_X-10, BOX_SIZE_BACK_LOWER_Y, 42]) {
                rotate([90, 0, 0]) { 
                    cylinder(d=1.5, h=4, $fn=80, center=true);
                }
            }
            translate([BOX_SIZE_X-7.5, BOX_SIZE_BACK_LOWER_Y, 42]) {
                rotate([90, 0, 0]) { 
                    cylinder(d=1.5, h=4, $fn=80, center=true);
                }
            }
            translate([BOX_SIZE_X-8.75, BOX_SIZE_BACK_LOWER_Y, 44]) {
                rotate([90, 0, 0]) { 
                    cylinder(d=1.5, h=4, $fn=80, center=true);
                }
            }
            translate([BOX_SIZE_X-8.75, BOX_SIZE_BACK_LOWER_Y, 40.5]) {
                rotate([90, 0, 0]) { 
                    cylinder(d=1.5, h=4, $fn=80, center=true);
                }
            }
            // schalter
            translate([10, BOX_SIZE_LOWER_Z - 2, 42]) {
                cube([11, 10, 6]);
            }

            translate([2, 4, 23]) {
                cube([BOX_SIZE_X-4, 24, 4]);
            }
            translate([BOX_SIZE_X-8, 56-28, 22 - 4]) {
                cube([6, 40, 15]);
            }

        }
        translate([2, BOX_SIZE_BACK_LOWER_Y- 2 - 7, 3.5]) {
            mutter_halter();
        }
        translate([BOX_SIZE_X-2-7, BOX_SIZE_BACK_LOWER_Y-2-7, 3.5]) {
            mutter_halter();
        }
        translate([BOX_SIZE_X - 6 - 2, BOX_SIZE_BACK_LOWER_Y - 2, 32]) {
            rotate([90, 180, 90]) mico_usb_breakout_holder();
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

module mutter_halter_front() {
    difference() {
        cube([7, 7, 5]);
        translate([7/2, 7/2, 2]) {
            cylinder(r = 5.5 / 2 / cos(180 / 6) + 0.05, h=3.1, $fn=6);
        }
        translate([7/2, 7/2, -0.01]) {
            cylinder(d=3.2, h=3, $fn=80);
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
        translate([BOX_SIZE_X-2-7, 2, 3.5]) {
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

translate([0, -80, 0]) {
    front();
}

translate([2.25, 50, -1]) {
    floor_plate();
}


back();


