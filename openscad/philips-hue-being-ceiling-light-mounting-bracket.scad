$fn=100;

box_hole_radius = 70/2;
box_bolt_head_height = 2.47;
box_bolt_head_radius = 8.23/2;
box_bolt_thread_height = 10.87;
box_bolt_thread_radius = 4.62/2;
box_bolt_height = box_bolt_head_height + box_bolt_thread_height;

lamp_hole_radius = 90;
lamp_hole_outer_radius = 100;
lamp_hole_thread_radius = 2.2/2;

/* Inner circle */
difference() {
  difference() {
    cylinder(
      h = box_bolt_height / 3,
      r = box_hole_radius + box_bolt_head_radius + 1
    );
    cylinder(
      h = box_bolt_height / 3,
      r = box_hole_radius - box_bolt_head_radius - 1
    );
  }

  for (i = [-box_hole_radius, box_hole_radius]) {
    translate([i, 0, -box_bolt_height/1.5]) {
      /* Head */
      translate([0, 0, box_bolt_thread_height]) {
        cylinder(
          h  = box_bolt_head_height,
          r1 = box_bolt_thread_radius,
          r2 = box_bolt_head_radius
        );
      }
      /* Thread */
      cylinder(
        h = box_bolt_thread_height,
        r = box_bolt_thread_radius
      );
    }
  }
}

/* Outer circle */
difference() {
  cylinder(
    h = box_bolt_height / 3 + 9,
    r = lamp_hole_outer_radius + 1
  );
  cylinder(
    h = box_bolt_height / 3 + 9,
    r = lamp_hole_outer_radius - 1
  );
}

/* Spokes */
for (i = [0:120:360]) {
  rotate(i) {
    translate(
      [
        0,
        box_hole_radius + box_bolt_head_radius - lamp_hole_outer_radius,
        box_bolt_height / 6
      ]) {
      difference() {
        cube(
          [
            10,
            lamp_hole_outer_radius - box_hole_radius + 1,
            box_bolt_height / 3
          ],
          center = true
        );
        translate([0, 23, -box_bolt_height / 3]) {
          cylinder(
            h = box_bolt_height / 3,
            r = lamp_hole_thread_radius
          );
        }
      }
    }
  }
}
