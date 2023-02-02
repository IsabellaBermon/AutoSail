*boat(140,140);
*translate([0,0,2]) holder(140,140,1.25,15,30);
translate([0,0,4.25]) cover(140,140,7,15,3,1.5,30);
translate([60,0,5.5]) rotate([0,0,180]) fixer(8,5,9.5,60);
translate([-60,0,5.5]) fixer(8,5,9.5,60);
translate([0,60,5.5]) rotate([0,0,-90]) fixer(8,5,9.5,60);
translate([0,-60,5.5]) rotate([0,0,90]) fixer(8,5,9.5,60);
translate([0,-60,0]) rotate([0,0,-90]) fixer_tab(8,5,25,60);


module boat(hx,hy){
   difference(){
      cube([250,250,2],center=true);
      cube([hx,hy,4],center=true);
   }
}

module holder(hx,hy,th,d,fn){
   difference(){
      union(){
         hull(){
            translate([(hx/2+d),(hy/2+d),0]) sphere(th,$fn=fn);
            translate([-(hx/2+d),(hy/2+d),0]) sphere(th,$fn=fn);
            translate([-(hx/2+d),-(hy/2+d),0]) sphere(th,$fn=fn);
            translate([(hx/2+d),-(hy/2+d),0]) sphere(th,$fn=fn);
         }
         hull(){
            translate([(hx/2+2*th),(hy/2+2*th),0]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),(hy/2+2*th),3]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),(hy/2+2*th),0]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),(hy/2+2*th),3]) sphere(2*th,$fn=fn);
         }
         hull(){
            translate([-(hx/2+2*th),(hy/2+2*th),0]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),(hy/2+2*th),3]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),-(hy/2+2*th),0]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),-(hy/2+2*th),3]) sphere(2*th,$fn=fn);
         }
         hull(){
            translate([-(hx/2+2*th),-(hy/2+2*th),0]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),-(hy/2+2*th),3]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),-(hy/2+2*th),0]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),-(hy/2+2*th),3]) sphere(2*th,$fn=fn);
         }
         hull(){
            translate([(hx/2+2*th),(hy/2+2*th),0]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),(hy/2+2*th),3]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),-(hy/2+2*th),0]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),-(hy/2+2*th),3]) sphere(2*th,$fn=fn);
         }
      }
      cube([hx,hy,4],center=true);
      translate([0,0,-2.25])cube([hx+d,hy+d,2],center=true);
   }
}

module cover(hx,hy,d,d2,th,th2,fn){
   difference(){
      hull(){
         translate([(hx/2+d),(hy/2+d),3]) sphere(th,$fn=fn);
         translate([-(hx/2+d),(hy/2+d),3]) sphere(th,$fn=fn);
         translate([-(hx/2+d),-(hy/2+d),3]) sphere(th,$fn=fn);
         translate([(hx/2+d),-(hy/2+d),3]) sphere(th,$fn=fn);
         translate([(hx/2+d),(hy/2+d),-d/2+0.5]) cylinder(h=1,r=th,center=true,$fn=fn);
         translate([-(hx/2+d),(hy/2+d),-d/2+0.5])  cylinder(h=1,r=th,center=true,$fn=fn);
         translate([-(hx/2+d),-(hy/2+d),-d/2+0.5]) cylinder(h=1,r=th,center=true,$fn=fn);
         translate([(hx/2+d),-(hy/2+d),-d/2+0.5]) cylinder(h=1,r=th,center=true,$fn=fn);
         
      }
      translate([0,0,-2.75]) difference(){
         cube([1.5*hx,1.5*hy,4],center=true);
         hull(){
            translate([(hx/2+2*th2),(hy/2+2*th2),0]) cylinder(h=10,r=th,center=true,$fn=fn);
            translate([-(hx/2+2*th2),(hy/2+2*th2),0])  cylinder(h=10,r=th,center=true,$fn=fn);
            translate([-(hx/2+2*th2),-(hy/2+2*th2),0]) cylinder(h=10,r=th,center=true,$fn=fn);
            translate([(hx/2+2*th2),-(hy/2+2*th2),0]) cylinder(h=10,r=th,center=true,$fn=fn);
         }
         
      }
      hull(){
         translate([(hx/2+2*th2+0.1),(hy/2+2*th2+0.1),-4]) sphere(2*th2,$fn=fn);
         translate([(hx/2+2*th2+0.1),(hy/2+2*th2+0.1),0]) sphere(2*th2,$fn=fn);
         translate([-(hx/2+2*th2+0.1),(hy/2+2*th2+0.1),-4]) sphere(2*th2,$fn=fn);
         translate([-(hx/2+2*th2+0.1),(hy/2+2*th2+0.1),0]) sphere(2*th2,$fn=fn);
      }
      hull(){
         translate([-(hx/2+2*th2+0.1),(hy/2+2*th2+0.1),-4]) sphere(2*th2,$fn=fn);
         translate([-(hx/2+2*th2+0.1),(hy/2+2*th2+0.1),0]) sphere(2*th2,$fn=fn);
         translate([-(hx/2+2*th2+0.1),-(hy/2+2*th2+0.1),-4]) sphere(2*th2,$fn=fn);
         translate([-(hx/2+2*th2+0.1),-(hy/2+2*th2+0.1),0]) sphere(2*th2,$fn=fn);
      }
      hull(){
         translate([-(hx/2+2*th2+0.1),-(hy/2+2*th2+0.1),-4]) sphere(2*th2,$fn=fn);
         translate([-(hx/2+2*th2+0.1),-(hy/2+2*th2+0.1),0]) sphere(2*th2,$fn=fn);
         translate([(hx/2+2*th2+0.1),-(hy/2+2*th2+0.1),-4]) sphere(2*th2,$fn=fn);
         translate([(hx/2+2*th2+0.1),-(hy/2+2*th2+0.1),0]) sphere(2*th2,$fn=fn);
      }
      hull(){
         translate([(hx/2+2*th2+0.1),(hy/2+2*th2+0.1),-4]) sphere(2*th2,$fn=fn);
         translate([(hx/2+2*th2+0.1),(hy/2+2*th2+0.1),0]) sphere(2*th2,$fn=fn);
         translate([(hx/2+2*th2+0.1),-(hy/2+2*th2+0.1),-4]) sphere(2*th2,$fn=fn);
         translate([(hx/2+2*th2+0.1),-(hy/2+2*th2+0.1),0]) sphere(2*th2,$fn=fn);
      }
      translate([60,0,1.2]) fixer_hole(8,5,9.5,60);
      translate([-60,0,1.2]) fixer_hole(8,5,9.5,60);
      translate([0,60,1.2]) fixer_hole(8,5,9.5,60);
      translate([0,-60,1.2]) fixer_hole(8,5,9.5,60);
      
      translate([2.5,-70,6]) sphere(1,$fn=fn);
      translate([-2.5,70,6]) sphere(1,$fn=fn);
      translate([70,2.5,6]) sphere(1,$fn=fn);
      translate([-70,-2.5,6]) sphere(1,$fn=fn);
   }
}

