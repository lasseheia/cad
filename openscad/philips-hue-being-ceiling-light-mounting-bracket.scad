$fn = 100;

// Box Parameters
box_hole_radius_mm = 70 / 2;
box_bolt_head_height_mm = 2.47;
box_bolt_head_radius_mm = 8.23 / 2;
box_bolt_thread_height_mm = 10.87;
box_bolt_thread_radius_mm = 4.62 / 2;
box_bolt_total_height_mm = box_bolt_head_height_mm + box_bolt_thread_height_mm;

// Lamp Parameters
lamp_inner_radius_mm = 90;
lamp_outer_radius_mm = 100;
lamp_thread_radius_mm = 2.2 / 2;

// Functions
module create_spoke_section(offset_angle) {
  rotate(offset_angle) {
    translate(
      [
        0,
        box_hole_radius_mm + box_bolt_head_radius_mm - lamp_outer_radius_mm - 6,
        box_bolt_total_height_mm / 6
      ]) {
      difference() {
        cube(
          [
            10,
            lamp_outer_radius_mm - box_hole_radius_mm + 1,
            box_bolt_total_height_mm / 3
          ],
          center = true
        );
        translate([0, 23, -box_bolt_total_height_mm / 3]) {
          cylinder(
            h = box_bolt_total_height_mm / 3,
            r = lamp_thread_radius_mm
          );
        }
      }
    }
  }
}

// Inner Circle
module create_inner_circle() {
  difference() {
    difference() {
      cylinder(
        h = box_bolt_total_height_mm / 3,
        r = box_hole_radius_mm + box_bolt_head_radius_mm + 1
      );
      cylinder(
        h = box_bolt_total_height_mm / 3,
        r = box_hole_radius_mm - box_bolt_head_radius_mm - 1
      );
    }
  
    for (i = [-box_hole_radius_mm, box_hole_radius_mm]) {
      translate([i, 0, -box_bolt_total_height_mm / 1.5]) {
        /* Head */
        translate([0, 0, box_bolt_thread_height_mm]) {
          cylinder(
            h = box_bolt_head_height_mm,
            r1 = box_bolt_thread_radius_mm,
            r2 = box_bolt_head_radius_mm
          );
        }
        /* Thread */
        cylinder(
          h = box_bolt_thread_height_mm,
          r = box_bolt_thread_radius_mm
        );
      }
    }
  }
}

// Outer Circle
module create_outer_circle() {
  difference() {
    cylinder(
      h = box_bolt_total_height_mm / 3 + 9,
      r = lamp_outer_radius_mm + 1
    );
    cylinder(
      h = box_bolt_total_height_mm / 3 + 9,
      r = lamp_outer_radius_mm - 1
    );
  }
}

// Main Structure
module assemble_main_structure() {
  create_inner_circle();
  create_outer_circle();
  for (angle = [0:120:360]) {
    create_spoke_section(angle);
  }
}

// Call main structure
assemble_main_structure();
