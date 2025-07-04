local console_menu = require("console_menu")
local RPstuff = require("RPstuff")


function console_menu.all_handlers.require_input()
    console_menu.choices = nil
    io.write("Input: ")
end

function console_menu.all_handlers.require_ru_input()
    console_menu.choices = nil
    io.write("Input: ")
end

function console_menu.all_handlers.init()
    console_menu.choices = console_menu.all_choices.init
    console_menu.print_choice_menu("init")
    io.write("Language: ")
end

function console_menu.all_handlers.en_funcs()
    console_menu.choices = console_menu.all_choices.en_funcs
    console_menu.print_choice_menu("en_funcs")
    io.write("Function: ")
end

function console_menu.all_handlers.ru_funcs()
    console_menu.choices = console_menu.all_choices.ru_funcs
    console_menu.print_choice_menu("ru_funcs")
    io.write("Функция: ")
end

function console_menu.all_handlers.mix_funcs()
    console_menu.choices = console_menu.all_choices.mix_funcs
    console_menu.print_choice_menu("mix_funcs")
    io.write("Function: ")
end


function console_menu.utils.en_language()
    console_menu.add_handler(console_menu.all_handlers.en_funcs)
end

function console_menu.utils.en_bark()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.en.barkAccent(input)))
        return ""
    end)
end

function console_menu.utils.ru_bark()
    console_menu.add_handler(console_menu.all_handlers.require_ru_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.ru.barkAccent(input)))
        return ""
    end)
end

function console_menu.utils.en_extremeGag()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.en.extremeGag(input)))
        return ""
    end)
end

function console_menu.utils.ru_extremeGag()
    console_menu.add_handler(console_menu.all_handlers.require_ru_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.ru.extremeGag(input)))
        return ""
    end)
end

function console_menu.utils.en_severeGag()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.en.severeGag(input)))
        return ""
    end)
end

function console_menu.utils.ru_severeGag()
    console_menu.add_handler(console_menu.all_handlers.require_ru_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.ru.severeGag(input)))
        return ""
    end)
end

function console_menu.utils.en_looseGag()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.en.looseGag(input)))
        return ""
    end)
end

function console_menu.utils.ru_looseGag()
    console_menu.add_handler(console_menu.all_handlers.require_ru_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.ru.looseGag(input)))
        return ""
    end)
end

function console_menu.utils.en_OwOAccent()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.en.OwOAccent(input)))
        return ""
    end)
end

function console_menu.utils.ru_OwOAccent()
    console_menu.add_handler(console_menu.all_handlers.require_ru_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.ru.OwOAccent(input)))
        return ""
    end)
end

function console_menu.utils.en_lizardAccent()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.en.lizardAccent(input)))
        return ""
    end)
end

function console_menu.utils.ru_lizardAccent()
    console_menu.add_handler(console_menu.all_handlers.require_ru_input, function(input)
        if input == "<" then return input end
        print((RPstuff.transform_text_funcs.ru.lizardAccent(input)))
        return ""
    end)
end

function console_menu.utils.mix_lizardAccent()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        local text = RPstuff.transform_text_funcs.ru.lizardAccent(input)
        text = RPstuff.transform_text_funcs.en.lizardAccent(text)
        print(text)
        return ""
    end)
end

function console_menu.utils.en_lightStutter()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.special_transform_text_funcs.en.stutter(input, 0.3, 0, 0, 0)))
        return ""
    end)
end

function console_menu.utils.en_mildStutter()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.special_transform_text_funcs.en.stutter(input, 0.5, 0, 0, 0.2)))
        return ""
    end)
end

function console_menu.utils.en_severeStutter()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.special_transform_text_funcs.en.stutter(input, 0.6, 0.0, 0.2, 0.3)))
        return ""
    end)
end

function console_menu.utils.en_extremeStutter()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.special_transform_text_funcs.en.stutter(input, 0.7, 0, 0.3, 0.2)))
        return ""
    end)
end

function console_menu.utils.en_insaneStutter()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.special_transform_text_funcs.en.stutter(input, 0.8, 0.3, 0.3, 0.2)))
        return ""
    end)
end

function console_menu.utils.mix_bark()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        local text = RPstuff.transform_text_funcs.ru.barkAccent(input)
        text = RPstuff.transform_text_funcs.en.barkAccent(text)
        print(text)
        return ""
    end)
end

function console_menu.utils.zalgo()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        local text = RPstuff.replaceWordsWithFunc(input, RPstuff.zalgo, 8, 2, 7, 2, 9, 2)
        print(text)
        return ""
    end)
end

function console_menu.utils.mix_extremeGag()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        local text = RPstuff.transform_text_funcs.ru.extremeGag(input)
        text = RPstuff.transform_text_funcs.en.extremeGag(text)
        print(text)
        return ""
    end)
