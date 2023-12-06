local colors = {}

local data = {
    background = {
        bg_dim = "#232a2e",
        bg0 = "#2d353b",
        bg1 = "#343f44",
        bg2 = "#3d484d",
        bg3 = "#475258",
        bg4 = "#4f585e",
        bg5 = "#56635f",
    },
    fontground = {
        fg0 = "#d3c6aa",
    },
    base = {
        red = "#e67e80",
        orange = "#e69875",
        yellow = "#dbbc7f",
        green = "#a7c080",
        blue = "#7fbbb3",
        aque = "#83c092",
        purple = "#d699b6",
        gray0 = "#7a8478",
        gray1 = "#859289",
        gray2 = "#9da9a0",
        cyan = "#83c092",
        darkblue = "#081633",
        violet = "#a9a1e1",
        magenta = "#c678dd"
    },
    statusline = {
        green = "#a7c080",
        flesh = "#d3c6aa",
        red = "#e67e80"
    }
}

function colors.get(category, add_space)
    if add_space then
        return setmetatable({}, {
            __index = function(_, key)
                return data[category][key]
            end
        })
    else
        return data[category]
    end
end

return colors
