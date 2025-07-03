local utf8 = require('utf8/init'):init()


local random = math.random


return {
    en = {
        puppy = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "Bork",
                    "WOOF",
                    "Arf!",
                    "Wughgh!",
                    "Wahh!",
                    "Owghh!",
                    "Wofahh..AWohh!",
                    "ArfhhamhhHmh!",
                    "Ufffthmh!",
                    "Mewl!",
                    "Nyah!",
                    "Woof Woof!",
                    "wof-wof!",
                    "Hav!",
                }
            elseif (text:find("?")) then
                list = {
                    "Arf?",
                    "Wughgh?",
                    "Wahh?",
                    "Owghh?",
                    "Wofahh..AWohh?",
                    "ArfhhamhhHmh?",
                    "Ufffthmh?",
                    "Mewl?",
                    "Nyah?",
                    "Woof Woof?",
                    "wof-wof?",
                    "Woof?",
                    "Hav?",
                }
            elseif(text:find(".")) then
                list = {
                    "Arf...",
                    "Wughgh...",
                    "Wahh...",
                    "Owghh...",
                    "Wofahh..AWohh...",
                    "ArfhhamhhHmh...",
                    "Ufffthmh...",
                    "Mewl...",
                    "Nyah...",
                    "Woof Woof...",
                    "wof-wof...",
                    "Woof...",
                    "Hav...",
                }
            else
                list = {
                    "Bork",
                    "Arf",
                    "Wughgh",
                    "Wahh",
                    "Owghh",
                    "Wofahh..AWohh",
                    "ArfhhamhhHmh",
                    "Ufffthmh",
                    "Mewl",
                    "Nyah",
                    "Woof Woof",
                    "wof-wof",
                    "Woof",
                    "Hav",
                }
            end


            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        kitten = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "Meow!",
                    "Mrr!",
                    "ERrrp!",
                    "Awr!",
                    "Mrrah!",
                    "MhhMeoMHh!",
                    "Mmmahh!",
                    "MeWwhhmeoMwwMghm!",
                    "Womw!",
                    "WoahhMghhWoof!",
                    "Meo!",
                    "Miau!",
                    "Meo!",
                    "Mow!",
                    "Mrrrow!",
                    "Hhsss!",
                }
            elseif (text:find("?")) then
                list = {
                    "Meow?",
                    "Mrr?",
                    "ERrrp?",
                    "Awr?",
                    "Mrrah?",
                    "MhhMeoMHh?",
                    "Mmmahh?",
                    "MeWwhhmeoMwwMghm?",
                    "Womw?",
                    "WoahhMghhWoof?",
                    "Meo?",
                    "Miau?",
                    "Meo?",
                    "Mow?",
                    "Mrrrow?",
                    "Hhsss?",
                }
            elseif(text:find(".")) then
                list = {
                    "Meow...",
                    "Mrrrep...",
                    "Awr...",
                    "Mrr...",
                    "Mrrah",
                    "MhhMeoMHh...",
                    "Mmmahh...",
                    "MeWwhhmeoMwwMghm...",
                    "WoahhMghhWoof...",
                    "Womw...",
                    "Miau...",
                    "Meo...",
                    "Mow...",
                    "Mrrrow...",
                    "Hhsss...",
                }
            else
                list = {
                    "Meow",
                    "Brrrep",
                    "Mrr",
                    "ERrrp",
                    "Awr",
                    "Mrrah",
                    "MhhMeoMHh",
                    "Mmmahh",
                    "MeWwhhmeoMwwMghm",
                    "Womw",
                    "WoahhMghhWoof",
                    "Meo",
                    "Miau",
                    "Meo",
                    "Mow",
                    "Mrrrow",
                    "Hhsss",
                }
            end

            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        lizardAccent = function(text)
            return text:gsub("s+", "sss") -- his -> hisss
                :gsub("S+", "sss") -- hiS -> hiSSS
                :gsub("(%a)x", "%1kss") -- text -> teksst
                :gsub("(%a)X", "%1KSS") -- TEXT -> TEKSST
                :gsub("x", "ecks") -- x -> ecks
                :gsub("X", "ECKS") -- x -> ECKS
        end,
        squeaky = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "Squeaky!",
                    "Squee!",
                    "Squeak!",
                    "Squirk!",
                    "Squeeee!",
                    "Squeaky!",
                    "Piep!",
                    "Chuu!",
                    "Eeee!",
                    "Pip!",
                    "Fwiep!",
                    "Heep!",
                }
            elseif (text:find("?")) then
                list = {
                    "Squeaky?",
                    "Squee?",
                    "Squeak?",
                    "Squirk?",
                    "Squeeee?",
                    "Squeaky?",
                    "Piep?",
                    "Chuu?",
                    "Eeee?",
                    "Pip?",
                    "Fwiep?",
                    "Heep?",
                }
            elseif(text:find(".")) then
                list = {
                    "Squeaky...",
                    "Squee...",
                    "Squeak...",
                    "Squirk...",
                    "Squeeee...",
                    "Squeaky...",
                    "Piep...",
                    "Chuu...",
                    "Eeee...",
                    "Pip...",
                    "Fwiep...",
                    "Heep...",
                }
            else
                list = {
                    "Squeaky",
                    "Squee",
                    "Squeak",
                    "Squirk",
                    "Squeeee",
                    "Squeaky",
                    "Piep",
                    "Chuu",
                    "Eeee",
                    "Pip",
                    "Fwiep",
                    "Heep",
                }
            end

            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        pony = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "Neigh!",
                    "NnneiggGhh!",
                    "Neigghymgh!",
                    "Negghh!",
                    "NeMhhhWgh!",
                    "Ne-Mmm!",
                }
            elseif (text:find("?")) then
                list = {
                    "Neigh?",
                    "NnneiggGhh?",
                    "Neigghymgh?",
                    "Negghh?",
                    "NeMhhhWgh?",
                    "Ne-Mmm?",
                }
            elseif(text:find(".")) then
                list = {
                    "Neigh...",
                    "NnneiggGhh...",
                    "Neigghymgh...",
                    "Negghh...",
                    "NeMhhhWgh...",
                    "Ne-Mmm...",
                }
            else
                list = {
                    "Neigh",
                    "NnneiggGhh",
                    "Neigghymgh",
                    "Negghh",
                    "NeMhhhWgh",
                    "Ne-Mmm",
                }
            end

            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        sheep = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "Baaaah!",
                    "BahMhhbaHh!",
                    "BaaahhGAhh!",
                }
            elseif (text:find("?")) then
                list = {
                    "Baaaah?",
                    "BahMhhbaHh?",
                    "BaaahhGAhh?",
                }
            elseif(text:find(".")) then
                list = {
                    "Baaaah...",
                    "BahMhhbaHh...",
                    "BaaahhGAhh...",
                }
            else
                list = {
                    "Baaaah",
                    "BahMhhbaHh",
                    "BaaahhGAhh",
                }
            end

            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        wawa = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "Wa!",
                    "Wawa!",
                    "Waaaaaa!",
                    "Wa wawa!",
                }
            elseif (text:find("?")) then
                list = {
                    "Wa?",
                    "Wawa?",
                    "Waaaaaa?",
                    "Wa wawa?",
                }
            elseif(text:find(".")) then
                list = {
                    "Wa...",
                    "Wawa...",
                    "Waaaaaa...",
                    "Wa wawa...",
                }
            else
                list = {
                    "Wa",
                    "Wawa",
                    "Waaaaaa",
                    "Wa wawa",
                }
            end

            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        moo = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "Moo!",
                    "MoooUgh!",
                    "MooMHhh!",
                    "MoooGHH!",
                    "MoooooooMhhh!",
                }
            elseif (text:find("?")) then
                list = {
                    "Moo?",
                    "MoooUgh?",
                    "MooMHhh?",
                    "MoooGHH?",
                    "MoooooooMhhh?",
                }
            elseif(text:find(".")) then
                list = {
                    "Moo...",
                    "MoooUgh...",
                    "MooMHhh...",
                    "MoooGHH...",
                    "MoooooooMhhh...",
                }
            else
                list = {
                    "Moo",
                    "MoooUgh",
                    "MooMHhh",
                    "MoooGHH",
                    "MoooooooMhhh",
                }
            end

            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        turkey = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "gubles!",
                    "cutts!",
                    "clucks!",
                    "putts!",
                    "cackles!",
                    "kee-kees!",
                    "yelps!",
                    "gobble!",
                }
            elseif (text:find("?")) then
                list = {
                    "gubles?",
                    "cutts?",
                    "clucks?",
                    "putts?",
                    "cackles?",
                    "kee-kees?",
                    "yelps?",
                    "gobble?",
                }
            else
                list = {
                    "gubles",
                    "cutts",
                    "clucks",
                    "putts",
                    "cackles",
                    "kee-kees",
                    "yelps",
                    "gobble",
                }
            end

            list[#list+1] = "purrs"
            list[#list+1] = "cluck"

            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        slime = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "Blyump!",
                    "Blimpuf!",
                    "Blump!",
                    "Bluuump!",
                    "Blabl blump!",
                }
            elseif (text:find("?")) then
                list = {
                    "Blyump?",
                    "Blimpuf?",
                    "Blump?",
                    "Bluuump?",
                    "Blabl blump?",
                }
            elseif(text:find(".")) then
                list = {
                    "Blyump...",
                    "Blimpuf...",
                    "Blump...",
                    "Bluuump...",
                    "Blabl blump...",
                }
            else
                list = {
                    "Blyump",
                    "Blimpuf",
                    "Blump",
                    "Bluuump",
                    "Blabl blump",
                }
            end

            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        extremeGag = function(text)
            local new_text = text:gsub("[BDKTV]", "Mph")
                :gsub("[bdktv]", "m")
                :gsub("[DJLQR]", "M")
                :gsub("[djlqr]", "ph")
                :gsub("[AEIOU]", "Mph")
                :gsub("[aeiou]", "m")
                :gsub("[CVNY]", "Mh")
                :gsub("[cvny]", "ph")
                :gsub("[WZX]", "Mf")
                :gsub("[wzx]", "f")
                :gsub("S", "h")
                :gsub("s", "m");
            return new_text;
        end,
        severeGag = function(text)
            local new_text = text:gsub("[abjsvz]", "r")
                :gsub("[ABJSVZ]", "R")
                :gsub("[dklv]", "f")
                :gsub("[DKLV]", "F")
                :gsub("[gx]", "n")
                :gsub("[GX]", "N")
                :gsub("[himu]", "d")
                :gsub("[HIMU]", "D")
                :gsub("q", "m")
                :gsub("Q", "M");
            return new_text;
        end,
        looseGag = function(text)
            local new_text = text:gsub("l", "w")
                :gsub("r", "W")
                :gsub("R", "W")
                :gsub("L", "W")
                :gsub("s", "f")
                :gsub("S", "F")
                :gsub("t", "g")
                :gsub("T", "G");
            return new_text;
        end,
    },
    ru = {
        wawa = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "Ва!",
                    "Вава!",
                    "Ваааааа!",
                    "Ва вава!",
                }
            elseif (text:find("?")) then
                list = {
                    "Ва?",
                    "Вава?",
                    "Ваааааа?",
                    "Ва вава?",
                }
            elseif(text:find(".")) then
                list = {
                    "Ва...",
                    "Вава...",
                    "Ваааааа...",
                    "Ва вава...",
                }
            else
                list = {
                    "Ва",
                    "Вава",
                    "Ваааааа",
                    "Ва вава",
                }
            end

            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        slime = function(text)
            local list

            if (text:find("!")) then
                list = {
                    "Блюмп!",
                    "Блимпуф!",
                    "Бламп!",
                    "Блабламп!",
                    "Блааамп!",
                    "Блабл бламп!",
                }
            elseif (text:find("?")) then
                list = {
                    "Блюмп?",
                    "Блимпуф?",
                    "Бламп?",
                    "Блабламп?",
                    "Блааамп?",
                    "Блабл бламп?",
                }
            elseif(text:find(".")) then
                list = {
                    "Блюмп...",
                    "Блимпуф...",
                    "Бламп...",
                    "Блабламп...",
                    "Блааамп...",
                    "Блабл бламп...",
                }
            else
                list = {
                    "Блюмп",
                    "Блимпуф",
                    "Бламп",
                    "Блабламп",
                    "Блааамп",
                    "Блабл бламп",
                }
            end

            local new_text = list[random(1, #list)]
            local first_letter = utf8.sub(text, 1, 1)
            if (utf8.upper(first_letter) == first_letter) then
                return new_text;
            else
                return utf8.lower(new_text);
            end
        end,
        -- WIP
        -- muffledGag = function(text)
        --     local new_word = {"м"}
        --     for i=1, utf8.len(text)-1 do
        --         local v = random()
        --         if v >= 0.3 then
        --             new_word[#new_word+1] = "м"
        --         else
        --             new_word[#new_word+1] = "ф"
        --         end
        --     end
        --     return table.concat(new_word)
        -- end,
        extremeGag = function(text)
            local new_text = utf8.gsub(text, "[БДКТВ]", "Мпф")
            new_text = utf8.gsub(new_text, "[бдктв]", "м")
            new_text = utf8.gsub(new_text, "[ДЖЛКР]", "М")
            new_text = utf8.gsub(new_text, "[джлкр]", "пф")
            new_text = utf8.gsub(new_text, "[АУИОУ]", "Мпф")
            new_text = utf8.gsub(new_text, "[ауиоу]", "м")
            new_text = utf8.gsub(new_text, "[СВНЙ]", "Мх")
            new_text = utf8.gsub(new_text, "[свнй]", "пф")
            new_text = utf8.gsub(new_text, "[ФЗ]", "Мф")
            new_text = utf8.gsub(new_text, "[фз]", "ф")
                :gsub("C", "х")
                :gsub("c", "м");
            return new_text;
        end,
        severeGag = function(text)
            local new_text = utf8.gsub(text, "[абжсвз]", "р")
            new_text = utf8.gsub(new_text, "[АБЖСВЗ]", "Р")
            new_text = utf8.gsub(new_text, "[длв]", "ф")
            new_text = utf8.gsub(new_text, "[ДЛВ]", "Ф")
                :gsub("г", "н")
                :gsub("Г", "Н");
            new_text = utf8.gsub(new_text, "[химу]", "д")
            new_text = utf8.gsub(new_text, "[ХИМУ]", "Д")
                :gsub("к", "м")
                :gsub("К", "М");
            return new_text;
        end,
        looseGag = function(text)
            local new_text = text:gsub("л", "в")
                :gsub("р", "В")
                :gsub("Р", "В")
                :gsub("Л", "В")
                :gsub("с", "ф")
                :gsub("С", "Ф")
                :gsub("т", "ж")
                :gsub("Т", "Ж");
            return new_text;
        end,
    },
}
