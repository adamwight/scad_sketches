R = 1;
L = R * 8;

module c(tr) {
  translate(tr[0]) rotate(tr[1])
    cylinder($fs=0.1,h=L,r=R,center=true);
};

z1 = [[ 0,-R, 0], [ 0, 0,0]];
z2 = [[ 0, R, 0], [ 0, 0,0]];
x1 = [[ 0, 0,-R], [ 0,90,0]];
x2 = [[ 0, 0, R], [ 0,90,0]];
y1 = [[-R, 0, 0], [90, 0,0]];
y2 = [[ R, 0, 0], [90, 0,0]];

/*c(z1);
c(z2);
c(x1);
c(x2);
c(y1);
c(y2);
*/
o = R*2.1;
translate([o*6,0,0])
  difference() {c(z1); c(x1);};
translate([o*5,0,0])
  difference() {c(z1); c(x1); c(x2); c(y2);};
translate([o*4,0,0])
  difference() {c(z1); c(x1); c(x2); c(y2);};
translate([o*3,0,0])
  difference() {c(z1); c(x1); c(x2); c(y2);};
translate([o*2,0,0])
  difference() {c(z1); c(x2); c(y1);};
translate([o*1,0,0])
  c(z1);
