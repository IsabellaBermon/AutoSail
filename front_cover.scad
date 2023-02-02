HX=180;
HYR=105;
HYL=160;
ANG=5.5;
HHR=HYR/(2*sin(90-ANG));
HHL=HYL/(2*sin(90-ANG));
BX=500;
BY=160;
BA=BY*sin(ANG);

*boat(HX,HHR,HYR,HHL,HYL);
*holderV2(HX,HHL,HYL,HHR,HYR,1.25,10,30);
*mirror([0,1,0]) holderV2(HX,HHL,HYL,HHR,HYR,1.25,10,30);
*translate([0,0,4]) cover(HX,HHL,HYL,HHR,HYR,7,15,4,1.5,30);
*translate([-80,-40,BA+0.5]) rotate([0,0,0]) fixer(8,5,8,60);
*translate([30,35,25])SwedenAntHolder();
*ColAntenaHolder();
seal_fixer(HX,HHL,HYL,HHR,HYR,1.25,10,30);

*ColAntenaHolder_p2();

*translate([200,0,35]) calypsoMount();

module calypsoMount(){
   difference(){
      union(){
         translate([0,0,1])
         hull(){
            rotate_extrude(convexity = 10,$fn=100)
                     translate([20.5, 0, 0])
                     circle(r = 5,$fn=100);
            translate([0,0,-4.5]) cylinder(h=1,r=25.8,center=true,$fn=100);
         }
         translate([0,0,-11])
         rotate_extrude(convexity = 10,$fn=100)
         difference(){
            translate([7,0]) square([14,15],center=true);
            translate([7.5+7, 0, 0]) circle(r = 7.5,$fn=100);
         }
         hull(){
            translate([0,-20,-20]) rotate([5.5,0,0]) cylinder(h=2,r=12,center=true,$fn=50);
            translate([0,0,-18]) rotate([0,90,0]) cylinder(h=24,r=1,center=true,$fn=50);
            
         }
         hull(){
            translate([0,20,-20]) rotate([-5.5,0,0]) cylinder(h=2,r=12,center=true,$fn=50);
            translate([0,0,-18]) rotate([0,90,0]) cylinder(h=24,r=1,center=true,$fn=50);
            
         }
      }
      for(i=[-27.5:120:360]){
         rotate([0,0,i]) translate([19,0,-0.5]) rotate([0,90,0]) cylinder(h=15,r=1.65,center=true,$fn=50);
      }
      cylinder(h=40,r=6,center=true,$fn=50);
      translate([0,-25,-20]) rotate([5.5,0,0]) cylinder(h=10,r=2,center=true,$fn=50);
      translate([0,25,-20]) rotate([-5.5,0,0]) cylinder(h=10,r=2,center=true,$fn=50);
   }
   
}

module ColAntenaHolder(){
   translate([24,-21.35,35]) rotate([-90,0,90]) SwedenAntHolder();
   difference(){
      translate([0,0,23.5]) cylinder(h=10,r=24,center=true,$fn=100);
      hull(){cover(HX,HY,HH,7,15,3,1.5,30);}
      translate([0,0,23.5]) cylinder(h=12,r=9.5,center=true,$fn=100);
      for(i=[0:120:360]){
         rotate([0,0,i]) translate([20,0,28]) cylinder(h=20,r=1.6,center=true,$fn=20);
      }
   }
}

module ColAntenaHolder_p2(){
   difference(){
      translate([0,0,15.5]) cylinder(h=11,r=11,center=true,$fn=100);
      rotate([0,0,30]) translate([0,0,15.5]) cylinder(h=15,r=9,center=true,$fn=6);
   }
   difference(){
      translate([0,0,14]) cylinder(h=8,r=24,center=true,$fn=100);
      translate([0,0,0]) cover(HX,HY,HH,7,15,3,1.5,30);
      translate([0,0,14]) cylinder(h=9,r=9.5,center=true,$fn=100);
      for(i=[0:120:360]){
         rotate([0,0,i]) translate([20,0,10]) cylinder(h=20,r=1.6,center=true,$fn=20);
      }
   }
}

