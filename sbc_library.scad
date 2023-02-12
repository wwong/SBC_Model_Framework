/*
    SBC Library Copyright 2016,2017,2018,2019,2020,2021,2022 Edward A. Kisiel hominoid@cablemi.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html

    20190214 Version 1      Component Library for the SBC Model Framework    
                            component classes and types:
                            memory  - emmc, emmc_plug, sodimm_5.2, sodimm_9.2
                            switch - slide_4x9
                            button - momentary_6x6x9, momentary_6x6x4
                            plug - pwr5.5_7.5x11.5, pwr2.5_5x7.5, rtc_micro, uart_micro, molex_4x1, small_encl_satapwr
                            usb2 - single_vert_a, double_stacked_a, micro
                            usb3 - double_stacked_a
                            network - rj45_single
                            video - hdmi_a, dp-hdmi_a
                            fan - micro, encl_pmw
                            gpio - encl_header_30, encl_header_12, header_40, header_20
                            ic - ic_2.8x2.8, ic_4.7x4.7, ic_5x5, ic_5.75x5.75, ic_6x6, ic_6.75x6.75, ic_7x7, ic_6.7x8.4, ic_11x8, ic_13x8
                            audio - out-in-spdif
                            storage - sata_header, sata_encl_power, sata_encl_header, m.2_header, sdcard
                            combo - rj45-usb2_double, rj45-usb3_double
                            jumper - header_2x1, header_7x1
                            misc - ir_1
                        
    20190218 Version 1.0.1  added type "jack_3.5" under class "audio"
                            add type "ic_3x3","ic_6.4x6.4","ic_3.7x3.7","ic_4.3x5.1","ic_5.4x5.3" under class "ic"
    20200425 Version 1.0.2  corrected HK Odroid-h2 hdmi-displayport component y size
                            added type "ic_13x9","ic_9x9" under class "ic"
                            added "heatsink" class with types "xu4_oem","xu4q_oem","c1+_oem","c2_oem","c4_oem","n2_oem","h2_oem"
                            added Odroid-N2_Heatsink.stl from Hard Kernel
                            added Odroid-H2_Heatsink.stl from HK forum user @ravelle
    20200725 Version 1.0.3  added Odroid-N2+ Heatsink.stl from Hard Kernel as class "heatsink" type "n2+_oem" and type "batt_hold_1"
                            under "misc" class
    20201021 Version 1.0.4  added type "header_5x1" under "jumper" class, type "sata_power_vrec" under class "storage"
                            and type "hc4_oem" under class "heatsink"
    20220202 Version 1.0.5  added type "header_6x1","header_3x2"  under "jumper" class, led_3x1.5 under misc class, 
                            momentary_3x2 under button class, fixed ir, corrected sata height, fixed header_7x1
    20220413 Version 1.0.6  adjusted slide_4x9, adjust m.2_header, rj45-usb2_double, rj45-usb3_double, out-in-spdif,
                            momentary_6x6x4, fixed color for usb2 micro otg, adjust all header heights, 
                            added mipi_csi, mipi_dsi, m.2_stud
    20220515 Version 1.0.7  added pcie(), jst_ph(), cm(), cm_holder(), corrected odroid-m1 heatsink height and sbc location,
                            and other fixes and adjustments
    20220623 Version 1.0.7  added pwr5.5_9.5x7
    20221020 Version 1.0.8  added usbc(),usb2(single_horizontal_a),usb3(single_horizontal_a),hdmi_micro,hdmi_mini,dp_mini,
                            ic_13x7.5,ic_13x11.5,ic_15x7,ic_15x13,momentary_7x3x3,khadas_oem,khadas_fan_oem,radxa_oem,
                            double_stacked_usb3-usbc,ic_12.5x12.5,ic_10x13,header_26,header_3x1,"ic_12x12","ic_15x15",
                            hdmi_a_vertical
    20221101 Version 1.0.9  added microsdcard2
    20221207 Version 1.0.10 added n2l_oem and n2lq_oem heatsinks
    202xxxxx Version 1.0.11 added header_24
    
    see https://github.com/hominoids/SBC_Case_Builder

    place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
    pcb_add(size_x,size_y,loc_x,loc_y,rotation,side,type,pcbsize_z,data_1,data_2) - "square","round"
    pcb_sub(size_x,size_y,loc_x,loc_y,rotation,side,type,pcbsize_z,data_1,data_2) - "square","round","art"
    pcb_art(scale_d1,type,dxf_file) - "dxf"
    pcb(size, radius)
    memory(x,y,rotation,side,type,pcbsize_z) - "emmc","emmc_plug","sodimm_5.2","sodimm_9.2"
    switch(x,y,rotation,side,type,pcbsize_z) - "slide_4x9"
    button(x,y,rotation,side,type,pcbsize_z) - "momentary_6x6x9","momentary_6x6x4","momentary_6x6x4_90","momentary_4x2x1"
    plug(x,y,rotation,side,type,pcbsize_z) - "pwr2.5_5x7.5","pwr5.5_7.5x11.5","pwr5.5_10x10","pwr5.5_9.5x7","rtc_micro",
                                             "audio_micro","uart_micro","molex_4x1","small_encl_satapwr"
    usb2(x,y,rotation,side,type,pcbsize_z) - "single_vertical_a","double_stacked_a","micro","single_horizontal_a"
    usb3(x,y,rotation,side,type,pcbsize_z) - "double_stacked_a",single_horizontal_a
    usbc(x,y,rotation,side,type,pcbsize_z) - "single_horizontal"
    network(x,y,rotation,side,type,pcbsize_z) - "rj45_single", "rj45_double_stacked"
    video(x,y,rotation,side,type,pcbsize_z - "hdmi_a","hdmi_a_vertical","dp-hdmi_a","mipi_csi","mipi_dsi",hdmi_micro,hdmi_mini,dp_mini
    fan(x,y,rotation,side,type,pcbsize_z) - "micro","encl_pmw","encl_pmw_h"
    gpio(x,y,rotation,side,type,pcbsize_z) - "encl_header_30","encl_header_12","header_40","header_20","header_24","header_26"
    ic(x,y,rotation,side,type,pcbsize_z) - "ic_2.8x2.8","ic_3x3","ic_3.7x3.7","ic_4x4","ic_4.5x4.5","ic_4.7x4.7","ic_5x5","ic_5.5x5.5",
                                            "ic_5.75x5.75","ic_6x6","ic_6.4x6.4",ic_6.75x6.75","ic_7x7","ic_4.3x5.1","ic_5.4x5.3",
                                            "ic_6.7x8.4","ic_9x9","ic_10x13","ic_11x8","ic_11.5x11.5","ic_13x8","ic_13x9","ic_16x10",
                                            "ic_12.5x12.5","ic_12x12","ic_15x15"
    audio(x,y,rotation,side,type,pcbsize_z) - "out-in-spdif","jack_3.5"
    storage(x,y,rotation,side,type,pcbsize_z) - "sdcard","sdcard_i","microsdcard","microsdcard2","sata_header","sata_power_vrec",
                                                "sata_encl_power","sata_encl_header","m.2_header","m.2_stud"
    combo(x,y,rotation,side,type,pcbsize_z) - "rj45-usb2_double","rj45-usb3_double","double_stacked_usb3-usbc"
    jumper(x,y,rotation,side,type,pcbsize_z) - "header_2x1","header_3x1","header_3x2","header_5x1","header_6x1","header_7x1","header_13x1"
    misc(x,y,rotation,side,type,pcbsize_z) - "ir_1","led_3x1.5","lcd_2.2","bat_hold_1"
    heatsink(x,y,rotation,side,type,pcbsize_z,soc1size_z) - "hc4_oem","c4_oem","c2_oem","c1+_oem","xu4_oem","n1_oem",
                                                            "xu4q_oem","n2_oem","n2+_oem","m1_oem","h2_oem","khadas_oem",
                                                            "khadas_fan_oem","radxa_oem"
    pcie(x,y,rotation,side,type,pcbsize_z) - "x4"
    jst_ph(x,y,rotation,side,type,pcbsize_z) - type is #pins
    cm_holder(x,y,rotation,side,type,pcbsize_z) - jetsonnano
    cm(x,y,rotation,side,type,pcbsize_z) - jetsonnano
    
*/

module place(x,y,size_x,size_y,rotation,side,type,pcbsize_z) {

    if (side == "top") {
       if ((rotation >= 0 && rotation < 90) || (rotation < -270 && rotation > -360))
           translate([x,y,pcbsize_z]) rotate([0,0,-rotation]) children();

       if ((rotation >= 90 && rotation < 180) || (rotation < -180 && rotation >= -270))
           translate([x,y+size_x,pcbsize_z]) rotate([0,0,-rotation]) children();
       
       if ((rotation >= 180 && rotation < 270) || (rotation < -90 && rotation >= -180))
           translate([x+size_x,y+size_y,pcbsize_z]) rotate([0,0,-rotation]) children(0);
       
       if ((rotation >= 270 && rotation < 360) || (rotation < 0 && rotation >= -90))
           translate([x+size_y,y,pcbsize_z]) rotate([0,0,-rotation]) children();
   }   
   if (side == "bottom") {
       if ((rotation >= 0 && rotation < 90) || (rotation < -270 && rotation > -360))
           translate([x+size_x,y,0]) rotate([0,180,rotation]) children();
       
       if ((rotation >= 90 && rotation < 180) || (rotation < -180 && rotation >= -270))
           translate([x+size_y,y+size_x,0]) rotate([0,180,rotation]) children();
           
       if ((rotation >= 180 && rotation < 270) || (rotation < -90 && rotation >= -180))
           translate([x,y+size_y,0]) rotate([0,180,rotation]) children();
       
       if ((rotation >= 270 && rotation < 360) || (rotation < 0 && rotation >= -90))
           translate([x,y,0]) rotate([0,180,rotation]) children();
   }    
   children([1:1:$children-1]);
}

/* addition module */
module pcb_add(size_x,size_y,loc_x,loc_y,rotation,side,type,pcbsize_z,data_1,data_2) {
    if(type == "square") {
        rotate([0,0,rotation]) translate([loc_x,loc_y,0])
            cube([size_x,size_y,pcbsize_z]);
    }
    if(type == "round") {
        translate([loc_x,loc_y,0])
            cylinder(d=data_1,h=pcbsize_z);
    }    
}

/* subtractive module */
module pcb_sub(size_x,size_y,loc_x,loc_y,rotation,side,type,pcbsize_z,data_1,data_2) {
    // square
    if(type == "square") {
        rotate([0,0,rotation]) translate([loc_x,loc_y,-4])
            cube([size_x,size_y,pcbsize_z+5]);
    }
    if(type == "round") {
        translate([loc_x,loc_y,-1])
            cylinder(d=data_1,h=pcbsize_z+4);
    }
    if(type == "art") {
        rotate([0,0,rotation]) translate([loc_x,loc_y,-1])
            pcb_art(data_1,data_2); 
    }
}

// art work module
module pcb_art(scale_d1,type,dxf_file) {
    if(type == "dxf") {
            linear_extrude(height = pcbsize_z) import(file = dxf_file, scale=scale_d1); 
    }
}

