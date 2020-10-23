--[[
Ring Meters by londonali1010 (2009)
+ Original Work done by Londonali1010 
+ Modified version by Ujjwal Biswas

This script draws percentage meters as rings. It is fully customisable; all options are described in the script.

IMPORTANT: if you are using the 'cpu' function, it will cause a segmentation fault if it tries to draw a ring straight away. The if statement near the end of the script uses a delay to make sure that this doesn't happen. It calculates the length of the delay by the number of updates since Conky started. Generally, a value of 5s is long enough, so if you update Conky every 1s, use update_num > 5 in that if statement (the default). If you only update Conky every 2s, you should change it to update_num > 3; conversely if you update Conky every 0.5s, you should use update_num > 10. ALSO, if you change your Conky, is it best to use "killall conky; conky" to update it, otherwise the update_num will not be reset and you will get an error.

To call this script in Conky, use the following (assuming that you save this script to ~/scripts/rings.lua):
	lua_load ~/scripts/rings-v1.2.1.lua
	lua_draw_hook_pre ring_stats

    Note: To work with this Lua create a folder name .conky at your home directory and place ring lua in that folder

	
Changelog:
+ v1.2.1 -- Fixed minor bug that caused script to crash if conky_parse() returns a nil value (20.10.2009)
+ v1.2 -- Added option for the ending angle of the rings (07.10.2009)
+ v1.1 -- Added options for the starting angle of the rings, and added the "max" variable, to allow for variables that output a numerical value rather than a percentage (29.09.2009)
+ v1.0 -- Original release (28.09.2009)

]]

bg_colour=0x317BE5
bg_alpha=1

type_info = {
    cpu = {
        fg_colour=0xED009E,
        fg_alpha=1,
        cw=true,
        min=-20,
        max=100,
        radius=75,
        thickness=15,
    },
    freq = {
        fg_colour=0x00ED9E,
        fg_alpha=1,
        cw=false,
        min=0,
        max=3800,
        radius=75,
        thickness=15,
    },
}

cores = {
    
	core1=
    {
        x=190,
        y=100,
        units={
            {
                name='cpu',
                arg='cpu1',
                start_angle=0,
                end_angle=90
            },
            {
                name='cpu',
                arg='cpu5',
                cw=true,
                start_angle=180,
                end_angle=270
            },
            {
                name='freq',
                arg='cpu1',
                start_angle=0,
                end_angle=270,
            },
            {
                name='freq',
                arg='cpu5',
                start_angle=180,
                end_angle=90
            },
        },
        temp=nil,
    },
	core2=
    {
        x=160,
        y=300,
        units={
            {
                name='cpu',
                arg='cpu1',
                start_angle=0,
                end_angle=90
            },
            {
                name='cpu',
                arg='cpu5',
                cw=true,
                start_angle=180,
                end_angle=270
            },
            {
                name='freq',
                arg='cpu1',
                start_angle=0,
                end_angle=270,
            },
            {
                name='freq',
                arg='cpu5',
                start_angle=180,
                end_angle=90
            },
        },
        temp=nil,
    },
	core3=
    {
        x=130,
        y=500,
        units={
            {
                name='cpu',
                arg='cpu1',
                start_angle=0,
                end_angle=90
            },
            {
                name='cpu',
                arg='cpu5',
                cw=true,
                start_angle=180,
                end_angle=270
            },
            {
                name='freq',
                arg='cpu1',
                start_angle=0,
                end_angle=270,
            },
            {
                name='freq',
                arg='cpu5',
                start_angle=180,
                end_angle=90
            },
        },
        temp=nil,
    },
	core4=
    {
        x=100,
        y=700,
        units={
            {
                name='cpu',
                arg='cpu1',
                start_angle=0,
                end_angle=90
            },
            {
                name='cpu',
                arg='cpu5',
                cw=true,
                start_angle=180,
                end_angle=270
            },
            {
                name='freq',
                arg='cpu1',
                start_angle=0,
                end_angle=270,
            },
            {
                name='freq',
                arg='cpu5',
                start_angle=180,
                end_angle=90
            },
        },
        temp=nil,
    },

}

require 'cairo'

function rgb_to_r_g_b(colour,alpha)
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function draw_ring(cr,value, pt, xc, yc)
	local w,h=conky_window.width,conky_window.height
    local info = type_info[pt["name"]]
	
	local ring_r,ring_w,sa,ea=info['radius'],info['thickness'],pt['start_angle'],pt['end_angle']

    local t=(value-info['min'])/(info['max']-info['min'])

    local bgc, bga = bg_colour, bg_alpha
    local fgc = info["fg_colour"]
    local fga = info["fg_alpha"]

    local angle_0,angle_f,t_arc = 0,0,0
    if info["cw"] then
        angle_0=sa*(2*math.pi/360)-math.pi/2
        angle_f=ea*(2*math.pi/360)-math.pi/2
        t_arc=t*(angle_f-angle_0)
    else
        angle_0=ea*(2*math.pi/360)-math.pi/2
        angle_f=sa*(2*math.pi/360)-math.pi/2
        if angle_f < 0 then
            angle_f = angle_f + math.pi*2
        end
        t_arc=t*(angle_f-angle_0)
    end

	-- Draw background ring
	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
	cairo_set_line_width(cr,ring_w)
	cairo_stroke(cr)
	
	-- Draw indicator ring

    if info['cw'] then
        cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
    else
        cairo_arc(cr,xc,yc,ring_r,angle_f-t_arc, angle_f)
    end
    cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
    cairo_stroke(cr)		
end

function conky_main()
	local function draw_core(cr,core)
        for i in pairs(core["units"]) do
            pt = core["units"][i]
            local str=''
            local value=0
            
            str=string.format('${%s %s}',pt['name'],pt['arg'])
            str=conky_parse(str)
        
            value=tonumber(str)
            if value == nil then value = 0 end
            
            draw_ring(cr,value,pt,core["x"], core["y"])
        end
        -- TODO
        -- Draw temperature
        -- Draw other anotations
	end

	if conky_window==nil then return end
	local cs=cairo_xlib_surface_create(
        conky_window.display,
        conky_window.drawable,
        conky_window.visual,
        conky_window.width,
        conky_window.height)
	
	local cr=cairo_create(cs)	

    -- Only redraw while visible
    -- Currently not an issue (I have plenty of resources)
    -- local handle = io.popen(" i3-msg -t get_workspaces|grep conky")
    -- local result = handle:read("*a")
    -- handle:close()
    local result = "" 
    
    -- Updates limit prevents segfault
	local updates=tonumber(conky_parse('${updates}'))
    if updates>5 and result=="" then
	    for i in pairs(cores) do
		    draw_core(cr,cores[i])
	    end
	end

    cairo_surface_destroy(cs)
    cairo_destroy(cr)
end
