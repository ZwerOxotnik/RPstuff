-- require("lldebugger").start()

local RPstuff = require("RPstuff")


local ANSI_ESCAPE_CODES = require("ANSI_escape_codes")
local RESPONSES = {}


---@param text string?
---@param bold_text string?
---@param color string?
---@return string
local function make_response(text, bold_text, color)
    bold_text = (bold_text and ANSI_ESCAPE_CODES.bold .. bold_text) or ""
    text = text or ""
    color = color or ANSI_ESCAPE_CODES.blue
    return color .. text .. bold_text .. ANSI_ESCAPE_CODES.clear
end


RESPONSES.original_text = make_response("Original text:")


local text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
print(RESPONSES.original_text .. text)
print(RPstuff.textWrap(text, 36, nil, "    "))
print()

text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
print(RESPONSES.original_text .. text)
print(RPstuff.special_transform_text_funcs.en.stutter(text, 0.5, 0.1, 0.3, 0.2))
print()

text = "Lorem ipsum dolor sit amet"
print(RESPONSES.original_text .. text)
print(RPstuff.replaceWordsWithFunc(text, RPstuff.zalgo, 8, 2, 7, 2, 9, 2))
print()

text = " Спасите меня, ПОЖАЛУЙСТА!"
print(RESPONSES.original_text .. text)
print(make_response("transform_text_funcs.ru.", "barkAccent:") .. RPstuff.transform_text_funcs.ru.barkAccent(text))
print(make_response("transform_text_funcs.ru.", "extremeGag:") .. RPstuff.transform_text_funcs.ru.extremeGag(text))
print(make_response("transform_text_funcs.ru.", "severeGag:")  .. RPstuff.transform_text_funcs.ru.severeGag(text))
print(make_response("transform_text_funcs.ru.", "looseGag:")   .. RPstuff.transform_text_funcs.ru.looseGag(text))
print(make_response("transform_text_funcs.ru.", "OwO:")        .. RPstuff.transform_text_funcs.ru.OwOAccent(text))
print(make_response("transform_text_funcs.ru.", "slime:")      .. RPstuff.transform_text_funcs.ru.slime(text))
print(make_response("transform_text_funcs.ru.", "wawa:")       .. RPstuff.transform_text_funcs.ru.wawa(text))
print()

text = ",,вы,, ж"
print(RESPONSES.original_text .. text)
local changed_subjects = {
    ["вы"]   = "ты",
    ["вас"]  = "тебя",
    ["вам"]  = "тебе",
    ["вами"] = "тобой",
}
print(make_response("Changed subjects:") .. RPstuff.replaceWord(text, changed_subjects))
print()

text = " yes, no, damn, OooooOOootoOoO!"
print(RESPONSES.original_text .. text)
print(make_response("transform_text_funcs.en.", "ScandinavianAccent:") .. RPstuff.transform_text_funcs.en.ScandinavianAccent(text))
print()

text = "yes, grandma! I did bring some pancakes for you"
print(RESPONSES.original_text .. text)
print(make_response("transform_text_funcs.en.", "RussianAccent:") .. RPstuff.transform_text_funcs.en.RussianAccent(text))
print()

text = " help me, PLEASE!"
print(RESPONSES.original_text .. text)
print(make_response("transform_text_funcs.en.", "barkAccent:").. RPstuff.transform_text_funcs.en.barkAccent(text))
print(make_response("transform_text_funcs.en.", "extremeGag:") .. RPstuff.transform_text_funcs.en.extremeGag(text))
print(make_response("transform_text_funcs.en.", "severeGag:")  .. RPstuff.transform_text_funcs.en.severeGag(text))
print(make_response("transform_text_funcs.en.", "looseGag:")   .. RPstuff.transform_text_funcs.en.looseGag(text))
print(make_response("transform_text_funcs.en.", "squeaky:") .. RPstuff.transform_text_funcs.en.squeaky(text))
print(make_response("transform_text_funcs.en.", "kitten:")  .. RPstuff.transform_text_funcs.en.kitten(text))
print(make_response("transform_text_funcs.en.", "turkey:")  .. RPstuff.transform_text_funcs.en.turkey(text))
print(make_response("transform_text_funcs.en.", "sheep:")   .. RPstuff.transform_text_funcs.en.sheep(text))
print(make_response("transform_text_funcs.en.", "slime:")   .. RPstuff.transform_text_funcs.en.slime(text))
print(make_response("transform_text_funcs.en.", "puppy:")   .. RPstuff.transform_text_funcs.en.puppy(text))
print(make_response("transform_text_funcs.en.", "pony:")    .. RPstuff.transform_text_funcs.en.pony(text))
print(make_response("transform_text_funcs.en.", "wawa:")    .. RPstuff.transform_text_funcs.en.wawa(text))
print(make_response("transform_text_funcs.en.", "moo:")     .. RPstuff.transform_text_funcs.en.moo(text))
print()

text = " help me, PLEASE! You you YOU FUCK Fuck fuck"
print(RESPONSES.original_text .. text)
print(make_response("transform_text_funcs.en.", "OwOAccent:") .. RPstuff.transform_text_funcs.en.OwOAccent(text))
print()

text = " text TEXT xe!"
print(RESPONSES.original_text .. text)
print(make_response("transform_text_funcs.en.", "lizardAccent:") .. RPstuff.transform_text_funcs.en.lizardAccent(text))
print()

text = " Тест, с, С, з, З, ш, ШШ, ч, Ч!"
print(RESPONSES.original_text .. text)
print(make_response("transform_text_funcs.ru.", "lizardAccent:") .. RPstuff.transform_text_funcs.ru.lizardAccent(text))
print()

text = "test  😁"
print(RESPONSES.original_text .. text)
print(make_response("stripNonStandardCharacters:") .. RPstuff.stripNonStandardCharacters(text))
print()

text = "test test test test"
print(RESPONSES.original_text .. text)
print(make_response("swap_near_characters:") .. RPstuff.swap_near_characters(text, 0.5))
print()

text = "test test test teeeeeeeeeeeest"
print(RESPONSES.original_text .. text)
print(make_response("ReplaceXcharacters:") .. RPstuff.replaceXcharacters(text, "#", 0.45, "t", 3))
print()

text = "test-test test. 12345678901234567890"
print(RESPONSES.original_text .. text)
print(make_response("obfuscate_text:") .. RPstuff.obfuscate_text(text, 0.2))
print()