// pcb board
module pcb(size, radius) {
    x = size[0];
    y = size[1];
    z = size[2];   
    linear_extrude(height=z)
      hull() {
        translate([0+radius ,0+radius, 0]) circle(r=radius);
        translate([0+radius, y-radius, 0]) circle(r=radius);
        translate([x-radius, y-radius, 0]) circle(r=radius);
        translate([x-radius, 0+radius, 0]) circle(r=radius);
    }  
}

// memory class
module memory(x,y,rotation,side,type,pcbsize_z) {
    // socketed emmc
    if(type == "emmc") {
        size_x = 13.5;
        size_y = 18.5;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
            union (){
                color("darkred") translate([0,0,1.1]) cube([size_x, size_y, .8]);
                color("dimgray") translate([1,2,1.9]) cube([11.5, 13, .9]); 
                difference() {
                    color("dimgray") translate([2,13.5,0]) cube([9.3, 3.4, 1.1]);
                    color("dimgray") translate([2.5,14.5,-.1]) cube([8.3, .5, 1.1]);
                    color("dimgray") translate([2.5,15.9,-.1]) cube([8.3, .5, 1.1]);
                    color("dimgray") translate([2.5,14.5,-.1]) cube([.5, 1.8, 1.1]);
                    color("dimgray") translate([10.3,14.5,-.1]) cube([.5, 1.8, 1.1]);
                }
            }
        }
 
    // emmc plug
    if(type == "emmc_plug") {
        size_x = 8.3;
        size_y = 2.16;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
       union (){
            difference() {
            color("black") translate([0,0,0]) cube([size_x, size_y, .82]);
            color("black") translate([1,.25,.15]) cube([6.3, 1.65, 1]); 
            color("black") translate([1,0,.72]) cube([6.3, 2.5, 2]);                
            }
            for (i=[1.25:.4:7.2]) {
                color("gold") translate ([i,-.05,0]) cube([.16,.3,.82]);
                color("gold") translate ([i,1.9,0]) cube([.16,.3,.82]);
            }
        }
    }
       
    // sodimm-5.2 socket
    if(type == "sodimm_5.2") {                
        size_x = 73;
        size_y = 6.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                
                color("dimgray") translate([0,0,0]) cube([size_x,size_y,5.2]);
                color("dimgray") translate([2,-1,1.75]) cube([69,3,5]);
                color("dimgray") translate([3.5,-1,1.75]) cube([28.5,5.25,.92]);
                color("dimgray") translate([34.5,-1,1.75]) cube([35,5.25,.92]);
            }
            for (i=[2:.5:31]) {
                color("gold") translate ([i+.5,2,1.75]) cube([.25,2,.25]);
            }
            for (i=[34:.5:69]) {
                color("gold") translate ([i+.5,2,1.75]) cube([.25,2,.25]);
            }
        }
    }
        
    // sodimm-9.2 socket
    if(type == "sodimm_9.2") {        
        size_x = 73;
        size_y = 6.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                
                color("dimgray") translate([0,0,0]) cube([size_x,size_y,9.2]);
                color("dimgray") translate([2,-1,5.7]) cube([69,3,5]);
                color("dimgray") translate([3.5,-1,5.7]) cube([28.5,5.25,.92]);
                color("dimgray") translate([34.5,-1,5.7]) cube([35,5.25,.92]);
            }
            for (i=[2:.5:31]) {
                color("gold") translate ([i+.5,2,5.7]) cube([.25,2,.25]);
            }
            for (i=[34:.5:69]) {
                color("gold") translate ([i+.5,2,5.7]) cube([.25,2,.25]);
            }
        }
    }   
}

// switch class
module switch(x,y,rotation,side,type,pcbsize_z) {
    // boot selector switch
    if(type=="slide_4x9") {
        size_x = 9;                
        size_y = 3.75;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            color("silver") translate([0,0,.5]) cube([size_x, size_y, 3.5]);
            color("white") translate([3.75,-1.99,1.75]) cube([3, 2, 1.5]);
        }
    }
}

// button class
module button(x,y,rotation,side,type,pcbsize_z) {
    // tall button type
    if(type=="momentary_6x6x9") {
        size_x = 6;
        size_y = 6;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("silver") translate([0,0,0]) cube([size_x,size_y,3.5]);
            color("black") translate([3,3,3.5]) cylinder(r=1.6,h=9,$fn=30);
            color("black") translate([1,1,3.5]) sphere(d=1);
            color("black") translate([1,5,3.5]) sphere(d=1);
            color("black") translate([5,1,3.5]) sphere(d=1);
            color("black") translate([5,5,3.5]) sphere(d=1);
        }
    }
    if(type=="momentary_6x6x4") {
        size_x = 6;
        size_y = 6;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("silver") translate([0,0,0]) cube([size_x,size_y,3.5]);
            color("black") translate([3,3,3.5]) cylinder(r=1.6,h=2.5,$fn=30);
            color("black") translate([1,1,3.5]) sphere(d=1);
            color("black") translate([1,5,3.5]) sphere(d=1);
            color("black") translate([5,1,3.5]) sphere(d=1);
            color("black") translate([5,5,3.5]) sphere(d=1);
        }
    }
    if(type=="momentary_6x6x4_90") {
        size_x = 6;
        size_y = 6;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        rotate([90, 0, 0]) union() {
            color("silver") translate([0,0,0]) cube([size_x,size_y,3.5]);
            color("black") translate([3,3,3.5]) cylinder(r=1.6,h=2.5,$fn=30);
            color("black") translate([1,1,3.5]) sphere(d=1);
            color("black") translate([1,5,3.5]) sphere(d=1);
            color("black") translate([5,1,3.5]) sphere(d=1);
            color("black") translate([5,5,3.5]) sphere(d=1);
        }
    }
    if(type=="momentary_4x2x1") {
        size_x = 4;
        size_y = 2;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            color("silver") translate([0,0,0]) cube([size_x, size_y, 2]);
            color("white") translate([1,size_y,.5]) cube([2, 1.5, 1]);
        }
    }
    if(type=="momentary_7x3x3_90") {
        size_x = 7;
        size_y = 3;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            color("silver") translate([0,0,0]) cube([size_x, size_y, 3]);
            color("black") translate([1.5,-1.4,.5]) cube([4, 1.5, 1.5]);
        }
    }


}

// plug-connector class
module plug(x,y,rotation,side,type,pcbsize_z) {
    // 2.5mm power plug 7.5mm
    if(type=="pwr2.5_5x7.5") {
        size_x = 5;
        size_y = 7.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 4]);
                color("black") translate([2.5,-1,2]) rotate([90,0,0]) 
                cylinder(d=3, h=7, center=true, $fn=30);
            }
            color("white") translate([2.5,3,2]) rotate([90,0,0]) 
            cylinder(d=1, h=2,$fn=30);
        }
    }

    // 5.5mm power plug 7.5mm x 11.5mm
    if(type=="pwr5.5_7.5x11.5") {
        size_x = 7.6;
        size_y = 11.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 9.75]);
                color("black") translate([3.8,10,6.5]) rotate([90,0,0]) 
                cylinder(r=3, h=11, $fn=30);
            }
            color("white") translate([3.8,10,6.5]) rotate([90,0,0]) 
            cylinder(d=1.5, h=9,$fn=30);
        }
    }
    // 5.5mm power plug 10mm x 10mm
    if(type=="pwr5.5_10x10") {
        size_x = 10;
        size_y = 13.36;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 10]);
                color("black") translate([5,10,5]) rotate([90,0,0]) 
                cylinder(r=3, h=11, $fn=30);
            }
            color("white") translate([5,10,5]) rotate([90,0,0]) 
            cylinder(d=1.5, h=9,$fn=30);
        }
    }
    // 5.5mm power plug 9.5mm x 7mm
    if(type=="pwr5.5_9.5x7") {
        size_x = 9.5;
        size_y = 9.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 7]);
                color("black") translate([5.7,8.49,3.5]) rotate([90,0,0]) 
                cylinder(d=3.35, h=8.5, $fn=30);
            }
            color("white") translate([5.7,8.5,3.5]) rotate([90,0,0]) 
            cylinder(d=1.4, h=8.5,$fn=30);
        }
    }
    // 5.5mm power plug 9.5x11
    if(type=="pwr5.5_9.5x11") {
        size_x = 9.5;
        size_y = 15;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 11]);
                color("black") translate([4.75,8.49,7]) rotate([90,0,0])
                cylinder(r=3, h=8.5, $fn=30);
            }
            color("white") translate([4.75,8.5,7]) rotate([90,0,0])
            cylinder(d=1.4, h=8.5,$fn=30);
        }
    }

    // rtc micro connector type
    if(type=="rtc_micro") {
        size_x = 7.5;
        size_y = 3.75;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                color("white") translate([0,0,0]) cube([size_x,size_y,4.75]);
                color("darkgray") translate([1.5,.5,1]) cube([4.5,2.75,6]);
                color("white") translate([-.5,.75,-.5]) cube([1,2.5,6]);
                color("white") translate([7,.75,-.5]) cube([1,2.5,6]);
                color("darkgray") translate([2.25,-.5,1]) cube([3,2,6]);
            }
            color("silver") translate ([2.75,2,.5]) cube([.6,.6,4]);
            color("silver") translate ([4.5,2,.5]) cube([.6,.6,4]);
        }
    }
    
    // audio micro connector type
    if(type=="audio_micro") {
        size_x = 7.5;
        size_y = 3.75;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([0,0,3.75]) rotate([-90,0,0])
        union() {  
            difference () {
                color("white") translate([0,0,0]) cube([size_x,size_y,4.75]);
                color("darkgray") translate([1.5,.5,1]) cube([4.5,2.75,6]);
                color("white") translate([-.5,.75,-.5]) cube([1,2.5,6]);
                color("white") translate([7,.75,-.5]) cube([1,2.5,6]);
                color("darkgray") translate([2.25,-.5,1]) cube([3,2,6]);
            }
            color("silver") translate ([2.75,2,.5]) cube([.6,.6,4]);
            color("silver") translate ([4.5,2,.5]) cube([.6,.6,4]);
        }
    }
    
    // uart micro connector type
    if(type=="uart_micro") {
        size_x = 12.5;
        size_y = 5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                union() {
                
                    difference () {
                        color("white") translate([0,0,0]) cube([size_x,size_y,6]);
                        color("darkgray") translate([.5,.5,2]) cube([11.5,4,6]);
                    }
                    color("white") translate([12,3.75,.5]) rotate([0,0,45]) cube([1,2,5.5]);
                    color("white") translate([-0.2,4,.5]) rotate([0,0,-45]) cube([1,2,5.5]);
                }
                color("white") translate([12.5,0,-.5]) cube([2,6,7]);
                color("white") translate([-1,0,-.5]) cube([1,6,7]);
                color("white") translate([-1,5,-.5]) cube([14,2,7]);
                color("white") translate([-0.7,4.5,-.1]) rotate([0,0,-45]) cube([1,2,7]);
                color("darkgray") translate([-1,1.5,2]) cube([14,1,7]);
            }
            for (i=[2.5:2.5:10]) {
                color("silver") translate ([i,3,.5]) cube([.6,.6,5]);
            }
        }
    }

    // molex power 4x1 connector type
    if(type=="molex_4x1") {
        size_x = 23;
        size_y = 8;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                union() {                
                    difference () {
                        color("white") translate([0,0,0]) cube([size_x,size_y,10]);
                        color("darkgray") translate([.5,.5,2]) cube([22,7,11]);
                    }
                    color("white") translate([-.9,5.5,0]) rotate([0,0,-45]) 
                    cube([1,4,10]);
                    color("white") translate([23,5,0]) rotate([0,0,45]) 
                    cube([1,4,10]);
                }               
                color("white") translate([-1,0,-.5]) cube([1,9,11]);
                color("white") translate([23,0,-.5]) cube([2,9,11]);
                color("white") translate([-1,8,-.5]) cube([25,3,11]);
                color("white") translate([-1.7,7.5,-.5]) rotate([0,0,-45])
                cube([2.25,4,11]);
                color("white") translate([23.1,6,-.5]) rotate([0,0,45])
                cube([3,4,11]);
            }
            for (i=[3.75:5:20]) {
                color("silver") translate ([i,4,2]) cylinder(d=2,h=7, $fn=30);
            }
        }
    }
    // sata small power 4x1 connector type
    if(type=="small_encl_satapwr") {
        size_x = 12.7;
        size_y = 6.6;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            union() {                
                difference () {
                    color("white") translate([0,0,0]) cube([size_x,size_y,8]);
                    color("darkgray") translate([.5,.5,2]) cube([11.7,5.6,11]);
                }
            }               
            for (i=[2.54:2.54:11.7]) {
                color("silver") translate ([i,4,2]) cylinder(d=.67,h=6, $fn=30);
            }
       }
   }
}