module SwedenAntHolder(){
   translate([24,-21.35,0]) rotate([-90,0,90]) import("puck_antenna_mount.stl", convexity = 5);
}

module boat(hx,hhR,hyR,hhL,hyL){
   ha=HHR*sin(ANG);
   difference(){
      union(){
         translate([0,-(BY*sin(90-ANG))/2,BA/2]) rotate([ANG,0,0])cube([BX,BY,2],center=true);
         translate([0,(BY*sin(90-ANG))/2,BA/2]) rotate([-ANG,0,0])cube([BX,BY,2],center=true);
      }
      linear_extrude(height = 40, center = true, convexity = 10, twist = 0) 
      polygon(points=[[hx/2,hyR/2],[hx/2,-hyR/2],[-hx/2,-hyL/2],[-hx/2,hyL/2]]);
   }
}

module seal_fixer(hx,hhL,hyL,hhR,hyR,th,d,fn){
   difference(){
      union(){
         hull(){
            difference(){
               union(){
                  hull(){
                     translate([(hx/2+d),d,1.5+BA+d*sin(ANG)]) sphere(th,$fn=fn);
                     translate([-(hx/2+d),d,1.5+BA+d*sin(ANG)]) sphere(th,$fn=fn);
                     translate([-(hx/2+d),-(hyL/2+d*cos(ANG)),BA-(hhL)*sin(ANG)]) sphere(th,$fn=fn);
                     translate([(hx/2+d),-(hyR/2+d*cos(ANG)),BA-(hhR)*sin(ANG)]) sphere(th,$fn=fn);
                     
                  }
                  
               }
               translate([0,BY/4,BA]) cube([BX,BY/2,BA],center=true);
               translate([0,-(hhR+d)*sin(90-ANG)/2+1,BA-(hhR+d)*sin(ANG)/2-1]) rotate([ANG,0,0])cube([hx+3*d,2*hhL+2*d+1,4],center=true);
               cube([hx,2*hyR,hyR],center=true);
               translate([d,0,0]) cube([hx+d,2*hyR,hyR],center=true);
            }
            translate([-hx/2-d/2-1.25/2,-hyL/4-d/2,6])cube([d+1.25,hyL/2+d,0.1],center=true);
         }
         mirror([0,1,0])
         hull(){
            difference(){
               union(){
                  hull(){
                     translate([(hx/2+d),d,1.5+BA+d*sin(ANG)]) sphere(th,$fn=fn);
                     translate([-(hx/2+d),d,1.5+BA+d*sin(ANG)]) sphere(th,$fn=fn);
                     translate([-(hx/2+d),-(hyL/2+d*cos(ANG)),BA-(hhL)*sin(ANG)]) sphere(th,$fn=fn);
                     translate([(hx/2+d),-(hyR/2+d*cos(ANG)),BA-(hhR)*sin(ANG)]) sphere(th,$fn=fn);
                     
                  }
                  
               }
               translate([0,BY/4,BA]) cube([BX,BY/2,BA],center=true);
               translate([0,-(hhR+d)*sin(90-ANG)/2+1,BA-(hhR+d)*sin(ANG)/2-1]) rotate([ANG,0,0])cube([hx+3*d,2*hhL+2*d+1,4],center=true);
               cube([hx,2*hyR,hyR],center=true);
               translate([d,0,0]) cube([hx+d,2*hyR,hyR],center=true);
            }
            translate([-hx/2-d/2-1.25/2,-hyL/4-d/2,6])cube([d+1.25,hyL/2+d,0.1],center=true);
         }
         
      }
      hull(){
            translate([-hx/2-2*th,0,7]) rotate([90,0,0]) cylinder(h=2*hyL,r=2*th,center=true,$fn=fn);
            translate([-hx/2-2*th,0,-2]) rotate([90,0,0]) cylinder(h=2*hyL,r=2*th,center=true,$fn=fn);
         }
   }
   difference(){
      union(){
         holderV2(HX,HHL,HYL,HHR,HYR,1.25,10,30);
         mirror([0,1,0]) holderV2(HX,HHL,HYL,HHR,HYR,1.25,10,30);
      }
      translate([d/2+2,0,0]) cube([hx+d+4,4*hyR,hyR],center=true);
   }
}

