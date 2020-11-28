$fn = 360;

viewport_offset = -28;

difference() {

	union() {
		
		rotate([0,0,$t*360]) {
			disk();
		}

//		shield();
//		back();
	}

	translate([0,0,0])
		cylinder(d=2, h=5, center=true);

}
	
module disk() {

	difference() {

		cylinder(d=82.5, h=2);

		for (i=[0:15]) {

			rotate([0,0,i*(360/16)]) {	
				translate([25 + (i *0.5) ,0,0]) {
					cylinder(d=2, h=5, center=true);
				}
			}
	
		}

	}

}

module shield() {

	// viewport
	difference() {
		
		translate([0,0,-5]) {
				cylinder(d=90, h=15);
		}
		translate([0,0,-6.5]) {
				cylinder(d=87.5, h=15);
		}
		
		translate([viewport_offset,0,5]) {
			cube([10,10,15], center=true);
		}	
	}
		
}

module back() {
	
	wall = 1.5;
	motor_box_depth = 6;
	motor_axle_mount = 6.0;

	difference() {
		
		union() {
			// motor mount
			translate([0,0,-13])
				cube([20+wall,15+wall,motor_box_depth+wall], center=true);		

			// back shield
			translate([0,0,-10])
				cylinder(d=90, h=1.5, center=true);
		}
		
		// motor cutout
		translate([0,0,-15])
			translate([0,0,1])
				cube([20,15,8], center=true);

		// motor axle hole
		translate([0,0,-15])
			cylinder(d=motor_axle_mount, h=10);

		// LED hole
		translate([viewport_offset,0,-15]) {
			cylinder(d=3, h=10);
		}	
		
	}
	
}