// usb 2.0 port class
module usb2(x,y,rotation,side,type,pcbsize_z) {
    // usb2 single vertical socket
    if(type=="single_vertical_a") {
        size_x = 5.70;
        size_y = 19.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {   
            // usb 2.0 port
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 14]);
                color("dimgray") translate([.5,-1,.75]) cube([4.75, 12.5, 13]);
            }
            color("silver") translate([-.65,0,1]) cube([.65,.5,12]);    
            color("silver") translate([5.7,0,1]) cube([.65,.5,12]);
            color("silver") translate([1,0,14]) cube([3.8,.5,.65]);            
            color("white") translate([1,0,1.5]) cube([2, 17.5, 11]);
        }
    }
    // usb2 double stacked sockets
    if(type=="double_stacked_a") {
        size_x = 13.25;
        size_y = 17.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 15.5]);
                color("dimgray") translate([1,-.1,1]) cube([11.25, 15.5, 13.5]);
            }
            color("silver") translate([0,0,6.75]) cube([13.25, 17.5, 2]);
            color("white") translate([1.5,1,12]) cube([10, 12.5, 1.5]);
            color("white") translate([1.5,1,4]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,1]) cube([.65,.5,5]);
            color("silver") translate([-.65,0,9]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,9]) cube([.65,.5,5]);
            color("silver") translate([1,0,15.5]) cube([11.5,.5,.65]);            

        }
    }
    // usb2 micro otg
    if(type=="micro") {
        size_x = 7;
        size_y = 4.5;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)        
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 3.5]);
                color("dimgray") translate([.5,-.1,.5]) cube([6, 3.5, 2.5]);
                color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=6.5,$fn=30);
                color("silver") translate([7,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=6.5,$fn=30);

            }
            difference() {
                union() {
                    color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=4.5,$fn=30);
                    color("silver") translate([7,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=4.5,$fn=30);
                }               
                color("silver") translate([0,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=1.25, h=6.5,$fn=30);
                color("silver") translate([7,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=1.25, h=6.5,$fn=30);
                
                color("silver") translate([-3,-1,-3]) cube([3,6.5,7.5]);
                color("silver") translate([7,-1,-3]) cube([3,6.5,7.5]);
                color("silver") translate([0,-1,-3]) cube([9,6.5,3]);
                color("silver") translate([-1,-1,-3]) cube([9,6.5,3]);
                }
            color("black") translate([1.5,.5,1.25]) cube([4,3.5,1]);
        }
    }
    if(type=="single_horizontal_a") {
        size_x = 14;
        size_y = 14;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 7]);
                color("dimgray") translate([.5,-.1,1]) cube([13, 13.5, 5.5]);
            }
            color("white") translate([2,1,4]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.99,0,1]) cube([.65,.5,5]);
            color("silver") translate([1,0,6.99]) cube([11.5,.5,.65]);            
        }
    }
}

// usb 3.0 port class
module usb3(x,y,rotation,side,type,pcbsize_z) {
    // usb3 double stacked type
    if(type=="double_stacked_a") {
        size_x = 13.25;
        size_y = 17.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 15.5]);
                color("dimgray") translate([1,-.1,1]) cube([11.25, 15.5, 13.5]);
            }
            color("silver") translate([0,0,6.75]) cube([13.25, 17.5, 2]);
            color("royalblue") translate([1.5,1,12]) cube([10, 12.5, 1.5]);
            color("royalblue") translate([1.5,1,4]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,1]) cube([.65,.5,5]);
            color("silver") translate([-.65,0,9]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,9]) cube([.65,.5,5]);
            color("silver") translate([1,0,15.5]) cube([11.5,.5,.65]);            

        }
    }
    // usb3 double stacked type
    if(type=="double_stacked_usb3-usb2") {
        size_x = 13.25;
        size_y = 17.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 15.5]);
                color("dimgray") translate([1,-.1,1]) cube([11.25, 15.5, 13.5]);
            }
            color("silver") translate([0,0,6.75]) cube([13.25, 17.5, 2]);
            color("royalblue") translate([1.5,1,12]) cube([10, 12.5, 1.5]);
            color("white") translate([1.5,1,4]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,1]) cube([.65,.5,5]);
            color("silver") translate([-.65,0,9]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,9]) cube([.65,.5,5]);
            color("silver") translate([1,0,15.5]) cube([11.5,.5,.65]);            

        }
    }
    // usb3 single horizontal type
    if(type=="single_horizontal_a") {
        size_x = 14;
        size_y = 14;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 7]);
                color("dimgray") translate([.5,-.1,1]) cube([13, 13.5, 5.5]);
            }
            color("royalblue") translate([2,1,4]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.99,0,1]) cube([.65,.5,5]);
            color("silver") translate([1,0,6.99]) cube([11.5,.5,.65]);            
        }
    }
}

// usbc port class
module usbc(x,y,rotation,side,type,pcbsize_z) {
    $fn=90;
    // usbc horizontal type
    if(type=="single_vertical") {
        size_x = 9;
        size_y = 7;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
         rotate([90,90,0])  translate([-7,3.5/2,-7]) union() {    
            difference () {
                color("silver") translate([0,0,0])
                hull() {
                    translate([0,0,0]) cylinder(d=3.5,h=size_y);
                    translate([size_x-3.5,0,0]) cylinder(d=3.5,h=size_y);        
                    }
                color("silver") translate([0,0,1])
                hull() {
                    translate([0,0,0]) cylinder(d=3,h=size_y+.2);
                    translate([size_x-3.5,0,0]) cylinder(d=3,h=size_y+.2);        
                    }
            }
            color("black") translate([0,-1.2/2,1]) cube([5.5,1.2,6]);
        }
    }
    if(type=="single_horizontal" || type=="single_horizontal_on_licheerv") {
        size_x = 9;
        size_y = 7;                
        off_z = (type=="single_horizontal_on_licheerv") ? 3.3 : 0;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
         rotate([90,0,0])  translate([3.5/2,3.5/2 + off_z,-7]) union() {
            difference () {
                color("silver")
                hull() {
                    translate([0,0,0]) cylinder(d=3.5,h=size_y);
                    translate([size_x-3.5,0,0]) cylinder(d=3.5,h=size_y);        
                    }
                color("silver") translate([0,0,1])
                hull() {
                    translate([0,0,0]) cylinder(d=3,h=size_y+.2);
                    translate([size_x-3.5,0,0]) cylinder(d=3,h=size_y+.2);        
                    }
            }
            color("black") translate([0,-1.2/2,.1]) cube([5.5,1.2,6]);
        }
    }
}

// network class
module network(x,y,rotation,side,type,pcbsize_z) {
    // rj45 single socket
    if(type == "rj45_single") {    
        size_x = 15.9;
        size_y = 21.3;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z) 
        union() {
            difference () {
                color("lightgray") translate([0,0,0]) cube([size_x,size_y,13.5]);
                color("darkgray") translate([1.5,-1,1.5]) cube([13, 19.5, 8]);
                color("darkgray") translate([5.5,-2,7]) cube([5, 19.5, 5]);
            }
            color("green") translate([2,-.1,10]) cube([3, 2, 2]);
            color("orange") translate([11,-.1,10]) cube([3, 2, 2]);
        }
    }
    if(type == "rj45_single_short") {    
        size_x = 14.4;
        size_y = 12.67;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z) 
        union() {
            difference () {
                color("lightgray") translate([0,0,-1.6]) cube([size_x,size_y,13]);
                color("darkgray") translate([.675,-1,.1]) cube([13, 12, 8]);
                color("darkgray") translate([4.6755,-2,5.6]) cube([5, 12, 5]);
            }
            color("green") translate([1,-.1,8.6]) cube([3, 2, 2]);
            color("orange") translate([10.375,-.1,8.6]) cube([3, 2, 2]);
        }
    }
    if(type == "rj45_double_stacked") {
        size_x = 17.5;
        size_y = 28.8;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("lightgray") translate([0,0,0]) cube([size_x,size_y,13.5]);
                color("darkgray") translate([2,-1,4]) cube([13, 19.5, 8]);
                color("darkgray") translate([6,-2,1.5]) cube([5, 19.5, 5]);
            }
            color("green") translate([2.5,-.1,1.5]) cube([3, 2, 2]);
            color("orange") translate([11.5,-.1,1.5]) cube([3, 2, 2]);
            difference () {
                color("lightgray") translate([0,0,13.5]) cube([size_x,size_y,13.5]);
                color("darkgray") translate([2,-1,15]) cube([13, 19.5, 8]);
                color("darkgray") translate([6,-2,20.5]) cube([5, 19.5, 5]);
            }
            color("green") translate([2.5,-.1,23.5]) cube([3, 2, 2]);
            color("orange") translate([11.5,-.1,23.5]) cube([3, 2, 2]);
        }
    }
    if (type=="sfp_single") {
        size_x=14.6;
        size_y=48.75;
        size_z=9.55;
        thickness=0.3;
        place(x, y, size_x, size_y, rotation, side, type, pcbsize_z)
        union() {
            difference () {
                color("lightgray") translate([0,0,0]) cube([size_x, size_y, size_z]);
                color("darkgray")  translate([thickness,-thickness,thickness]) cube([14, 47.5, 8.95]); // Taken from SFF-8432 rev 5.2a
                for (y_offset = [0:8.5:25.5]) {
                    color("darkgray") translate([3.3,          size_y - 3 - y_offset, size_z-thickness]) cylinder(2*thickness, d=1.75);
                    color("darkgray") translate([size_x - 3.3, size_y - 3 - y_offset, size_z-thickness]) cylinder(2*thickness, d=1.75);
                    color("darkgray") translate([size_x/2,     size_y - 7 - y_offset, size_z-thickness]) cylinder(2*thickness, d=1.75);
                }
            }
            color("lightgray") translate([size_x/2 - 2.5, 0, 0]) cube([5, 5, 0.75]);
        }
    }
}

