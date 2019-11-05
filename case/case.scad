
module upper_part_inside(lng_x, lny, lnz) {
    difference() {
        cube([lng_x, lny, lnz]);
        rotate([55, 0, 0]) {
                translate([-1, 0, 0]) cube([lng_x + 2, lny, 40]);
        }
    }
}

module ky040() {
    difference() {
        cube([13 + 2.4, 13 + 2.4, 1]);
        translate([1.2, 1.2, -1]) cube([13, 13, 3]);
        translate([6.5 ,6.5, -1]) {
            cylinder(d=7.5, h=10, $fn=80);
        }
    }
}

module outside() {
    union() {
        cube([70, 50, 20]);
        translate([0, 0, 20]) {
            difference() {
            cube([70, 50, 30]);
            rotate([55, 0, 0]) {
                translate([-1, 0, 0]) cube([82, 50, 25]);
            }
            // display
            translate([9, 20, 0]) {
                rotate([55, 0, 0]) cube([30.5, 14.5, 30]);
            }
            translate([54.65, 34.5, 0]) {
                rotate([55, 0, 0]) {
                    translate([0, 0, 10]) {
                        cylinder(d=7.5, h=50, center=true, $fn=80);
                    }
                }
            }
        } 
    }
    }
}


union() {
    difference () {
        outside();
        translate([1.2, 2.4, -1]) {
            cube([70-2.4, 50-3.6, 21.5]);
        }
        translate([1.2, 1.2, 19]) {
            upper_part_inside(70-2.4, 50-2.4, 30);
        }
    }
    translate([54.65-7.5, 34.5-7.5, 30]) {
                rotate([55,0,0]) ky040();
            }
}