module holderV2(hx,hhL,hyL,hhR,hyR,th,d,fn){
   ha=HHR*sin(ANG);
   difference(){
      union(){
         rotate([0,0,0])
         hull(){
            translate([(hx/2+d),d,1.5+BA+d*sin(ANG)]) sphere(th,$fn=fn);
            translate([-(hx/2+d),d,1.5+BA+d*sin(ANG)]) sphere(th,$fn=fn);
            translate([-(hx/2+d),-(hyL/2+d*cos(ANG)),BA-(hhL)*sin(ANG)]) sphere(th,$fn=fn);
            translate([(hx/2+d),-(hyR/2+d*cos(ANG)),BA-(hhR)*sin(ANG)]) sphere(th,$fn=fn);
         }
         hull(){
            translate([-(hx/2+2*th),0,BA]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),0,3+BA]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),-(hyL/2+2*th),BA-hhL*sin(ANG)]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),-(hyL/2+2*th),3+BA-hhL*sin(ANG)]) sphere(2*th,$fn=fn);
         }
         
         hull(){
            translate([-(hx/2+2*th),-(hyL/2+2*th),BA-hhL*sin(ANG)]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),-(hyL/2+2*th),3+BA-hhL*sin(ANG)]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),-(hyR/2+2*th),BA-hhR*sin(ANG)]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),-(hyR/2+2*th),3+BA-hhR*sin(ANG)]) sphere(2*th,$fn=fn);
         }
         hull(){
            translate([(hx/2+2*th),0,BA]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),0,3+BA]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),-(hyR/2+2*th),BA-hhR*sin(ANG)]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),-(hyR/2+2*th),3+BA-hhR*sin(ANG)]) sphere(2*th,$fn=fn);
         }
      }

      linear_extrude(height = 40, center = true, convexity = 10, twist = 0) 
      polygon(points=[[hx/2,hyR/2],[hx/2,-hyR/2],[-hx/2,-hyL/2],[-hx/2,hyL/2]]);
      cube([hx,hyR/2,hyR],center=true);
      translate([0,BY/4,BA]) cube([BX,BY/2,BA],center=true);
      translate([0,-(hhR+d)*sin(90-ANG)/2+1,BA-(hhR+d)*sin(ANG)/2-1]) rotate([ANG,0,0])cube([hx+3*d,2*hhL+2*d+1,4],center=true);
   }
}

module holder(hx,hh,hy,th,d,fn){
   ha=HH*sin(ANG);
   difference(){
      union(){
         #translate([0,-((hh)*sin(90-ANG))/2,-(hh)*sin(ANG)/2+BA+sin(90-ANG)]) rotate([ANG,0,0])
         hull(){
            translate([(hx/2+d),(hh/2+d),0]) sphere(th,$fn=fn);
            translate([-(hx/2+d),(hh/2+d),0]) sphere(th,$fn=fn);
            translate([-(hx/2+d),-(hh/2+d),0]) sphere(th,$fn=fn);
            translate([(hx/2+d),-(hh/2+d),0]) sphere(th,$fn=fn);
         }
         hull(){
            translate([-(hx/2+2*th),0,BA+8*sin(ANG)-th/2]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),0,3+BA+8*sin(ANG)-th/2]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),-(hy/2+2*th),ha+8*sin(ANG)]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),-(hy/2+2*th),3+ha+8*sin(ANG)]) sphere(2*th,$fn=fn);
         }
         translate([0,-(hy/2+2*th),ha+8*sin(ANG)])
         hull(){
            translate([-(hx/2+2*th),0,0]) sphere(2*th,$fn=fn);
            translate([-(hx/2+2*th),0,3]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),0,0]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),0,3]) sphere(2*th,$fn=fn);
         }
         hull(){
            translate([(hx/2+2*th),0,BA+8*sin(ANG)-th/2]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),0,3+BA+8*sin(ANG)-th/2]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),-(hy/2+2*th),ha+8*sin(ANG)]) sphere(2*th,$fn=fn);
            translate([(hx/2+2*th),-(hy/2+2*th),3+ha+8*sin(ANG)]) sphere(2*th,$fn=fn);
         }
      }
      *translate([0,-hh*sin(90-ANG)/2,BA-8*sin(90-ANG)/2]) rotate([ANG,0,0])cube([hx,hh,8],center=true);
      translate([0,-hy/4,0]) cube([hx,hy/2,hy],center=true);
      translate([0,BY/4,BA]) cube([BX,BY/2,BA],center=true);
      translate([0,0,BA]) cube([hx,BY/2,BA],center=true);
      translate([0,-(hh+d)*sin(90-ANG)/2+1,BA-(hh+d)*sin(ANG)/2-1]) rotate([ANG,0,0])cube([hx+3*d,hh+2*d+1,4],center=true);
   }
}
//HX,HHL,HYL,HHR,HYR,7,15,3,1.5,30
module cover_half(hx,hhL,hyL,hhR,hyR,d,d2,th,th2,fn){
   ha=hhL*sin(ANG);
   