// video class
module video(x,y,rotation,side,type,pcbsize_z) {
    // hdmi a type connector
    if(type=="hdmi_a") {
        size_x = 14.5;
        size_y = 11.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([0,0,.75])
        union() { 
            difference() {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 5.5]);
                color("dimgray") translate([.5,-.1,.5]) cube([13.5, 11, 4.5]);
                color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=13.5,$fn=30);
                color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=13.5,$fn=30);
            }
            difference() {
                union() {
                    color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=11.5,$fn=30);
                    color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=11.5,$fn=30);
                }               
                color("silver") translate([0,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=3, h=13.5,$fn=30);
                color("silver") translate([14.5,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=3, h=13.5,$fn=30);
                color("silver") translate([-3,-1,-3]) cube([3,13.5,7.5]);
                color("silver") translate([14.5,-1,-3]) cube([3,13.5,7.5]);
                color("silver") translate([-1,-1,-3]) cube([16.5,13.5,3]);
                }
            color("black") translate([2.5,.5,2.25]) cube([9.25,10.5,1.5]);
        }
    }
    if(type=="hdmi_a_vertical") {
        size_x = 14.5;
        size_y = 11.5;
        height = .4;      
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([0,0,14.5+height]) rotate([0,90,0])
        union() { 
            difference() {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 5.5]);
                color("dimgray") translate([.5,-.1,.5]) cube([13.5, 11, 4.5]);
                color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=13.5,$fn=30);
                color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=13.5,$fn=30);
            }
            difference() {
                union() {
                    color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=11.5,$fn=30);
                    color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=11.5,$fn=30);
                }               
                color("silver") translate([0,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=3, h=13.5,$fn=30);
                color("silver") translate([14.5,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=3, h=13.5,$fn=30);
                color("silver") translate([-3,-1,-3]) cube([3,13.5,7.5]);
                color("silver") translate([14.5,-1,-3]) cube([3,13.5,7.5]);
                color("silver") translate([-1,-1,-3]) cube([16.5,13.5,3]);
                }
            difference() {
                color("silver") translate([0,6,0]) cube([15,15.75,5.5]);
                color("silver") translate([-6,6,-.25]) rotate([0,0,45]) cube([25,10,6]);
            }
            color("silver") translate([14.5,4,1.75]) cube([height,17.75,3.75]);
            color("black") translate([2.5,.5,2.25]) cube([9.25,10.5,1.5]);
        }
    }
    // display port and hdmi stacked
    if(type=="dp-hdmi_a") {
        size_x = 18;
        size_y = 17.75;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 19]);
                translate([2,-.7,1.5]) color("dimgray") cube([14.5, 11.5, 5.5]);
                translate([1.5,-.7,12.5]) color("dimgray") cube([15, 17.5, 5.5]);
            }         
            translate([2,-.7,1.5]){
                difference() {
                    color("silver") translate([0,0,0]) cube([14.5, 11.5, 5.5]);
                    color("dimgray") translate([.5,-.1,.5]) cube([13.5, 11, 4.5]);
                    color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                        cylinder(d=4, h=13.5,$fn=30);
                    color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                        cylinder(d=4, h=13.5,$fn=30);
                }
                difference() {
                    union() {
                        color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                        cylinder(d=4, h=11.5,$fn=30);
                        color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                        cylinder(d=4, h=11.5,$fn=30);
                    }               
                    color("silver") translate([0,-.2,0]) rotate ([-90,0,0]) 
                        cylinder(d=3, h=13.5,$fn=30);
                    color("silver") translate([14.5,-.2,0]) rotate ([-90,0,0]) 
                        cylinder(d=3, h=13.5,$fn=30);
                    color("silver") translate([-3,-1,-3]) cube([3,13.5,7.5]);
                    color("silver") translate([14.5,-1,-3]) cube([3,13.5,7.5]);
                    color("silver") translate([-1,-1,-3]) cube([16.5,13.5,3]);
                    }
                color("black") translate([2.5,.5,2.25]) cube([9.25,10.5,1.5]);
            }
            color("black") translate([2.5,.5,14.5]) cube([13,10.5,1.5]);
            color("silver") translate([0,0,12.5]) rotate([0,45,0]) cube([2,17.5,2]);
            color("silver") translate([-.5,0,13]) cube([.6,.5,4.5]);
            color("silver") translate([17.9,0,13]) cube([.6,.5,4.5]);
            color("silver") translate([2,0,18.9]) cube([14,.5,.5]);
        }
    }
    // hdmi micro connector
    if(type=="hdmi_micro") {
        size_x = 6.5;
        size_y = 7.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)        
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 2.9]);
                color("dimgray") translate([.25,-.25,.25]) cube([size_x-.5, size_y-.5, 2.4]);
                color("silver") translate([-.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=7.7,$fn=30);
                color("silver") translate([7,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=7.7,$fn=30);

            }
            difference() {
                union() {
                    color("silver") translate([-.5,0,0]) rotate ([-90,0,0]) 
                        cylinder(d=2.5, h=8.5,$fn=30);
                    color("silver") translate([7,0,0]) rotate ([-90,0,0]) 
                        cylinder(d=2.5, h=8.5,$fn=30);
                }               
                color("silver") translate([-.25,-.2,.15]) rotate ([-90,0,0]) 
                    cylinder(d=1.5, h=8.5,$fn=30);
                color("silver") translate([6.75,-.2,.15]) rotate ([-90,0,0]) 
                    cylinder(d=1.5, h=8.5,$fn=30);
                
                color("silver") translate([-3,-1,-3]) cube([3,10.5,7.5]);
                color("silver") translate([6.5,-1,-3]) cube([3,10.5,7.5]);
                color("silver") translate([-1,-1,-3]) cube([9,10.5,3]);
                color("silver") translate([-1,7.5,-3]) cube([9,6.5,9]);
                }
            color("black") translate([1.375,.5,1]) cube([4,3.5,1.2]);
        }
    }
    // hdmi mini connector
    if(type=="hdmi_mini") {
        size_x = 11.2;
        size_y = 8;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)        
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 3.2]);
                color("dimgray") translate([.25,-.25,.25]) cube([size_x-.5, size_y-.5, 2.7]);
                color("silver") translate([-.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=8.7,$fn=30);
                color("silver") translate([11.75,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=8.7,$fn=30);

            }
            difference() {
                union() {
                    color("silver") translate([-.5,0,0]) rotate ([-90,0,0]) 
                        cylinder(d=2.5, h=8.5,$fn=30);
                    color("silver") translate([11.75,0,0]) rotate ([-90,0,0]) 
                        cylinder(d=2.5, h=8.5,$fn=30);
                }               
                color("silver") translate([-.25,-.2,.25]) rotate ([-90,0,0]) 
                    cylinder(d=1.25, h=8.5,$fn=30);
                color("silver") translate([11.4,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=1.25, h=9,$fn=30);
                
                color("silver") translate([-3,-1,-3]) cube([3,10.5,7.5]);
                color("silver") translate([11.2,-1,-3]) cube([3,10.5,7.5]);
                color("silver") translate([-1,-1,-3]) cube([13,10.5,3]);
                color("silver") translate([-1,8,-3]) cube([14,6.5,9]);
                }
            color("black") translate([1.5,.5,1]) cube([8,3.5,1.2]);
        }
    }
    // display port mini connector
    if(type=="dp_mini") {
        size_x = 8.5;
        size_y = 13.65;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)        
        union() {    
            difference () {
                difference() {
                    color("silver") translate([0,0,0]) cube([size_x, size_y, 5.6]);
                    color("silver") translate([-7.5,-1,1]) rotate([0,45,0]) cube([size_x, size_y+2, 5.6]);
                    color("silver") translate([10,-1,-5]) rotate([0,-45,0]) cube([size_x, size_y+2, 5.6]);                    
                }
                difference() {
                    color("dimgray") translate([.5,-.25,.5]) cube([size_x-1, size_y-.5, 4.6]);
                    color("silver") translate([-6.75,-1,1]) rotate([0,45,0]) cube([size_x, size_y, 5.6]);
                    color("silver") translate([9.4,-1,-5]) rotate([0,-45,0]) cube([size_x, size_y, 5.6]);
                }
            }
            color("black") translate([1.5,.5,2.25]) cube([5.5,size_y-.5,1.2]);
        }
    }
    // mipi csi port
    if(type=="mipi_csi") {
        size_x = 21;
        size_y = 3;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                color("white") cube([size_x, size_y, 5]);
                color("white") translate([-1,-1,3.5]) cube([23,3.5,5]);
                color("white") translate([-1,-1,3.5]) cube([3,5,5]);
                color("white") translate([19,-1,3.5]) cube([3,5,5]);
            }
            difference() {
                color("black") translate([-1,0,3.5]) cube([23,3.5,1]);
                color("dimgrey") translate([2,2.9,3.49]) cube([17,3,2]);
            }
        }
    }
    // mipi dsi port
    if(type=="mipi_dsi") {
        size_x = 10;
        size_y = 3;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") cube([size_x, 1.5, 2]);
            color("saddlebrown") translate([0,1.5,0]) cube([size_x, 1.5, 2]);
        }
    }

}

// fan connector class
module fan(x,y,rotation,side,type,pcbsize_z) {
    // micro connector type
    if(type=="micro") {
        size_x = 7.5;
        size_y = 3.75;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                color("white") translate([0,0,0]) cube([size_x,size_y,4.75]);
                color("darkgray") translate([1.5,.5,1]) cube([4.5,2.75,6]);
                color("white") translate([-.5,.75,-.5]) cube([1,2.5,6]);
                color("white") translate([7,.75,-.5]) cube([1,2.5,6]);
                color("darkgray") translate([2.25,-.5,1]) cube([3,2,6]);
            }
            color("silver") translate ([2.75,2,.5]) cube([.6,.6,4]);
            color("silver") translate ([4.5,2,.5]) cube([.6,.6,4]);
        }
    }
    // pmw-standard connector type
    if(type=="encl_pmw") {
        size_x = 11.6;
        size_y = 4.3;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                color("white") translate([0,0,0]) cube([size_x,size_y,7]);
                color("darkgray") translate([.5,.5,1]) cube([10.5,3,8]);
                //color("white") translate([-.5,.75,-.5]) cube([1,2.5,6]);
                //color("white") translate([11,.75,-.5]) cube([1,2.5,6]);
                color("darkgray") translate([2.25,-.5,1]) cube([7.5,2,8]);
            }
            for (i=[2:2.54:11.7]) {
                color("silver") translate ([i,2.54,2]) cylinder(d=.67,h=5, $fn=30);
            }
        }
    }
    // pmw-standard connector type horizontal and 45 degrees
    if(type=="encl_pmw_h") {
        size_x = 11.6;
        size_y = 4.3;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([11.6,0,5]) rotate([-90,0,-45])
        union() {  
            difference () {
                color("white") translate([0,0,0]) cube([size_x,size_y,4]);
                color("darkgray") translate([.5,.5,1]) cube([10.5,3,8]);
                //color("white") translate([-.5,.75,-.5]) cube([1,2.5,6]);
                //color("white") translate([11,.75,-.5]) cube([1,2.5,6]);
                color("darkgray") translate([2.25,-.5,1]) cube([7.5,2,8]);
            }
            for (i=[2:2.54:11.7]) {
                color("silver") translate ([i,2.54,2]) cylinder(d=.67,h=2, $fn=30);
            }
        }
    }
}

