local utf8 = require('utf8/init'):init()
local ANSI_ESCAPE_CODES = require("ANSI_escape_codes")
local lower = utf8.lower


local console_menu = {
    all_choice_descriptions = {},
    all_input_handlers = {},
    ---@type table<string, table<integer, function>>
    all_choices_references = {},
    ---@type table<string, string[]>
    all_choices   = {},
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
---@param description string
---@param func function
function console_menu.add_choice(choice_group_name, name, description, func)
    local all_choices = console_menu.all_choices
    if  all_choices[choice_group_name] == nil then
        all_choices[choice_group_name] = {}
    end

    local all_choice_descriptions = console_menu.all_choice_descriptions
    if  all_choice_descriptions[choice_group_name] == nil then
        all_choice_descriptions[choice_group_name] = {}
    end

    local all_choices_references = console_menu.all_choices_references
    if  all_choices_references[choice_group_name] == nil then
        all_choices_references[choice_group_name] = {}
    end

    local choice_descriptions = all_choice_descriptions[choice_group_name]
    local choice_group = all_choices[choice_group_name]
    if type(name) == "string" then
        local new_count = #all_choices_references[choice_group_name] + 1
        choice_descriptions[new_count]  = description
        choice_group[tostring(new_count)] = func
        choice_group[lower(name)]       = func
        all_choices_references[choice_group_name][new_count] = func
    else -- table
        for i = 1, #name do
            choice_group[lower(name[i])] = func
        end
    end
end

function console_menu.print_choice_menu(choice_group_name)
    local choice_group = console_menu.all_choices[choice_group_name]
    if choice_group == nil then return end
    local choice_descriptions = console_menu.all_choice_descriptions[choice_group_name]
    local choices_references  = console_menu.all_choices_references[choice_group_name]
    if choices_references == nil then return end

    local message = {}
    for i, func_reference in pairs(choices_references) do
        ---@type string[]
        local message_part = {}
        local reserve_names = {}
        for choice_name, func in pairs(choice_group) do
            local number = nil
            if func_reference == func then
                if number then
                    message_part[#message_part+1] = "|"
                    message_part[#message_part+1] = choice_name
                else
                    if tonumber(choice_name) then
                        message_part[#message_part+1] = ANSI_ESCAPE_CODES.blue
                        message_part[#message_part+1] = ANSI_ESCAPE_CODES.bold
                        message_part[#message_part+1] = "["
                        message_part[#message_part+1] = choice_name
                        number = tonumber(choice_name)
                    else
                        reserve_names[#reserve_names+1] = choice_name
                    end
                end
            end
        end

        for i2=1, #reserve_names do
            message_part[#message_part+1] = "|"
            message_part[#message_part+1] = reserve_names[i2]
        end
        if #message_part ~= 0 then
            message_part[#message_part+1] = "]"
            message_part[#message_part+1] = ANSI_ESCAPE_CODES.clear
            message_part[#message_part+1] = " - "
            message_part[#message_part+1] = choice_descriptions[i]
        end
        message[#message+1] = table.concat(message_part)
    end

    if #message ~= 0 then
        local message_part = {}
        message_part[#message_part+1] = ANSI_ESCAPE_CODES.blue
        message_part[#message_part+1] = ANSI_ESCAPE_CODES.bold
        message_part[#message_part+1] = "[<]"
        message_part[#message_part+1] = ANSI_ESCAPE_CODES.clear
        message_part[#message_part+1] = " - Back"
        message[#message+1] = table.concat(message_part)
    end

    local lines_count = #message + 1
    print(table.concat(message, "\n"))
    return lines_count
end


return console_menu
