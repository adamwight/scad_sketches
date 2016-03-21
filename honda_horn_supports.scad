// Literals are in mils.
S = 1/1000;

// Standard clearance
c = 20;

// Outside ring minimum inside diameter to clear the spring.
x_1 = 534 + 2*c;
wall_thickness = 655 - x_1;
echo("wall thickness", wall_thickness);

// Maximum diameter to clear hole in plate.
x_2 = 350 - 2*c;
// Maximum outside diameter to clear the spring.
x_7 = 440 - 2*c;
echo("spindle diameter", x_7, x_2);

// TODO: Choose screw.  x_3 is its polygon circumscribed by tap ream diameter.
// This is an arbitrary pilot hole diameter.
x_3 = 100;

// Choice of base thickness.
x_6 = 120;

// Spring capture wall height, including base thickness
x_4 = 100 + x_6;
//x_5 = 253 - 38 - c;

x_8 = 250;

// Height of the spindle, from glued surface.
x_5 = 253 + 165 - 38 + x_8;


module HornSupport() {
  // Base
  cylinder(h=x_6, d=655);

  // Spring capture wall
  difference() {
	cylinder(h=x_4, d=655);
	cylinder(h=x_4*3, d=x_1, center=true);
  }

  difference() {
	union() {
	  // Spindle and mating surface
	  cylinder(h=(x_5 - c), d=x_2);
	  translate([0,0,(x_5 - c)]) cylinder(h=c, d1=x_2, d2=(x_2 - 2*c));

	  // Gusset / spring centering
	  translate([0,0,x_6]) cylinder(h=(x_7 - x_2)/2, d1=x_7, d2=x_2);
	}

	// Pilot hole for screw
	cylinder(h=x_5*9, d=x_3, center=true);
  }
}

// Layout
// Converted to inches
scale(S) {
  for (i=[0:3]) translate([i * 800,0,0]) HornSupport();
}
