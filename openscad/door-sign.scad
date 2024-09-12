width = 200;
height = 50;
thickness = 1;
text_depth = 2;

translate([0, 0, thickness/2]) {
  difference() {
    cube([width, height, thickness], center=true);
    translate([0, 0, thickness-text_depth]) {
      linear_extrude(text_depth) {
        text("Lasse Heia", size=25, font="Arial:style=Bold", halign="center", valign="center");
      }
    }
  }
}