   difference(){
      hull(){
         // Left corners
         translate([-(hx/2+d),-(hyL/2+d),BA-(hhL*sin(ANG))]) sphere(th,$fn=fn);
         translate([-(hx/2+d),-(hyL/2+d),BA-(hhL*sin(ANG))-th+0.5]) cylinder(h=1,r=th,center=true,$fn=fn);
         // Rigth corners
         translate([(hx/2+d),-(hyR/2+d),BA-(hhR*sin(ANG))]) sphere(th,$fn=fn);
         translate([(hx/2+d),-(hyR/2+d),BA-(hhR*sin(ANG))-th+0.5]) cylinder(h=1,r=th,center=true,$fn=fn);
         
         // Rigth Center
         translate([(hx/2+d),0,BA]) sphere(th,$fn=fn);
         translate([(hx/2+d),0,BA-th+0.5]) cylinder(h=1,r=th,center=true,$fn=fn);
         
         // Left Center
         translate([-(hx/2+d),0,BA]) sphere(th,$fn=fn);
         translate([-(hx/2+d),0,BA-th+0.5])  cylinder(h=1,r=th,center=true,$fn=fn);
            
      }
      translate([0,0,-5.27]) holderV2(HX,hhL,hyL,hhR,hyR,1.4,15,30);
      translate([0,BY/4,BA]) cube([BX,BY/2,2*BA],center=true);
      translate([80,-30,BA/1.2]) rotate([ANG,0,0]) fixer_hole(8,5,10,60);
      translate([-80,-40,BA/1.3]) rotate([ANG,0,0]) fixer_hole(8,5,10,60);
      
      translate([0,-58,BA/1.5]) rotate([ANG,0,0]) fixer_hole(8,5,10,60);
   }
   
}

//HX,HHL,HYL,HHR,HYR,7,15,3,1.5,30
module cover(hx,hhL,hyL,hhR,hyR,d,d2,th,th2,fn){
   
   cover_half(hx,hhL,hyL,hhR,hyR,d,d2,th,th2,fn);
         
   difference(){
      union(){
         mirror([0,1,0]) cover_half(hx,hhL,hyL,hhR,hyR,d,d2,th,th2,fn);
         // Antena Holder
         translate([30,35,15]) cylinder(h=12,r=13,center=true,$fn=2*fn);
      }
      translate([30,35,12]) rotate([0,0,30]) cylinder(h=12,r=9.5,center=true,$fn=6);
      translate([30,35,12]) rotate([0,0,30]) cylinder(h=40,r=6.2,center=true,$fn=2*fn);
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
            translate([l,0,-1]) //cylinder(h=1,r=r2/1.5,center=true,$fn=fn);
            rotate_extrude(convexity = 10,$fn=fn)
               translate([r2/1.5, 0, 0])
               circle(r = 1,$fn=fn);
         }
         translate([0, 0, 2])
         linear_extrude(height = 4, center = true, convexity = 10, twist = 0)
         polygon(points=[[2.5,2.5],[4,0],[2.5,-2.5],[-2.5,-2.5],[-2.5,2.5]]);
      }
      cylinder(h=10,r=1,center=true,$fn=fn);
      translate([0, 0, -2])cylinder(h=4,r=2,center=true,$fn=fn);
   }
}