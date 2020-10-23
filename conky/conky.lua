-- This is a lua script for use in Conky.
require 'cairo'

function conky_cpu_stats ()
    if conky_window == nil then
        return
    end
    local cs = cairo_xlib_surface_create (conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width,
                                         conky_window.height)
    cr = cairo_create (cs)
    local updates = tonumber (conky_parse ('${updates}'))
    

	if update_num>5 then
	    for i in pairs(settings_table) do
		setup_rings(cr,settings_table[i])
	    end
	end
    
    cairo_surface_destroy (cs)
    cairo_destroy (cr)
    cr = nil
end