// gpio class
module gpio(x,y,rotation,side,type,pcbsize_z) {
    // gpio 30 pin enclosed header
    if(type=="encl_header_30") {
        size_x = 37;
        size_y = 5.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("black") translate([0,0,0]) cube([size_x, size_y, 6.25]);
                color ("darkgray") translate ([.5,.5,.6]) cube([36, 4.5, 5.75]);
            }
            for (i=[4.5:2:34]) {
                color("silver") translate ([i,1.5,1]) cube([.5,.5,5]);
                color("silver") translate ([i,3.5,1]) cube([.5,.5,5]);
            }
        }
    }
    // gpio 12 enclosed header
    if (type=="encl_header_12") {
        size_x = 19.5;
        size_y = 5.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {                
            difference () {
                color("black") translate([0,0,0]) cube([size_x,size_y,6.25]);
                color ("darkgray") translate ([.5,.5,.6]) cube([18.5,4.5,5.75]);
            }
            for (i=[4.5:2:16]) {
                color("silver") translate ([i,1.5,1]) cube([.5,.5,5]);
                color("silver") translate ([i,3.5,1]) cube([.5,.5,5]);
            }
        }
    }
    // gpio 40 pin header
    if(type=="header_40") {
        size_x = 50;
        size_y = 5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:50]) {
                color("silver") translate ([i,.5,3]) cube([.64,.64,5]);
                color("silver") translate ([i,3.5,3]) cube([.64,.64,5]);
            }
        }
    }   
    // gpio 20 pin header
    if(type=="header_20") {
        size_x = 25.52;
        size_y = 5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:25]) {
                color("silver") translate ([i,.5,3]) cube([.64,.64,5]);
                color("silver") translate ([i,3.5,3]) cube([.64,.64,5]);
            }
        }
    }   
    // gpio 24 pin header
    if(type=="header_24") {
        size_x = 30.25;
        size_y = 5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:29]) {
                color("silver") translate ([i,.5,3]) cube([.64,.64,5]);
                color("silver") translate ([i,3.5,3]) cube([.64,.64,5]);
            }
        }
    }   
    // gpio 26 pin header
    if(type=="header_26") {
        size_x = 31.52;
        size_y = 5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:31]) {
                color("silver") translate ([i,.5,3]) cube([.64,.64,5]);
                color("silver") translate ([i,3.5,3]) cube([.64,.64,5]);
            }
        }
    }   
}

