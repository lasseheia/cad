$fn=100;

handle_base_radius = 19.3/2;
handle_depth = 5.5;
handle_depth = 10;

translate([handle_base_radius, 0, handle_base_radius]) {
  rotate([90, 0, 0]) {
    difference() {
      cylinder(handle_depth, handle_base_radius, handle_base_radius, center = true);
      cylinder(handle_depth, handle_base_radius - 1, handle_base_radius - 1, center = true);
      rotate([0, 90, 0]) {
        translate([0, 0, handle_base_radius]) {
         cube([handle_depth, handle_base_radius + 1, handle_base_radius], center = true);
        }
      }
    }
  }
}

translate([-1, -20, handle_base_radius]) {
  rotate([90, 0, 0]) {
    cylinder(50, 2, 2, center = true);
  }
}
