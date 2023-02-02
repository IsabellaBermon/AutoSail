translate([0,0,2]) holder(140,140,1.25,15,30);
translate([0,0,4.25]) cover(140,140,7,15,3,1.5,30);

base(140,140,21,55,15,12);

module base(hx,hy,d,fn,h_b,t_z){
    difference(){
        hull(){
            translate([(-hx/3-2),-(hy/2+d),t_z]) rotate([0,90,0]) cylinder(h_b, r= 8,$fn=fn);
            translate([(-hx/3-4.5),-(hy/2+10+d),1]) cube([20,20,2],$fn=fn);        
        }
        translate([(-hx/3+0.5),-(hy/2+d),t_z]) rotate([0,90,0]) cylinder(10, r= 10,$fn=fn);
        translate([(-hx/3-5),-(hy/2+d),t_z+3]) rotate([0,90,0],$fn=fn) cylinder(20, r= 2);
    } 
    difference(){
        hull(){
            translate([(hx/3-2),-(hy/2+d),t_z]) rotate([0,90,0]) cylinder(h_b, r= 8,$fn=fn);
            translate([(hx/3-4.5),-(hy/2+10+d),1]) cube([20,20,2],$fn=fn);        
        }
        translate([(hx/3+0.5),-(hy/2+d),t_z]) rotate([0,90,0]) cylinder(10, r= 10,$fn=fn);
        translate([(hx/3-5),-(hy/2+d),t_z+3]) rotate([0,90,0],$fn=fn) cylinder(20, r= 2);
    }     
        difference(){
        hull(){
            translate([(-hx/3-2),(hy/2+d),t_z]) rotate([0,90,0]) cylinder(h_b, r= 8);
            translate([(-hx/3-4.5),(hy-38-d),1]) cube([20,20,2],$fn=fn);    
        }
        translate([(-hx/3+0.5),(hy/2+d),t_z]) rotate([0,90,0]) cylinder(10, r= 10,$fn=fn);
        translate([(-hx/3-5),(hy/2+d),t_z+3]) rotate([0,90,0],$fn=fn) cylinder(20, r= 2);
    }  
    difference(){
        hull(){
            translate([(hx/3-2),(hy/2+d),t_z]) rotate([0,90,0]) cylinder(h_b, r= 8);
            translate([(hx/3-4.5),(hy-38-d),1]) cube([20,20,2],$fn=fn);        
        }
        translate([(hx/3+0.5),(hy/2+d),t_z]) rotate([0,90,0]) cylinder(10, r= 10,$fn=fn);
        translate([(hx/3-5),(hy/2+d),t_z+3]) rotate([0,90,0],$fn=fn) cylinder(20, r= 2);
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
      
      translate([2.5,-70,6]) sphere(1,$fn=fn);
      translate([-2.5,70,6]) sphere(1,$fn=fn);
      translate([70,2.5,6]) sphere(1,$fn=fn);
      translate([-70,-2.5,6]) sphere(1,$fn=fn);
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