// ic class
module ic(x,y,rotation,side,type,pcbsize_z) {
    // ic 2.8mm x 2.8mm
    if (type=="ic_2.8x2.8") {
        size_x = 2.8;
        size_y = 2.8;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 3mm x 3mm
    if (type=="ic_3x3") {
        size_x = 3;
        size_y = 3;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 3.7mm x 3.7mm
    if (type=="ic_3.7x3.7") {
        size_x = 3.7;
        size_y = 3.7;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 4mm x 4mm
    if (type=="ic_4x4") {
        size_x = 4;
        size_y = 4;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 4.3mm x 5.1mm
    if (type=="ic_4.3x5.1") {
        size_x = 4.3;
        size_y = 5.1;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 4.5mm x 4.5mm
    if (type=="ic_4.5x4.5") {
        size_x = 4.5;
        size_y = 4.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 4.7mm x 4.7mm
    if (type=="ic_4.7x4.7") {
        size_x = 4.7;
        size_y = 4.7;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 5mm x 5mm
    if (type=="ic_5x5") {
        size_x = 5;
        size_y = 5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 5.4mm x 5.3mm
    if (type=="ic_5.4x5.3") {
        size_x = 5.4;
        size_y = 5.3;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 5.5mm x 5.5mm
    if (type=="ic_5.5x5.5") {
        size_x = 5.5;
        size_y = 5.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 5.75mm x 5.75mm
    if (type=="ic_5.75x5.75") {
        size_x = 5.75;
        size_y = 5.75;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x, size_y, .7]);
    }
    // ic 6mm x 6mm
    if (type=="ic_6x6") {
        size_x = 6;
        size_y = 6;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 6.4mm x 6.4mm
    if (type=="ic_6.4x6.4") {
        size_x = 6.4;
        size_y = 6.4;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 6.7mm x 8.4mm
    if (type=="ic_6.7x8.4") {
        size_x = 6.7;
        size_y = 8.4;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 6.75mm x 6.75mm
    if (type=="ic_6.75x6.75") {
        size_x = 6.75;
        size_y = 6.75;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 7mm x 7mm
    if (type=="ic_7x7") {
        size_x = 7;
        size_y = 7;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 8mm x 8mm
    if (type=="ic_8x8") {
        size_x = 8;
        size_y = 8;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 9mm x 9mm
    if (type=="ic_9x9") {
        size_x = 9;
        size_y = 9;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 10mm x 13mm
    if (type=="ic_10x13") {
        size_x = 10;
        size_y = 13;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 11mm x 8mm
    if (type=="ic_11x8") {
        size_x = 11;
        size_y = 8;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 11mm x 13mm
    if (type=="ic_11x13") {
        size_x = 11;
        size_y = 13;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 11.5mm x 11.5mm
    if (type=="ic_11.5x11.5") {
        size_x = 11.5;
        size_y = 11.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 11.7mm x 16mm
    if (type=="ic_11.7x15") {
        size_x = 11.7;
        size_y = 15;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 12mm x 12mm
    if (type=="ic_12x12") {
        size_x = 12;
        size_y = 12;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 12.5mm x 12.5mm
    if (type=="ic_12.5x12.5") {
        size_x = 12.5;
        size_y = 12.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 13mm x 8mm
    if (type=="ic_13x8") {
        size_x = 13;
        size_y = 8;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 13mm x 7.5mm
    if (type=="ic_13x7.5") {
        size_x = 13;
        size_y = 7.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 13mm x 9mm
    if (type=="ic_13x9") {
        size_x = 13;
        size_y = 9;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 13mm x 11.5mm
    if (type=="ic_13x11.5") {
        size_x = 13;
        size_y = 11.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 15mm x 7mm
    if (type=="ic_15x7") {
        size_x = 15;
        size_y = 7;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 15mm x 13mm
    if (type=="ic_15x13") {
        size_x = 15;
        size_y = 13;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 15mm x 15mm
    if (type=="ic_15x15") {
        size_x = 15;
        size_y = 15;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 16mm x 10mm
    if (type=="ic_16x10") {
        size_x = 16;
        size_y = 10;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
}

// audio class
module audio(x,y,rotation,side,type,pcbsize_z) {
    // out in and spdif stacked type
    if(type=="out-in-spdif") {
        size_x = 12.7;
        size_y = 21.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                union() {
                    color("silver") translate([0,0,0]) cube([size_x,size_y,35]);
                    color("black") translate([6.35,-3.2,17]) rotate([-90,0,0]) 
                    cylinder(d=8, h=6.25);
                    color("black") translate([6.35,-3.2,29]) rotate([-90,0,0]) 
                    cylinder(d=8, h=6.25);
                    color("dimgray") translate([1.85,-2.0,2]) cube([9,2,9]);
                    }
                color("dimgray") translate([6.35,-3.25,17]) rotate([-90,0,0]) 
                        cylinder(d=3.75, h=9);
                color("dimgray") translate([6.35,-3.25,29]) rotate([-90,0,0]) 
                        cylinder(d=3.75, h=9);
                difference() {
                    color("dimgray") translate([2.85,-2.1,3]) cube([7,9,7]);
                    color("dimgray") translate([1.85,-2,3]) rotate([0,45,0]) cube([1.5,9,1.5]);
                    color("dimgray") translate([8.75,-2,3]) rotate([0,45,0]) cube([1.5,9,1.5]);
                }
           }
        }
    }
    // 3.5mm jack type
    if(type=="jack_3.5") {
        size_x = 6.5;
        size_y = 12;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                union() {
                    color("black") translate([0,2,0]) cube([size_x,10,4]);
                    color("silver") translate([0,0,0]) cube([size_x,2,4]);
                    color("black") translate([3.125,-2,2]) rotate([-90,0,0]) cylinder(d=4, h=6.25);
                    }
                color("dimgray") translate([3.125,-2.5,2]) rotate([-90,0,0]) cylinder(d=3, h=6);
            }
        }
    }
}

// storage class
module storage(x,y,rotation,side,type,pcbsize_z) {

    // raised micro sdcard
    if(type=="sdcard" || type=="sdcard_i") {
        size_x = 11.5;
        size_y = 5.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 3.5]);
                color("black") translate([.5,-.5,2]) cube([10.5, 5.5, 1]);
            }
        }
    }

    // micro sd card style 1
    if (type == "microsdcard") {
        size_x = 13.2;
        size_y = 14.1;
        place(x, y, size_x, size_y, rotation, side, type, pcbsize_z)
        union() {
            for(loc_x = [.8:1.2:12]) {
                color("gold") translate([loc_x, 0, 0]) cube([0.7, 13.5, 0.4]);
            }
            difference() {
                color("silver") translate([0, 0, 0]) cube([size_x, size_y, 1.4]);
                color("silver") translate([1, -.01, -1]) cube([9.6, 3.8, 5]);
                color("silver") translate([0.2, -.1, 0.2]) cube([12.8, 13.7, 1]);
            }
        }

    }
    
    // micro sdcard style 2
    if(type == "microsdcard2") {
        size_x = 11.5;
        size_y = 5.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 2.5]);
                color("black") translate([.5,-.5,.75]) cube([10.5, 5.5, 1]);
            }
        }
    }

    // sata single header type
    if(type=="sata_header") {
        size_x = 16;
        size_y = 4;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                union() {
                    color("dimgray") translate([0,0,0]) cube([size_x,size_y,3]);
                    color("dimgray") translate([14,0,3]) cube([2,4,5]);
                    color("dimgray") translate([2,1,3]) cube([10,2,5]);
                }
                color("dimgray") translate([3,0,3]) cube([10,2,6]);
                color("dimgray") translate([13,1,3]) cube([2,2,6]);
                color("dimgray") translate([2,-1,-1]) cube([10,6,2.5]);
            }
            for (i=[1:1.27:8]) {
                color("gold") translate ([i+2.75,1.75,2.5]) cube([.84,.25,5]);
            }           
        }
    }
    // sata and power enclosed verticle recepticle
    if(type=="sata_power_vrec") {   
        size_x = 40.43;
        size_y = 3.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([38.3,0,0]) rotate([90,0,180])
        union() {
            difference() {
                union() {                
                    difference () {
                        color("black") translate([2.12,0,0]) cube([36.19,8.5,3.5]);
                        //color("black") translate([4.12,-1,-2]) cube([32.19,4,7]);
                    }
                    // side bottom
                    color("black") translate([0,0,-.75]) cube([2.12,1.5,5]);
                    color("black") translate([38.31,0,-.75]) cube([2.12,1.5,5]);
                    // side towers
                    color("black") translate([0,1.499,.75]) cube([2.12,8.5,2]);
                    color("black") translate([38.31,1.499,.75]) cube([2.12,8.5,2]);
                }
                // tower point trim
                color("black") translate([-1,8.17,.69]) rotate ([0,0,45])
                cube([4.12,4,6]);
                color("black") translate([41.43,8.17,.69]) rotate ([0,0,45])
                cube([2.12,4,6]);
                color("black") translate([0,8.17,4]) rotate ([-45,0,0])
                cube([3.12,4,2]);
                color("black") translate([37.31,8.17,4]) rotate ([-45,0,0])
                cube([3.12,4,2]);
                
                color("black") translate([0,8.17,-3.25]) rotate ([45,0,0])
                cube([2.12,6,2]);
                color("black") translate([38.31,8.17,-3.25]) rotate ([45,0,0])
                cube([3.12,6,2]);
                // connector cut outs
                color("dimgray") translate([3.5,5.67,2]) cube([21.5,6,1.15]);
                color("dimgray") translate([23.56,5.67,.4]) cube([1.45,6,2.15]);
                color("dimgray") translate([27.01,5.67,2]) cube([10,6,1.15]);
                color("dimgray") translate([27.01,5.67,.4]) cube([1.45,6,2.15]);
                
            }
            // pins
            for (i=[1:1.27:8]) {
                color("gold") translate ([i+28.25,3.5,2.25]) rotate([-90,0,0]) cube([.84,.25,5]);
            }           
            for (i=[1:1.27:20]) {
                color("gold") translate ([i+3.25,3.5,2.25]) rotate([-90,0,0]) cube([.84,.25,5]);
            }           
        }
    }    
    // sata and power enclosed right angle
    if(type=="sata_encl_power") {   
        size_x = 40.43;
        size_y = 12.87;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                union() {                
                    difference () {
                        color("black") translate([2.12,0,0]) cube([36.19,11.17,4.3]);
                        color("black") translate([4.12,-1,-2]) cube([32.19,4,7]);
                    }
                    color("black") translate([0,0,0]) cube([2.12,5.67,4]);
                    color("black") translate([38.31,0,0]) cube([2.12,5.67,4]);
                    color("black") translate([0,8,1]) cube([2.12,5.5,2.55]);
                    color("black") translate([38.31,8,1]) cube([2.12,5.5,2.55]);
                }
                color("black") translate([1.12,5.67,-.5]) cube([38.19,5.7,1]);
                color("black") translate([-1,11.17,.69]) rotate ([0,0,45])
                cube([4.12,4,6]);
                color("black") translate([41.43,11.17,.69]) rotate ([0,0,45])
                cube([2.12,4,6]);
                color("black") translate([0,11.17,4]) rotate ([-45,0,0])
                cube([3.12,4,2]);
                color("black") translate([37.31,11.17,4]) rotate ([-45,0,0])
                cube([3.12,4,2]);
                color("dimgray") translate([3.32,5.67,2.5]) cube([21.58,6,1.15]);
                color("dimgray") translate([23.56,5.67,1.15]) cube([1.45,6,2.15]);
                color("dimgray") translate([27.01,5.67,2.5]) cube([10,6,1.15]);
                color("dimgray") translate([27.01,5.67,1.15]) cube([1.45,6,2.15]);
                
            }
        }
    }
    // sata enclosed header style
    if(type=="sata_encl_header") {
        size_x = 16.9;
        size_y = 6.45;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                union() {
                    color("dimgray") translate([0,0,0]) cube([size_x,size_y,3]);
                    color("dimgray") translate([14,1.25,3]) cube([2,4,5]);
                    color("dimgray") translate([2,2.25,3]) cube([10,2,5]);
                }
                color("dimgray") translate([3,1.25,3]) cube([10,2,6]);
                color("dimgray") translate([13,2.25,3]) cube([2,2,6]);
                color("dimgray") translate([2,-1,-1]) cube([12,8,2.5]);
            }
            for (i=[1:1.27:8]) {
                color("gold") translate ([i+2.75,3,2.5]) cube([.84,.25,5]);
            }
            color("dimgray") translate([0,0,3]) cube([16.9,1,5]);
            color("dimgray") translate([0,0,3]) cube([1,6.45,5]);
            color("dimgray") translate([15.9,0,3]) cube([1,6.45,5]);
            color("dimgray") translate([0,5.45,3]) cube([16.9,1,5]);
        }
    }
    
    // m.2 header style
    if(type=="m.2_header") {
        size_x = 22;
        size_y = 6.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                color("dimgray") translate([0,0,0]) cube([size_x,size_y,5.2]);
                color("dimgray") translate([.88,-1,2.48]) cube([20.15,3.5,2]);
                color("dimgray") translate([17.65,-1,2.48]) cube([3.35,5.25,.92]);
                color("dimgray") translate([.88,-1,2.48]) cube([15.65,5.25,.92]);
            }
            for (i=[.88:.5:3]) {
                color("gold") translate ([i+17.2,2,2.48]) cube([.25,2,.25]);
            }
            for (i=[.88:.5:15]) {
                color("gold") translate ([i+.88,2,2.48]) cube([.25,2,.25]);
            }
        }
        
    }
    // m.2 mounting stud
    if(type=="m.2_stud") {
        size_x = 5;
        size_y = 5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)

        difference () {
            color("silver") cylinder(d=5, h=2);
            color("silver") translate([0,0,-1]) cylinder(d=2, h=5);
        }
    }
  
}

// combo class
module combo(x,y,rotation,side,type,pcbsize_z) {
    // rj-45 and usb2 stacked type
    if(type=="rj45-usb2_double") {
        size_x = 19;
        size_y = 27.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("lightgray") translate([0,0,0]) cube([size_x, size_y, 31]);
                color("darkgray") translate([3,-1,19]) cube([13, 19.5, 8]);
                color("darkgray") translate([7,-2,24.5]) cube([5, 19.5, 5]);
                color("dimgray") translate([3,-.1,1.5]) cube([13, 7.5, 7]);
                color("dimgray") translate([3,-.1,10.5]) cube([13, 7.5, 7]);                
            }
            color("green") translate([3,-.1,27.5]) cube([3, 2, 2]);
            color("orange") translate([13,-.1,27.5]) cube([3, 2, 2]);
            color("white") translate([4,1,5]) cube([11, 12.5, 1.5]);
            color("white") translate([4,1,14]) cube([11, 12.5, 1.5]);
        }
    }
    // rj-45 and usb3 stacked 
    if(type=="rj45-usb3_double") {
        size_x = 19;
        size_y = 27.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("lightgray") translate([0,0,0]) cube([size_x, size_y, 31]);
                color("darkgray") translate([3,-1,19]) cube([13, 19.5, 8]);
                color("darkgray") translate([7,-2,24.5]) cube([5, 19.5, 5]);
                color("dimgray") translate([3,-.1,1.5]) cube([13, 7.5, 7]);
                color("dimgray") translate([3,-.1,10.5]) cube([13, 7.5, 7]);                
            }
            color("green") translate([3,-.1,27.5]) cube([3, 2, 2]);
            color("orange") translate([13,-.1,27.5]) cube([3, 2, 2]);
            color("royalblue") translate([4,1,5]) cube([11, 12.5, 1.5]);
            color("royalblue") translate([4,1,14]) cube([11, 12.5, 1.5]);
        }
    }
    // usb3 and usbc double stacked type
    if(type=="double_stacked_usb3-usbc") {
        $fn = 90;
        size_x = 13.25;
        size_y = 17.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 15.5]);
                color("dimgray") translate([1,-.1,8.75]) cube([11.25, 15.5, 6.5]);
                color("silver") translate([0,0,1])
                rotate([90,0,0])  translate([4,1,-7]) hull() {
                    translate([0,0,0]) cylinder(d=3,h=7+.2);
                    translate([9-3.5,0,0]) cylinder(d=3,h=7+.2);        
                    }
            }
            color("silver") translate([0,0,6.75]) cube([13.25, 17.5, 2]);
            color("royalblue") translate([1.5,1,12]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,1]) cube([.65,.5,5]);
            color("silver") translate([-.65,0,9]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,9]) cube([.65,.5,5]);
            color("silver") translate([1,0,15.5]) cube([11.5,.5,.65]);            
            color("black") rotate([90,0,0])  translate([4,1.25,-7]) cube([5.5,1.2,6]);
        }
    }
}

// jumper class
module jumper(x,y,rotation,side,type,pcbsize_z) {
    // 2x1 type
    if(type=="header_2x1") {
        size_x = 5;
        size_y = 2.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            color("silver") translate ([1,1,2.5]) cube([.64,.64,5]);
            color("silver") translate ([3.5,1,2.5]) cube([.64,.64,5]);
        }
    }
    // 3x1 type
    if(type=="header_3x1") {
        size_x = 7.5;
        size_y = 2.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            color("silver") translate ([1,1,2.5]) cube([.64,.64,5]);
            color("silver") translate ([3.5,1,2.5]) cube([.64,.64,5]);
            color("silver") translate ([6,1,2.5]) cube([.64,.64,5]);
        }
    }
    // 3x2 type
    if(type=="header_3x2") {
        size_x = 7.5;
        size_y = 5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:8]) {
                color("silver") translate ([i,.5,3]) cube([.64,.64,5]);
                color("silver") translate ([i,3.5,3]) cube([.64,.64,5]);
            }
        }
    }   
    // 5x1 type
    if(type=="header_5x1") {
        size_x = 12.5;
        size_y = 2.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:12]) {
                color("silver") translate ([i,1,3]) cube([.64,.64,5]);
            }
        }
    }       
    // 6x1 type
    if(type=="header_6x1") {
        size_x = 15;
        size_y = 2.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:14]) {
                color("silver") translate ([i,1,3]) cube([.64,.64,5]);
            }
        }
    }       
    // 7x1 type
    if(type=="header_7x1") {
        size_x = 17.5;
        size_y = 2.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:16]) {
                color("silver") translate ([i,1,3]) cube([.64,.64,5]);
            }
        }
    }   
    // 13x1 type
    if(type=="header_13x1") {
        size_x = 32.5;
        size_y = 2.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:32]) {
                color("silver") translate ([i,1,3]) cube([.64,.64,5]);
            }
        }
    }   
}

