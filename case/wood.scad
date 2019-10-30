OBERTEIL_VORNE_HOEHE = 80;
OBERTEIL_VORNE_DICKE = 10;
OBERTEIL_VORNE_BREITE = 70;

DISPLAY_HOEHE = 14.5;
DISPLAY_BREITE = 30.5;

DUEBEL_DURCHMESSER = 5;

difference() {
    cube([OBERTEIL_VORNE_BREITE, OBERTEIL_VORNE_HOEHE, OBERTEIL_VORNE_DICKE]);
    // display
    translate([
        OBERTEIL_VORNE_BREITE - DISPLAY_BREITE - 10,
        OBERTEIL_VORNE_HOEHE - 10 - DISPLAY_HOEHE,
        -1
    ]) {
        cube([DISPLAY_BREITE, DISPLAY_HOEHE, 30]);
    }
    
  
    // knopf
        translate([
        (OBERTEIL_VORNE_BREITE - 10 -DISPLAY_BREITE)/2 ,
        OBERTEIL_VORNE_HOEHE - 10 - (DISPLAY_HOEHE/2),

        -1]) {
        cylinder(d=7.5, h=20, $center=true, $fn=90);
    }
    // KY-040
    translate([
        (OBERTEIL_VORNE_BREITE - 10 -DISPLAY_BREITE)/2 ,
        OBERTEIL_VORNE_HOEHE - 10 - (DISPLAY_HOEHE/2),
        4]) {
        cube([13, 13, 6], center=true);
    }
    // KY-040/display platine
    translate([
        (OBERTEIL_VORNE_BREITE - 10 -DISPLAY_BREITE)/2 -12 ,
        OBERTEIL_VORNE_HOEHE - 10 - (DISPLAY_HOEHE/2)-14,
        5]) {
        cube([65, 27, 6]);
    }
    // holzdübel
    translate([10, 10, 6]) {
        rotate([0, 0, 90]) cylinder(d=DUEBEL_DURCHMESSER, h=5, $fn=90);
    }
    translate([10, 30, 6]) {
        rotate([0, 0, 90]) cylinder(d=DUEBEL_DURCHMESSER, h=5, $fn=90);
    }
    translate([60, 30, 6]) {
        rotate([0, 0, 90]) cylinder(d=DUEBEL_DURCHMESSER, h=5, $fn=90);
    }
    
    //kabel_kanal
    translate([
        20,
        -1,
        6
    ]) {
        cube([30, OBERTEIL_VORNE_HOEHE - 10, 5]);
    }
}

translate([0, 0, 50]) {
    difference() {
        cube([OBERTEIL_VORNE_BREITE, OBERTEIL_VORNE_HOEHE, OBERTEIL_VORNE_DICKE]);
    
        translate([0, 0, -7]) {
        // holzdübel
            translate([10, 10, 6]) {
                rotate([0, 0, 90]) cylinder(d=DUEBEL_DURCHMESSER, h=5, $fn=90);
            }
            translate([10, 30, 6]) {
                rotate([0, 0, 90]) cylinder(d=DUEBEL_DURCHMESSER, h=5, $fn=90);
            }
            translate([60, 30, 6]) {
                rotate([0, 0, 90]) cylinder(d=DUEBEL_DURCHMESSER, h=5, $fn=90);
            }
            translate([
        (OBERTEIL_VORNE_BREITE - 10 -DISPLAY_BREITE)/2 -12 ,
        OBERTEIL_VORNE_HOEHE - 10 - (DISPLAY_HOEHE/2)-14,
        5]) {
        cube([65, 27, 6]);
    }
        }
    }
}