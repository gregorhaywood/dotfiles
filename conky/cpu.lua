--[[
Draw CPUs
]]
require 'cairo'
require('colours')

bg_colour=base
bg_alpha=1

type_info = {
    cpu = {
        fg_colour=decor,
        fg_alpha=1,
        cw=true,
        min=-20,
        max=100,
        radius=75,
        thickness=10,
    },
    freq = {
        fg_colour=decor,
        fg_alpha=1,
        cw=false,
        min=0,
        max=3800,
        radius=75,
        thickness=10,
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

    -- Draw indicator etchings
    -- Rings
    local line_r = ring_r + 0.5*ring_w
    for i = 0.25, 1, 0.25 do
        cairo_arc(cr,xc,yc,i*line_r,angle_0,angle_f)
        cairo_set_source_rgba(cr,rgb_to_r_g_b(etch,1))
        cairo_set_line_width(cr,0.2)
        cairo_stroke(cr)
    end
    -- Lines
    -- for i = 0, 1, 0.25 do
        cairo_line_to(cr,xc-line_r,yc)
        cairo_line_to(cr,xc+line_r,yc)
        cairo_set_source_rgba(cr,rgb_to_r_g_b(etch,1))
        cairo_set_line_width(cr,0.2)
        cairo_stroke(cr)
    -- end
        cairo_line_to(cr,xc,yc-line_r)
        cairo_line_to(cr,xc,yc+line_r)
        cairo_set_source_rgba(cr,rgb_to_r_g_b(etch,1))
        cairo_set_line_width(cr,0.1)
        cairo_stroke(cr)
	
	
	-- Draw indicator ring

    if info['cw'] then
        cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
    else
        cairo_arc(cr,xc,yc,ring_r,angle_f-t_arc, angle_f)
    end
	cairo_set_line_width(cr,ring_w)
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