// misc class
module misc(x,y,rotation,side,type,pcbsize_z) {
    // type ir
    if(type=="ir_1") {
        size_x = 7;
        size_y = 3;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            color("silver") translate([0,0,4]) cube([size_x,size_y,8]);
            color("dimgray") translate([3.5,.5,7.5]) sphere(d=5);
            color("silver") translate ([1,1.25,0]) cube([.64,.5,4]);
            color("silver") translate ([3.25,1.25,0]) cube([.64,.5,4]);
            color("silver") translate ([5.5,1.25,0]) cube([.64,.5,4]);
        }
    }
    // type led surface mount
    if(type=="led_3x1.5") {
        size_x = 3;
        size_y = 1.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("gold") translate([0,0,0]) cube([size_x,size_y,.5]);
    }
    // type lcd_2.2
    if(type=="lcd_2.2") {
        size_x = 56;
        size_y = 38;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                union() {
                    color("white") translate([0,0,0]) cube([size_x,size_y,1.5]);
                    color("dimgrey") translate([1,1,1.5]) cube([size_x-2,size_y-2,1.85]);
                    }
                color("black") translate([54.5,4,-.01]) cube([2,30,4]);
            }
            color("dimgrey") translate([4.25,.9,3.35]) cube([45,34,.25]);
        }
    }
    // type battery holder 1
    if(type=="bat_hold_1") {
        size_x = 22;
        size_y = 16;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                union() {  
                    color("LightYellow") translate([0,0,0]) cube([size_x,size_y,6]);
                    color("LightYellow") translate([-3.2499,4.5,0]) cube([3.25,7,6]);
                    color("LightYellow") translate([21.999,4.5,0]) cube([3.25,7,6]);                
                }
                color("LightYellow") translate([11,8,2]) cylinder(d=20, h=5, $fn=360);
                color("LightYellow") translate([-3.259,5,5]) cube([28.6,5.5,3]);
                color("LightYellow") translate([-3.25,5.5,5]) cube([28.5,5.5,3]);
                    
                color("LightYellow") translate([-4.251,5,-1]) cube([2,6,8]);
                color("LightYellow") translate([.5,5,2]) cube([1,6,8]);

                color("LightYellow") translate([24.25,5,-1]) cube([2,6,8]);
                color("LightYellow") translate([20,5,2]) cube([1,6,8]);
                    
                color("LightYellow") translate([22,15,-1]) rotate([0,0,45]) cube([2,2,8]);
                    
                /* bottom cut outs */
                color("LightYellow") translate([7,2.5,-1]) cylinder(d=2.5, h=4, $fn=360);
                color("LightYellow") translate([3.75,1.25,-1]) cube([3.5,2.5,3.75]);            
                color("LightYellow") translate([15,2.5,-1]) cylinder(d=2.5, h=4, $fn=360);
                color("LightYellow") translate([15,1.25,-1]) cube([3.3,2.5,3.75]);            
                color("LightYellow") translate([7,13.5,-1]) cylinder(d=2.5, h=4, $fn=360);
                color("LightYellow") translate([3.75,12.25,-1]) cube([3.5,2.5,3.75]);            
                color("LightYellow") translate([15,13.5,-1]) cylinder(d=2.5, h=4, $fn=360);
                color("LightYellow") translate([15,12.25,-1]) cube([3.3,2.5,3.75]);            
            }
            color("Gold") translate([-2.25199,5,0]) cube([1,6,6]);
            color("Gold") translate([0,5,0]) cube([1,6,6]);
            color("Gold") translate([-2.25199,5,5]) cube([3,6,1]);
            
            color("Gold") translate([20.99,5,2]) cube([1,6,4]);
            color("Gold") translate([23.251,5,0]) cube([1,6,6]);
            color("Gold") translate([21,5,5]) cube([3,6,1]);
            
            /* right contacts */        
            color("Gold") translate([15,6,2.5]) rotate([0,5,0]) cube([6,1,.5]);
            color("Gold") translate([15,9,2.5]) rotate([0,5,0]) cube([6,1,.5]);
            color("Gold") translate([20.5,5,2]) cube([1,6,.5]);

            /* left contacts */
            color("Gold") translate([1.5,6,2.5]) rotate([0,5,0]) cube([.5,1,3]);
            color("Gold") translate([2,6,5]) rotate([0,5,0]) cube([.5,1,.5]);
            color("Gold") translate([1.5,9,2.5]) rotate([0,5,0]) cube([.5,1,3]);
            color("Gold") translate([2,9,5]) rotate([0,5,0]) cube([.5,1,.5]);
            color("Gold") translate([1,5,2]) cube([1,6,.5]);
        }
    }
}

// heatsink class
module heatsink(x,y,rotation,side,type,pcbsize_z,soc1size_z, soc2size_z) {
    // type c series
    if(type=="hc4_oem" || type=="c4_oem" || type=="c2_oem" || type=="c1+_oem") {
        size_x = 58;
        size_y = 32;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([5.5,-23.5,soc1size_z])
        difference() {
            union() {        
                color("gray",.6) cube([40,32,10]);
                if(type=="hc4_oem") {
                    color("gray",.6) translate([39.99,5,0]) cube([5.5,7,2]);
                    color("gray",.6) translate([45.75,8.5,0]) cylinder(d=7, h=2);
                    color("gray",.6) translate([-5.49,25,0]) cube([5.5,7,2]);
                    color("gray",.6) translate([-5.5,28.5,0]) cylinder(d=7, h=2);
                    }
                    else {
                        color("gray",.6) translate([39.99,0,0]) cube([5.5,7,2]);
                        color("gray",.6) translate([45.75,3.5,0]) cylinder(d=7, h=2);
                        color("gray",.6) translate([-5.49,20,0]) cube([5.5,7,2]);
                        color("gray",.6) translate([-5.5,23.5,0]) cylinder(d=7, h=2);
                    }
                }
            // center channel and fins
            color("gray",1) translate([17.5,-1,2]) cube([5,34,9]);
            color("gray",1) translate([1.5,-1,2]) cube([1.25,34,9]);
            for (i=[3.5:2.25:38]) {
                color("gray",1) translate([i,-1,2]) cube([1.5,34,9]);
            }
            // fin elevations
            color("gray",.6) translate([4,-1,9]) cube([8,34,2]);
            color("gray",.6) translate([28,-1,9]) cube([8,34,2]);
            color("gray",.6) translate([11,-1,8]) cube([2,34,3]);
            color("gray",.6) translate([27,-1,8]) cube([2,34,3]);
            color("gray",.6) translate([13,-1,7]) cube([2,34,4]);
            color("gray",.6) translate([25,-1,7]) cube([2,34,4]);
            color("gray",.6) translate([16,-1,6]) cube([2,34,5]);
            color("gray",.6) translate([22,-1,6]) cube([2,34,5]);
            // holes
            if(type=="hc4_oem") {
                color("gray",.6) translate([45.75,8.5,-1]) cylinder(d=3, h=4);
                color("gray",.6) translate([-5.5,28.5,-1]) cylinder(d=3, h=4);
                }
                else {
                    color("gray",.6) translate([45.75,3.5,-1]) cylinder(d=3, h=4);
                    color("gray",.6) translate([-5.5,23.5,-1]) cylinder(d=3, h=4);
                }
        }
    }
    if(type=="xu4_oem" || type=="n2l_oem") {
        $fn=60;
        size_x = 58;
        size_y = 40;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([5.5,-30,soc1size_z])
        difference() {
            union() {
                color("DeepSkyBlue",.6) cube([40, 40, 9.8]);
                color("DeepSkyBlue",.6) translate([39.99,6.5,0]) cube([5.5,7,2]);
                color("DeepSkyBlue",.6) translate([45.5,10,0]) cylinder(d=7, h=2);
                color("DeepSkyBlue",.6) translate([-5.49,26.5,0]) cube([5.5,7,2]);
                color("DeepSkyBlue",.6) translate([-5.5,30,0]) cylinder(d=7, h=2);
            }
            // fins
            for (i=[1.5:2.25:38.5]) {
                    color("DeepSkyBlue",.6) translate([i,-1,2]) cube ([1.25,42,12]);
            }
            // cross opening
            color("DeepSkyBlue",.6) translate([17.5,-1,2]) cube([5,42,10]);
            color("DeepSkyBlue",.6) translate([-1,17.5,2]) cube([42,5,10]);
            // fin elevations
            color("DeepSkyBlue",.6) translate([4,-1,9]) cube([8,42,2]);
            color("DeepSkyBlue",.6) translate([28,-1,9]) cube([8,42,2]);
            color("DeepSkyBlue",.6) translate([11,-1,8]) cube([2,42,3]);
            color("DeepSkyBlue",.6) translate([27,-1,8]) cube([2,42,3]);
            color("DeepSkyBlue",.6) translate([13,-1,7]) cube([2.5,42,4]);
            color("DeepSkyBlue",.6) translate([25,-1,7]) cube([2,42,4]);
            color("DeepSkyBlue",.6) translate([16,-1,6]) cube([2,42,5]);
            color("DeepSkyBlue",.6) translate([22,-1,6]) cube([2.5,42,5]);
            // fan cut out
            color("DeepSkyBlue",.6) translate([20,20,2]) cylinder(r=18, h=13.5, $fn=100);

            // holes
            color("DeepSkyBlue",.6) translate([45.5,10,-1]) cylinder(d=3, h=4);
            color("DeepSkyBlue",.6) translate([-5.5,30,-1]) cylinder(d=3, h=4);
        }
    }
    if(type=="xu4q_oem" || type=="n2lq_oem") {
        $fn=60;
        size_x = 58;
        size_y = 40;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([5.5,-30,soc1size_z])
        difference() {
            union() {
                color("DeepSkyBlue",.6) cube([40, 40, 25]);
                color("DeepSkyBlue",.6) translate([39.99,6.5,0]) cube([5.5,7,2]);
                color("DeepSkyBlue",.6) translate([45.5,10,0]) cylinder(d=7, h=2);
                color("DeepSkyBlue",.6) translate([-5.49,26.5,0]) cube([5.5,7,2]);
                color("DeepSkyBlue",.6) translate([-5.5,30,0]) cylinder(d=7, h=2);
            }
            // fins
            for (i=[1.25:3.5:38.5]) {
                    color("DeepSkyBlue",.6) translate([i,-1,2]) cube ([2.5,42,25]);
            }
            for (i=[7.5:8:38.5]) {
                    color("DeepSkyBlue",.6) translate([-1,i,2]) cube ([42,1.5,25]);
            }

            // holes
            color("DeepSkyBlue",.6) translate([45.5,10,-1]) cylinder(d=3, h=4);
            color("DeepSkyBlue",.6) translate([-5.5,30,-1]) cylinder(d=3, h=4);
        }

    }
    if(type=="n1_oem" || type=="40mm_active") {
        $fn=60;
        size_x = 58;
        size_y = 40;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([5.5,-30,soc1size_z])
        difference() {
            union() {
                color("white",.6) cube([40, 40, 9.8]);
                color("white",.6) translate([39.99,6.5,0]) cube([5.5,7,2]);
                color("white",.6) translate([45.5,10,0]) cylinder(d=7, h=2);
                color("white",.6) translate([-5.49,26.5,0]) cube([5.5,7,2]);
                color("white",.6) translate([-5.5,30,0]) cylinder(d=7, h=2);
            }
            // fins
            for (i=[1.5:2.25:38.5]) {
                    color("white",.6) translate([i,-1,2]) cube ([1.25,42,12]);
            }
            // cross opening
            color("white",.6) translate([17.5,-1,2]) cube([5,42,10]);
            color("white",.6) translate([-1,17.5,2]) cube([42,5,10]);
            // fin elevations
            color("white",.6) translate([4,-1,9]) cube([8,42,2]);
            color("white",.6) translate([28,-1,9]) cube([8,42,2]);
            color("white",.6) translate([11,-1,8]) cube([2,42,3]);
            color("white",.6) translate([27,-1,8]) cube([2,42,3]);
            color("white",.6) translate([13,-1,7]) cube([2.5,42,4]);
            color("white",.6) translate([25,-1,7]) cube([2,42,4]);
            color("white",.6) translate([16,-1,6]) cube([2,42,5]);
            color("white",.6) translate([22,-1,6]) cube([2.5,42,5]);
            // fan cut out
            color("white",.6) translate([20,20,2]) cylinder(r=18, h=13.5, $fn=100);

            // holes
            color("white",.6) translate([45.5,10,-1]) cylinder(d=3, h=4);
            color("white",.6) translate([-5.5,30,-1]) cylinder(d=3, h=4);
        }
    }
    // h3/h3+ hk heatsink
    if(type=="h3_oem") {
        size_x = 77;
        size_y = 72;                
        size_z = 27;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        difference() {
            union() {        
                color("gray",.6) translate([0,0,3]) cube([size_x,size_y,size_z]);
                }
            // center channel and fins
            color("gray",1) translate([13,-1,5]) cube([2,size_y+2,size_z]);
            color("gray",1) translate([47,-1,5]) cube([2,size_y+2,size_z]);
            for (i=[1:3.75:size_y]) {
                color("gray",1) translate([-1,i,5]) cube([size_x+2,3,size_z]);
            }
            // holes
            color("gray",.6) translate([30,14,-1]) cylinder(d=3, h=7);
            color("gray",.6) translate([73,14,-1]) cylinder(d=3, h=7);
            color("gray",.6) translate([30,51,-1]) cylinder(d=3, h=7);
            color("gray",.6) translate([73,51,-1]) cylinder(d=3, h=7);
            color("gray",.6) translate([26,10,5]) cube([8,8,size_z]);
            color("gray",.6) translate([69,10,5]) cube([8.2,8,size_z]);
            color("gray",.6) translate([26,47,5]) cube([8,8,size_z]);
            color("gray",.6) translate([69,47,5]) cube([8.2,8,size_z]);
            
        }
    }
    if(type=="n2_oem") {
        size_x = 90;
        size_y = 90;                
        place(x,y,size_x,size_y,rotation,side,type,-3)
        color("gray") import("Odroid-N2_Heatsink.stl", convexity=3);
    }
    if(type=="n2+_oem") {
        size_x = 90;
        size_y = 90;                
        place(x,y,size_x,size_y,rotation,side,type,-3)
        color("gray") import("Odroid-N2+_Heatsink.stl", convexity=3);
    }
    if(type=="m1_oem") {
        size_x = 90;
        size_y = 122;                
        place(x,y,size_x,size_y,rotation,side,type,-3)
        color("gray") translate([-.5,0,3]) rotate([0,0,0]) import("Odroid-M1_Heatsink.stl", convexity=3);
    }
    if(type=="h2_oem") {
        size_x = 90;
        size_y = 90;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z+soc1size_z)
        color("gray") import("Odroid-H2_Heatsink.stl", convexity=3);
    }
    if(type=="khadas_oem") {
        size_x = 82;
        size_y = 48;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("gray",.6) import("Khadas_Heatsink.stl", convexity=3);
    }
    if(type=="khadas_fan_oem") {
        size_x = 82;
        size_y = 48;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("gray",.6) import("Khadas_Heatsink_Fan.stl", convexity=3);
    }
    if(type=="radxa_oem") {
        size_x = 82;
        size_y = 56;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z+soc1size_z)
        color("gray",.6) import("Radxa_Heatsink.stl", convexity=3);
    }
    if (type=="generic_20x20") {
        size_x = 20;
        size_y = 20;
        size_z = 11;
        fin_count = 15;
        fin_width = 0.3;
        base_height = 2.5;
        fin_offset = (size_x-(fin_count*fin_width))/(fin_count-1);
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z+soc1size_z)
        color("gold")
        union() {
            cube([size_x, size_y, base_height]);
            for (i=[0:fin_count-1]) {
                translate([i*(fin_offset+fin_width), 0, 0]) cube([fin_width, size_y, size_z]);
            }
        }
    }
    if (type=="bottom_soc2_generic_30x30") {
        size_x = 30;
        size_y = 30;
        size_z = 11.67;
        fin_count = 7;
        fin_width = 1.65;
        base_height = 2.5;
        fin_offset = (size_x-(fin_count*fin_width))/(fin_count-1);
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z+soc2size_z)
        // hack hack hack: z-offset is ignored when placing a component on the bottom
        translate([0, 0, soc2size_z])
        color("gold")
        union() {
            cube([size_x, size_y, base_height]);
            for (i=[0:fin_count-1]) {
                translate([i*(fin_offset+fin_width), 0, 0]) cube([fin_width, size_y, size_z]);
            }
        }
    }
}

