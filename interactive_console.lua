local console_menu = require("console_menu")
local RPstuff = require("RPstuff")


function console_menu.all_handlers.require_input()
    console_menu.choices = console_menu.all_choices.none
    io.write("Input: ")
end

function console_menu.all_handlers.require_ru_input()
    console_menu.choices = console_menu.all_choices.none
    io.write("Input: ")
end

function console_menu.all_handlers.init()
    console_menu.choices = console_menu.all_choices.init
    print"[1] En"
    print"[2] Ru"
    print"[3] Mix"
    io.write("Language: ")
end

-- TODO: REFACTOR!
function console_menu.all_handlers.en_funcs()
    console_menu.choices = console_menu.all_choices.en_funcs
    print"[1|bark]\t Bark accent"
    print"[2|extremeGag]\t extreme gag"
    print"[3|severeGag]\t severe gag"
    print"[4|looseGag]\t loose gag"
    print"[5|OwO]\t\t OwO accent"
    print"[6|zalgo]\t zalgo"
    print"[7|lizard]\t lizard accent"
    print"[8|stutter]\t stutter"
    print"[<] Back"
    io.write("Function: ")
end

-- TODO: REFACTOR!
function console_menu.all_handlers.ru_funcs()
    console_menu.choices = console_menu.all_choices.ru_funcs
    print"[1|bark]\t лайcкий акцент"
    print"[2|extremeGag]\t extreme gag"
    print"[3|severeGag]\t severe gag"
    print"[4|looseGag]\t loose gag"
    print"[5|OwO]\t OwO акцент"
    print"[6|zalgo]\t zalgo"
    print"[7|lizard]\t аккцент ящера"
    print"[<] Обратно"
    io.write("Функция: ")
end

-- TODO: REFACTOR!
function console_menu.all_handlers.mix_funcs()
    console_menu.choices = console_menu.all_choices.mix_funcs
    print"[1|bark]\t bark accent"
    print"[2|extremeGag]\t extreme gag"
    print"[3|severeGag]\t severe gag"
    print"[4|looseGag]\t loose gag"
    print"[5|OwO]\t OwO accent"
    print"[6|zalgo]\t zalgo"
    print"[7|lizard]\t lizard accent"
    print"[<] Back"
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

function console_menu.utils.en_stutter()
    console_menu.add_handler(console_menu.all_handlers.require_input, function(input)
        if input == "<" then return input end
        print((RPstuff.special_transform_text_funcs.en.stutter(input, 0.5, 0.1, 0.3, 0.2)))
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
    none = {},
    init = {},
    en_funcs = {},
    ru_funcs = {},
    mix_funcs = {},
}

do
    local utils = console_menu.utils
    local add_choice = console_menu.add_choice
    add_choice("init", {"1", "en"},  utils.en_language)
    add_choice("init", {"2", "ru"},  utils.ru_language)
    add_choice("init", {"3", "mix"}, utils.mix_language)

    add_choice("en_funcs", {"1", "bark"}, utils.en_bark)
    add_choice("en_funcs", {"2", "extremeGag"}, utils.en_extremeGag)
    add_choice("en_funcs", {"3", "severeGag"},  utils.en_severeGag)
    add_choice("en_funcs", {"4", "looseGag"},   utils.en_looseGag)
    add_choice("en_funcs", {"5", "OwO"}, utils.en_OwOAccent)
    add_choice("en_funcs", {"6", "zalgo"},   utils.zalgo)
    add_choice("en_funcs", {"7", "lizard"},  utils.en_lizardAccent)
    add_choice("en_funcs", {"8", "stutter"}, utils.en_stutter)

    add_choice("ru_funcs", {"1", "bark"}, utils.ru_bark)
    add_choice("ru_funcs", {"2", "extremeGag"}, utils.ru_extremeGag)
    add_choice("ru_funcs", {"3", "severeGag"},  utils.ru_severeGag)
    add_choice("ru_funcs", {"4", "looseGag"},   utils.ru_looseGag)
    add_choice("ru_funcs", {"5", "OwO"},    utils.ru_OwOAccent)
    add_choice("ru_funcs", {"6", "zalgo"},  utils.zalgo)
    add_choice("en_funcs", {"7", "lizard"}, utils.ru_lizardAccent)

    add_choice("mix_funcs", {"1", "bark"}, utils.mix_bark)
    add_choice("mix_funcs", {"2", "extremeGag"}, utils.mix_extremeGag)
    add_choice("mix_funcs", {"3", "severeGag"},  utils.mix_severeGag)
    add_choice("mix_funcs", {"4", "looseGag"},   utils.mix_looseGag)
    add_choice("mix_funcs", {"5", "OwO"},    utils.mix_OwOAccent)
    add_choice("mix_funcs", {"6", "zalgo"},  utils.zalgo)
    add_choice("mix_funcs", {"7", "lizard"}, utils.mix_lizardAccent)
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

    local choice = console_menu.choices[input]
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
