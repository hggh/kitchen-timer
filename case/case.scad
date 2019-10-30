
module upper_part_inside(lng_x, lny, lnz) {
    difference() {
        cube([lng_x, lny, lnz]);
        rotate([55, 0, 0]) {
                translate([-1, 0, 0]) cube([lng_x + 2, lny, 40]);
        }
    }
}

module outside() {
    union() {
        cube([80, 50, 30]);
        translate([0, 0, 30]) {
            difference() {
            cube([80, 50, 30]);
            rotate([55, 0, 0]) {
                translate([-1, 0, 0]) cube([82, 50, 25]);
            }
            translate([15, 20, 0]) {
                rotate([55, 0, 0]) cube([30.5, 14.5, 30]);
            }
            translate([62.75, 34.5, 0]) {
                rotate([55, 0, 0]) {
                    translate([0, 0, 10]) {
                        cylinder(d=7, h=50, center=true, $fn=80);
                    }
                }
            }
        } 
    }
    }
}


difference () {
    outside();
    translate([1.2, 2.4, -1]) {
        cube([80-2.4, 50-3.6, 31.5]);
    }
    translate([1.2, 1.2, 29]) {
        upper_part_inside(80-2.4, 50-2.4, 30);
    }
      
}