end

function console_menu.utils.mix_severeGag()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        local text = RPstuff.transform_text_funcs.ru.severeGag(input)
        text = RPstuff.transform_text_funcs.en.severeGag(text)
        print(text)
        return ""
    end)
end

function console_menu.utils.mix_looseGag()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        local text = RPstuff.transform_text_funcs.ru.looseGag(input)
        text = RPstuff.transform_text_funcs.en.looseGag(text)
        print(text)
        return ""
    end)
end

function console_menu.utils.mix_OwOAccent()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        local text = RPstuff.transform_text_funcs.ru.OwOAccent(input)
        text = RPstuff.transform_text_funcs.en.OwOAccent(text)
        print(text)
        return ""
    end)
end

function console_menu.utils.ru_language()
    console_menu.add_handler(console_menu.all_handlers.ru_funcs)
end

function console_menu.utils.mix_language()
    console_menu.add_handler(console_menu.all_handlers.mix_funcs)
end


console_menu.all_choices = {
    init = {},
    en_funcs = {},
    ru_funcs = {},
    mix_funcs = {},
}

do
    local utils = console_menu.utils
    local add_choice = console_menu.add_choice
    add_choice("init", "en",  "English", utils.en_language)
    add_choice("init", "ru",  "Russian (Русский)", utils.ru_language)
    add_choice("init", "mix", "Mix", utils.mix_language)

    add_choice("en_funcs", "bark",       "bark accent", utils.en_bark)
    add_choice("en_funcs", "extremeGag", "extreme gag", utils.en_extremeGag)
    add_choice("en_funcs", "severeGag",  "severe gag",  utils.en_severeGag)
    add_choice("en_funcs", "looseGag",   "loose gag",   utils.en_looseGag)
    add_choice("en_funcs", "OwO",        "OwO accent",  utils.en_OwOAccent)
    add_choice("en_funcs", "zalgo",      "zalgo",       utils.zalgo)
    add_choice("en_funcs", "lizard",     "lizard accent", utils.en_lizardAccent)
    add_choice("en_funcs", "stutter",        "light stutter",   utils.en_lightStutter)
    add_choice("en_funcs", "mildStutter",    "mild stutter",    utils.en_mildStutter)
    add_choice("en_funcs", "severeStutter",  "severe stutter",  utils.en_severeStutter)
    add_choice("en_funcs", "extremeStutter", "extreme stutter", utils.en_extremeStutter)
    add_choice("en_funcs", "insaneStutter",  "insane stutter",  utils.en_insaneStutter)

    add_choice("ru_funcs", "bark", utils.ru_bark)
    add_choice("ru_funcs", "extremeGag", "extreme gag", utils.ru_extremeGag)
    add_choice("ru_funcs", "severeGag",  "severe gag",  utils.ru_severeGag)
    add_choice("ru_funcs", "looseGag",   "loose gag",   utils.ru_looseGag)
    add_choice("ru_funcs", "OwO",    "OwO акцент", utils.ru_OwOAccent)
    add_choice("ru_funcs", "zalgo",  "zalgo",      utils.zalgo)
    add_choice("ru_funcs", "lizard", "lizard accent", utils.ru_lizardAccent)

    add_choice("mix_funcs", "bark",       "bark accent", utils.mix_bark)
    add_choice("mix_funcs", "extremeGag", "extreme gag", utils.mix_extremeGag)
    add_choice("mix_funcs", "severeGag",  "severe gag",  utils.mix_severeGag)
    add_choice("mix_funcs", "looseGag",   "loose gag",   utils.mix_looseGag)
    add_choice("mix_funcs", "OwO",        "OwO accent",  utils.mix_OwOAccent)
    add_choice("mix_funcs", "zalgo",      "zalgo",       utils.zalgo)
    add_choice("mix_funcs", "lizard",     "ящерский акцент",  utils.mix_lizardAccent)
end


console_menu.add_handler(console_menu.all_handlers.init)

while true do
    console_menu.handler()

    local input = io.read()
    if console_menu.input_handler then
        input = console_menu.input_handler(input)
    else
        input = console_menu.default_input_handler(input)
    end

    local choice = console_menu.choices
    if choice then
        choice = choice[input]
    end

    if choice then
        print()
        choice()
    elseif console_menu.alternative_handler then
        console_menu.alternative_handler()
    elseif input == "<" then
        console_menu.handler = console_menu.prev_handlers[#console_menu.prev_handlers]
        if console_menu.handler then
            console_menu.prev_handlers[#console_menu.prev_handlers] = nil
            console_menu.input_handler = nil
        else
            break
        end
    end
end
