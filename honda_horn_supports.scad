// Literals are in mils.
S = 1/1000;

// Standard clearance
c = 20;

x_1 = 534 + 2*c;
wall_thickness = 655 - x_1;
echo("wall thickness", wall_thickness);

x_2 = 350 - 2*c;
x_7 = 440 - 2*c;
echo("spindle diameter", x_7, x_2);

// TODO: Choose screw.  x_3 is its polygon circumscribed by tap ream diameter.
x_3 = 100;

x_4 = 220;
//x_5 = 253 - 38 - c;

x_6 = 120;

x_8 = 250;

x_5 = 253 + 165 - 38 + x_8;


// Converted to inches
scale(S) {
  // Base
  cylinder(h=x_6, r=655);

  // Spring capture wall
  difference() {
	cylinder(h=x_4, r=655);
	cylinder(h=x_4*3, r=x_1, center=true);
  }

  difference() {
	union() {
	  // Spindle and mating surface
	  cylinder(h=(x_5 - c), r=x_2);
	  translate([0,0,(x_5 - c)]) cylinder(h=c, r1=x_2, r2=(x_2 - c));

	  // Gusset / spring centering
	  translate([0,0,x_6]) cylinder(h=(x_7 - x_2), r1=x_7, r2=x_2);
	}

	// Pilot hole for screw
	cylinder(h=x_8*9, r=x_3, center=true);
  }
}
