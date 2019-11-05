module back_inlay() {
    difference() {
            cube([70-4, 30-4, 26]);
            rotate([55, 0, 0]) {
                translate([-1, 0, 0]) {
                    cube([72, 50, 60]);
                }
            }
        }
}


module back_top() {
    cube([70, 30, 30]);
    translate([0, 0, 30]) {
        difference() {
            cube([70, 30, 30]);
            rotate([55, 0, 0]) {
                translate([-1, 0, 0]) {
                    cube([82, 50, 25]);
                }
            }
            // display
            translate([9, 20, 0]) {
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


union() {
    difference() {
        cube([70, 38, 30]);
        translate([2, 2, -1]) {
            cube([70-4, 38, 30-1]);
        }
        translate([54.65, 38/2, 30]) {
            rotate([0, 0, 90]) {
                cylinder(d=7.5, h=20, center=true, $fn=80);
            }
        }
    }
    translate([54.65, 38/2, 30-2-(4/2)]) {
        difference() {
            cube([16, 16, 4], center=true);
            cylinder(d=7.5, h=60, center=true, $fn=80);
            translate([0, 0, 0]) {
                cube([13, 13, 5], center=true);
            }
        }
    }
    translate([0, 38, 0]) {
        difference() {
            back_top();
            translate([2, -2, -1]) {
                cube([70-4, 30, 30]);
            }
            translate([2, 4, 28]) {
                cube([70-4, 24, 4]);
            }

        }

    }
}
