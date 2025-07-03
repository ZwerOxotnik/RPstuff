local utf8 = require('utf8/init'):init()
local lower = utf8.lower


local console_menu = {
    all_choices = {none = {}},
    all_input_handlers = {},
    prev_handlers = {},
    all_handlers  = {},
    utils = {},
    is_choice_data = false,
    alternative_handler = nil,
    input_handler = nil,
    handler = nil,
    choices = nil,
    default_input_handler = function(input)
        return lower(input)
    end,
}

---@param new_handler function
---@param input_handler function?
---@param alternative_handler function?
function console_menu.add_handler(new_handler, input_handler, alternative_handler)
    local prev_handler = console_menu.handler
    local prev_handlers = console_menu.prev_handlers
    if prev_handler and prev_handler ~= new_handler then
        prev_handlers[#prev_handlers+1] = prev_handler
    end

    console_menu.handler = new_handler
    console_menu.input_handler = input_handler
    console_menu.alternative_handler = alternative_handler
    console_menu.choices = nil
end

---@param choice_group_name string
---@param name string|string[]
---@param func function
function console_menu.add_choice(choice_group_name, name, func)
    local all_choices = console_menu.all_choices
    if all_choices[choice_group_name] == nil then
        all_choices[choice_group_name] = {}
    end

    if type(name) == "string" then
        all_choices[choice_group_name][lower(name)] = func
    else -- table
        for i = 1, #name do
            all_choices[choice_group_name][lower(name[i])] = func
        end
    end
end


return console_menu