module fixer(r1,r2,d,fn){
   difference(){
      translate([0,0,d/4]) cylinder(h=d/2,r=r1,center=true,$fn=fn);
      translate([-0.7*r1,-0.3*r1,d/2]) sphere(1,$fn=50);
      cylinder(h=12,r=1,center=true,$fn=fn);
   }
   difference(){
      translate([0,0,-d/4]) cylinder(h=d/2,r=r2,center=true,$fn=fn);
      translate([0, 0, -2.75])
         linear_extrude(height = 4.1, center = true, convexity = 10, twist = 0)
         polygon(points=[[2.6,2.6],[2.6,-2.6],[-2.6,-2.6],[-4.1,0],[-2.6,2.6]]);
      cylinder(h=10,r=1,center=true,$fn=fn);
   }
   difference(){
      translate([0,0,2]) scale([1,0.2,0.8]) sphere(r1,$fn=fn);
      translate([0,0,-10]) cube([20,20,20],center=true);
      cylinder(h=12,r=1,center=true,$fn=fn);
   }
}

module fixer_hole(r1,r2,d,fn){
   translate([0,0,d/4]) cylinder(h=d/2+0.2,r=r1+0.4,center=true,$fn=fn);
   translate([0,0,-d/4]) cylinder(h=d/2+0.2,r=r2+0.4,center=true,$fn=fn);
}

module fixer_tab(r1,r2,l,fn){
   difference(){
      union(){
         hull(){
            translate([0,0,-0.25]) cylinder(h=0.5,r=r1,center=true,$fn=fn);
            translate([0,0,-3]) cylinder(h=0.1,r=r2,center=true,$fn=fn);
         }
         hull(){
            translate([0,0,-0.25]) cylinder(h=0.5,r=r2,center=true,$fn=fn);
            translate([0,0,-3]) cylinder(h=0.1,r=r2,center=true,$fn=fn);
            translate([l,0,-2]) //cylinder(h=1,r=r2/1.5,center=true,$fn=fn);
            rotate_extrude(convexity = 10,$fn=fn)
               translate([r2/1.5, 0, 0])
               circle(r = 1,$fn=fn);
         }
         translate([0, 0, 2])
         linear_extrude(height = 5, center = true, convexity = 10, twist = 0, scale=0.85)
         polygon(points=[[2.5,2.5],[4,0],[2.5,-2.5],[-2.5,-2.5],[-2.5,2.5]]);
      }
      cylinder(h=10,r=1,center=true,$fn=fn);
      translate([0, 0, -2])cylinder(h=4,r=2,center=true,$fn=fn);
   }
}