c = .02;
x_1 = .534 + 2*c;
x_2 = .440 - 2*c;
wall_thickness = .655 - x_1;
echo("wall thickness", wall_thickness);

// TODO
x_3 = .1;

x_4 = .22;
x_5 = .2;

x_6 = .12;
x_7 = .35 - 2*c;
x_8 = .775; // then cut to length

difference() {
  cylinder($fs=0.1, h=x_4, r=.655);
  cylinder($fs=0.1, h=x_4*3, r=x_1, center=true);
}
cylinder($fs=0.1, h=x_6, r=.655);

difference() {
  union() {
	cylinder($fs=0.1, h=(x_5 + x_6), r=x_2);
	translate([0,0,x_5+x_6]) cylinder($fs=0.1, h=(x_2 - x_7), r1=x_2, r2=x_7);
	cylinder($fs=0.1, h=(x_8 + x_6), r=x_7);
	translate([0,0,(x_8+x_6)]) sphere($fs=0.1, r=x_7);
  }
  cylinder($fs=0.1, h=x_8*9, r=x_3, center=true);
}


/*translate(tr[0]) rotate(tr[1])*/