// pcie class
module pcie(x,y,rotation,side,type,pcbsize_z) {
    // PCIE-X4
    if (type=="x4") {
        size_x = 38.8;
        size_y = 8.5;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                color("black") cube([size_x, size_y, 11.1]);
                color("dimgrey") translate([1.55,(size_y/2)-.8,2]) cube([11.5,1.6,11]);
                color("dimgrey") translate([16.5,(size_y/2)-.8,2]) cube([20.3,1.6,11]);
            }
            for (i=[1:1:11.5]) {
                color("gold") translate ([i+1,2.75,2.5]) cube([.5,1,8.25]);
                color("gold") translate ([i+1,4.75,2.5]) cube([.5,1,8.25]);
            }
            for (i=[17:1:36.5]) {
                color("gold") translate ([i,2.75,2.5]) cube([.5,1,8.25]);
                color("gold") translate ([i,4.75,2.5]) cube([.5,1,8.25]);
            }
        }
    }
}

// JST-PH connector class
module jst_ph(x,y,rotation,side,type,pcbsize_z) {
    size_x = 2.4+(type*2);
    size_y = 4.5;
    place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
    union() {
        difference() {
            color("white") cube([size_x, size_y, 6]);
            color("white") translate([.5, .5, .5]) cube([size_x-1, size_y-1, 6]);
            color("white") translate([size_x/2-(0.5*type)/2, -.1,.5]) cube([0.5*type, size_y-2, 6]);
        }
        translate([1.95, 0, 0]) union() {
            for(ind=[0:type-1]) {
                color("silver") translate([ind*2, 1.4, .5]) cube([.5, .5, 4]);
            }
        }
    }
}


// compute module holder class
module cm_holder(x,y,rotation,side,type,pcbsize_z) {
    // jetson nano
    if(type == "jetsonnano") {        
        size_x = 73;
        size_y = 6.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                color("dimgray") translate([0,0,0]) cube([size_x,size_y,9.2]);
                color("dimgray") translate([1.5,-1,5.7]) cube([70,3,5]);
                color("dimgray") translate([3.5,-1,5.7]) cube([28.5,5.25,.92]);
                color("dimgray") translate([34.5,-1,5.7]) cube([35,5.25,.92]);
            }
            for (i=[2:.5:31]) {
                color("gold") translate ([i+.5,2,5.7]) cube([.25,2,.25]);
            }
            for (i=[34:.5:69]) {
                color("gold") translate ([i+.5,2,5.7]) cube([.25,2,.25]);
            }
        }
    }   
}

// compute module class
module cm(x,y,rotation,side,type,pcbsize_z) {
    $fn=90;
    // jetson nano
    if(type == "jetsonnano") {        
        size_x = 70;
        size_y = 45;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                
                color("tan") translate([0,0,7]) cube([size_x,size_y,1.4]);
                color("tan") translate([37,-1,6]) cube([1,5,4]);
                color("dimgray") translate([-1,18,6]) cube([3,4,4]);
                color("dimgray") translate([size_x-2,18,6]) cube([3,4,4]);
                translate([size_x-3,size_y-3,6]) cylinder(d=3,h=3);
                translate([3,size_y-3,6]) cylinder(d=3,h=3);
                
            }
            for (i=[2:.5:36]) {
                color("gold") translate ([i+.5,0,6.8]) cube([.25,2,.25]);
                color("gold") translate ([i+.5,0,8.4]) cube([.25,2,.25]);
            }
            for (i=[37.5:.5:67]) {
                color("gold") translate ([i+.5,0,6.8]) cube([.25,2,.25]);
                color("gold") translate ([i+.5,0,8.4]) cube([.25,2,.25]);
            }
            color("dimgrey") translate([20,13,8.3]) cube([14,14,1.2]);
            difference() {
                color("black") translate([6.5,4.5,9.5]) cube([58,40,16]);
                color("dimgrey") translate([0,25.375,13.5]) rotate([90,2.5,90]) linear_extrude(70) {
                    polygon(points = [[0,0],[-.5,13],[4,13],[3.5,0]]);}
                color("dimgrey") translate([0,20.675,13.5]) rotate([90,-2.5,90]) linear_extrude(70) {
                    polygon(points = [[0,0],[-.5,13],[4,13],[3.5,0]]);}
                color("dimgrey") translate([0,30.5,13.5]) rotate([90,5,90]) linear_extrude(70) {
                    polygon(points = [[0,0],[-.5,13],[4,13],[3.5,0]]);}
                color("dimgrey") translate([0,15.25,13.5]) rotate([90,-5,90]) linear_extrude(70) {
                    polygon(points = [[0,0],[-.5,13],[4,13],[3.5,0]]);}
                color("dimgrey") translate([0,35,13.5]) rotate([90,10,90]) linear_extrude(70) {
                    polygon(points = [[0,0],[-.5,10.5],[4,10.5],[3.5,0]]);}
                color("dimgrey") translate([0,10.5,13]) rotate([90,-10,90]) linear_extrude(70) {
                    polygon(points = [[0,0],[-.5,10.5],[4,10.5],[3.5,0]]);}
                color("dimgrey") translate([0,36.5,20]) cube([70,10,4]);
                color("dimgrey") translate([0,1.5,20]) cube([70,10,4]);
                color("dimgrey") translate([0,39.5,13]) rotate([90,10,90]) linear_extrude(70) {
                    polygon(points = [[0,0],[0,10.5],[3,10.5],[3,0]]);}
                color("dimgrey") translate([0,6.5,12.5]) rotate([90,-10,90]) linear_extrude(70) {
                    polygon(points = [[0,0],[0,10.5],[3,10.5],[3,0]]);}
                color("dimgrey") translate([19,9,22]) cylinder(d=3, h=5);
                color("dimgrey") translate([51,9,22]) cylinder(d=3, h=5);
                color("dimgrey") translate([19,41,22]) cylinder(d=3, h=5);
                color("dimgrey") translate([51,41,22]) cylinder(d=3, h=5);
                    
            }
            difference() {
                union() {
                    color("silver") translate([size_x-3,size_y-3,0]) cylinder(d=5.2,h=7, $fn=6);
                    color("silver") translate([3,size_y-3,0]) cylinder(d=5.2,h=7, $fn=6);
                }
                color("silver") translate([size_x-3,size_y-3,-.1]) cylinder(d=3,h=13);
                color("silver") translate([3,size_y-3,-.1]) cylinder(d=3,h=13);
            }
        }
    }   
}
