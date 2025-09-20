local ZALGO_DATA = require("zalgo_data")


local utf8 = require('utf8/init'):init()


local random = math.random


local RPstuff = {
    truth_values = require("truth_values"),
    false_values = require("false_values"),
    transform_text_funcs = require("transform_text_funcs"),
    special_transform_text_funcs = require("special_transform_text_funcs"),
    zalgo_data = ZALGO_DATA,
}


--TODO: recheck
---@param s string
function RPstuff.trim(s)
    return s:match('^%s*(.-)%s*$')
end

---@param text string
---@param random_characters string|string[]
---@param percentage number? # format: x.xx (default: 1)
---@param ignore_characters table<string, any>|string?
---@param maxSequence number?
function RPstuff.ReplaceXcharacters(text, random_characters, percentage, ignore_characters, maxSequence)
    if percentage == nil then percentage = 1 end

    local splitted_text = {}
    for l in utf8.gmatch(text, '.') do splitted_text[#splitted_text+1] = l end

    -- string to table (Perhaps it could be done faster for this function)
    if ignore_characters ~= nil and #ignore_characters == 0 then
        ignore_characters = nil
    elseif type(ignore_characters) == "string" then
        local ignore_characters_table = {}
        for l in utf8.gmatch(ignore_characters, '.') do
            ignore_characters_table[l] = true
        end
        ignore_characters = ignore_characters_table
    end

    -- string to table (Perhaps it could be done faster for this function)
    if random_characters ~= nil and #random_characters == 0 then
        random_characters = nil
    elseif type(random_characters) == "string" then
        local random_characters_table = {}
        for l in utf8.gmatch(random_characters, '.') do
            random_characters_table[#random_characters_table+1] = l
        end
        random_characters = random_characters_table
    end

    local consecutive_replacement = 0
    if ignore_characters then
        for i=1, #splitted_text do
            local letter = splitted_text[i]
            if (not ignore_characters[letter] and percentage >= random()
                and (maxSequence == nil or consecutive_replacement < maxSequence))
            then
                consecutive_replacement = consecutive_replacement + 1
                splitted_text[i] = random_characters[random(1, #random_characters)]
            else
                consecutive_replacement = 0
            end
        end
    else
        for i=1, #splitted_text do
            local letter = splitted_text[i]
            if ((percentage >= random())
                and (maxSequence == nil or consecutive_replacement < maxSequence))
            then
                consecutive_replacement = consecutive_replacement + 1
                splitted_text[i] = random_characters[random(1, #random_characters)]
            else
                consecutive_replacement = 0
            end
        end
    end

    return table.concat(splitted_text)
end


---@param text string
---@param new_characters_map table<string, string|string[]>
---@param maxSequence number?
---@param chance number? # format: x.xx (default: 1)
function RPstuff.replaceCharacters(text, new_characters_map, maxSequence, chance)
    if chance == nil then chance = 1 end
    local splitted_text = {}
    local consecutive_replacement = 0
    for letter in utf8.gmatch(text, '.') do
        local _new_characters = new_characters_map[letter]
        if (_new_characters and (chance >= random())
            and (maxSequence == nil or consecutive_replacement < maxSequence))
        then
            consecutive_replacement = consecutive_replacement + 1
            if type(_new_characters) == "string" then
                splitted_text[#splitted_text+1] = _new_characters
            else
                splitted_text[#splitted_text+1] = _new_characters[random(1, #_new_characters)]
            end
        else
            consecutive_replacement = 0
            splitted_text[#splitted_text+1] = letter
        end
    end

    return table.concat(splitted_text)
end


---@param text string
---@param words_map table<string, string>
function RPstuff.replaceWord(text, words_map)
    local new_text = {}
    local prev_fi, prev_li = 0, 0
    while true do
        local fi, li = string.find(text, "%S+", prev_li+1)
        if fi == nil then
            if prev_fi == 0 then
                new_text[#new_text+1] = string.sub(text, 1, #text)
            end
            break
        elseif prev_fi == 0 and fi ~= 1 then
            new_text[#new_text+1] = string.sub(text, 1, fi-1)
        else
            if prev_li ~= 0 then
                new_text[#new_text+1] = string.sub(text, prev_li+1, fi-1)
            end
        end

        local sliced_text = string.sub(text, fi, li)
        local prev_wli = 0
        while true do
            local wi, wli = string.find(sliced_text, "[^%p]+", prev_wli+1)
            if wi == nil then
                if prev_wli ~= #sliced_text then
                    new_text[#new_text+1] = string.sub(sliced_text, prev_wli+1, #sliced_text)
                end
                break
            end

            if prev_wli == 0 then
                if wi ~= 1 then
                    new_text[#new_text+1] = string.sub(sliced_text, 1, wi-1)
                end
            else
                new_text[#new_text+1] = string.sub(sliced_text, prev_wli+1, wi-1)
            end

            local word = string.sub(sliced_text, wi, wli)
            local new_word = words_map[word] or word
            new_text[#new_text+1] = new_word

            prev_wli = wli
        end

        prev_fi, prev_li = fi, li
    end

    return table.concat(new_text)
end


--- WARNING: WIP
---@param text string
---@param new_words string|string[]
function RPstuff.replaceWords(text, new_words)
    local new_text = {}
    local prev_fi, prev_li = 0, 0
    while true do
        local fi, li = string.find(text, "%S+", prev_li+1)
        if fi == nil then
            if prev_fi == 0 then
                new_text[#new_text+1] = string.sub(text, 1, #text)
            end
            break
        elseif prev_fi == 0 and fi ~= 1 then
            new_text[#new_text+1] = string.sub(text, 1, fi-1)
        else
            if prev_li ~= 0 then
                new_text[#new_text+1] = string.sub(text, prev_li+1, fi-1)
            end
        end

        local sliced_text = string.sub(text, fi, li)
        local prev_wli = 0
        while true do
            local wi, wli = string.find(sliced_text, "[^%p]+", prev_wli+1)
            if wi == nil then
                if prev_wli ~= #sliced_text then
                    new_text[#new_text+1] = string.sub(sliced_text, prev_wli+1, #sliced_text)
                end
                break
            end

            if prev_wli == 0 then
                if wi ~= 1 then
                    new_text[#new_text+1] = string.sub(sliced_text, 1, wi-1)
                end
            else
                new_text[#new_text+1] = string.sub(sliced_text, prev_wli+1, wi-1)
            end

            local word = string.sub(sliced_text, wi, wli)
            local _new_words = new_words[word]
            if _new_words ~= nil then
                if type(_new_words) == "string" then
                    word = _new_words
                else -- table in theory
                    word = _new_words[random(1, #_new_words)]
                end
            end
            new_text[#new_text+1] = new_word

            prev_wli = wli
        end

        prev_fi, prev_li = fi, li
    end

    return table.concat(new_text)
end


---@param text string
function RPstuff.stripNonStandardCharacters(text)
    local new_text = {}

    for w in utf8.gmatch(text, '.') do
        if utf8.codepoint(w, 1, #w) <= 65535 then
            new_text[#new_text+1] = w
        end
    end

    return table.concat(new_text)
end


---@param text string # The string of text which you want to line-wrap
---@param limit integer? #The maximum character interval at which to wrap the lines (Default: 72)
---@param indent string? # Indention string for each line
---@param indentFirst string? # Indention string for the first line only (Default same as indent)
---@param doKeepSpaceFormat boolean?
function RPstuff.textWrap(text, limit, indent, indentFirst, doKeepSpaceFormat)
    limit = limit or 72
    indent = indent or ""
    indentFirst = indentFirst or indent

    if not doKeepSpaceFormat then
        local here = 1 - #indentFirst
        return indentFirst .. text:gsub("(%s+)()(%S+)()",
            function( sp, st, word, fi )
                if fi - here > limit then
                    here = st - #indent
                    return "\n" .. indent .. word
                end
            end
        )
    end

    local new_text = {indentFirst}
    local prev_part_length = 0
    local prev_fi, prev_li = 0, 0
    local fi, li = 0, 0
    local is_last_space = false
    while true do
        local fi, li = string.find(text, "%S+", prev_li+1)
        if fi == nil then
            if prev_fi == 0 then
                new_text[#new_text+1] = string.sub(text, 1, #text)
            end
            break
        end

        local sliced_text = string.sub(text, fi, li)
        local sliced_text_size = utf8.len(sliced_text)
        prev_part_length = prev_part_length + sliced_text_size
        if prev_part_length > limit then
            if is_last_space then
                new_text[#new_text] = nil
                is_last_space = false
            end
            new_text[#new_text+1] = "\n"
            new_text[#new_text+1] = indent
            new_text[#new_text+1] = sliced_text
            if prev_li ~= 0 then
                new_text[#new_text+1] = string.sub(text, prev_li+1, fi-1)
            end

            if prev_part_length ~= sliced_text_size then
                prev_part_length = sliced_text_size
            end
        else
            new_text[#new_text+1] = sliced_text
            if prev_li ~= 0 then
                is_last_space = true
                prev_part_length = prev_part_length + (fi - 1 - prev_li)
                new_text[#new_text+1] = string.sub(text, prev_li+1, fi-1)
            end
        end

        prev_fi, prev_li = fi, li
    end

    return table.concat(new_text)
end


---@param text string
function RPstuff.titleCase(text)
    return string.gsub(text, "(%a)([%w_']*)",
        function(first, rest)
            return utf8.upper(first) .. utf8.lower(rest)
        end
    )
end

---# Checks if the string consists of whitespace characters.
---@param text string
---@return boolean b `true` if the string consists of whitespaces or it's empty.
function RPstuff.isblank(text)
	return string.match(text, "^%s*$") ~= nil
end

--- Converts "1", "true", "on", "yes", "y" and their contraries into real boolean. Case-insensetive.
---@param text string
---@return boolean | nil b Boolean corresponding to the string or nil if casting cannot be done.
function RPstuff.stringToBool(text)
	local lowered = string.lower(text)

	if RPstuff.truth_values[lowered] then return true  end
	if RPstuff.false_values[lowered] then return false end
end

---@param text string
---@param f fun(word: string): string
---@param ... any
function RPstuff.replaceWordsWithFunc(text, f, ...)
    local new_text = {}
    local prev_fi, prev_li = 0, 0
    while true do
        local fi, li = string.find(text, "%S+", prev_li+1)
        if fi == nil then
            if prev_fi == 0 then
                new_text[#new_text+1] = string.sub(text, 1, #text)
            end
            break
        elseif prev_fi == 0 and fi ~= 1 then
            new_text[#new_text+1] = string.sub(text, 1, fi-1)
        else
            if prev_li ~= 0 then
                new_text[#new_text+1] = string.sub(text, prev_li+1, fi-1)
            end
        end

        local sliced_text = string.sub(text, fi, li)
        local prev_wli = 0
        while true do
            local wi, wli = string.find(sliced_text, "[^%p]+", prev_wli+1)
            if wi == nil then
                if prev_wli ~= #sliced_text then
                    new_text[#new_text+1] = string.sub(sliced_text, prev_wli+1, #sliced_text)
                end
                break
            end

            if prev_wli == 0 then
                if wi ~= 1 then
                    new_text[#new_text+1] = string.sub(sliced_text, 1, wi-1)
                end
            else
                new_text[#new_text+1] = string.sub(sliced_text, prev_wli+1, wi-1)
            end

            local word = string.sub(sliced_text, wi, wli)
            local new_word = f(word, ...)
            new_text[#new_text+1] = new_word

            prev_wli = wli
        end

        prev_fi, prev_li = fi, li
    end

    return table.concat(new_text)
end

---@param text string
---@param UpMaxLimit integer
---@param UpMinLimit integer? # Default: 1
---@param MidMaxLimit integer
---@param MidMinLimit integer? # Default: 1
---@param DownMaxLimit integer
---@param DownMinLimit integer? # Default: 1
function RPstuff.zalgo(text, UpMaxLimit, UpMinLimit, MidMaxLimit, MidMinLimit, DownMaxLimit, DownMinLimit)
    local UpMinLimit = UpMinLimit or 1;
    local DownMinLimit = DownMinLimit or 1;
    local MidMinLimit = MidMinLimit or 1;

    local splitted_text = {}
    for l in utf8.gmatch(text, '.') do
        splitted_text[#splitted_text+1] = l
        local chars = RPstuff.zalgo_data.up
        for _=UpMinLimit, random(UpMinLimit, UpMaxLimit) do
            splitted_text[#splitted_text+1] = chars[random(1, #chars)];
        end
        chars = RPstuff.zalgo_data.mid
        for _=MidMinLimit, random(MidMinLimit, MidMaxLimit) do
            splitted_text[#splitted_text+1] = chars[random(1, #chars)];
        end
        chars = RPstuff.zalgo_data.down
        for _=DownMinLimit, random(DownMinLimit, DownMaxLimit) do
            splitted_text[#splitted_text+1] = chars[random(1, #chars)];
        end
    end

    return table.concat(splitted_text);
end

---@param text string
function RPstuff.transform_text_funcs.en.OwOAccent(text)
    local new_text = {}
    local faces = {
        " (•`ω´•)", " ;;w;;", " owo", " UwU", " >w<", " ^w^",
        " ◕w◕", " OwO", " ÓwÓ", " ÕwÕ", " @w@", " σωσ", " OɯO",
        " oʍo", " oᗯo", " ๏w๏",
    }

    local prev_fi, prev_li = 0, 0
    local fi, li = 0, 0
    while true do
        fi, li = string.find(text, "!+", prev_li+1)
        if fi == nil then
            if prev_fi == 0 then
                return text:gsub("[rl]", "w")
                    :gsub("[RL]", "W");
            elseif prev_li ~= #text then
                new_text[#new_text+1] = string.sub(text, prev_li+1, #text)
                    :gsub("[rl]", "w")
                    :gsub("[RL]", "W");
            end
            break
        end

        new_text[#new_text+1] = string.sub(text, prev_li+1, fi-1)
            :gsub("[rl]", "w")
            :gsub("[RL]", "W");
        new_text[#new_text+1] = faces[random(1, #faces)]
        prev_fi, prev_li = fi, li
    end

    new_text = table.concat(new_text);
    -- TODO: improve logic replacement
    return RPstuff.replaceWord(new_text, {
        ["you"] = "wu", ["You"] = "Wu", ["YOU"] = "WU",
        ["fuck"] = "feck", ["Fuck"] = "Feck", ["FUCK"] = "FECK",
        ["fucking"] = "fecking", ["Fucking"] = "Fecking", ["FUCKING"] = "FECKING",
    });
end

---@param text string
function RPstuff.transform_text_funcs.en.ScandinavianAccent(text)
    -- WARNING: I have no idea how it's close to the point
    -- TODO: replace "thank you" to "takk"
    -- TODO: replace "oh my god" to "herregud"
    -- TODO: replace "oh my lord" to "herregud"
    local new_text = RPstuff.replaceWord(text, {
        ["yes"] = "ja", ["yea"] = "ja", 
        ["no"] = "nej",
        ["hell"] = "helvete",
        ["shit"] = "skit",
        ["damn"] = "jävla",
        ["hello"] = "hej", ["hi"] = "hej",
        ["goodbye"] = "ha det",
        ["bye"] = "farvel",
        ["bye-bye"] = "adjø",
        ["music"] = "musik",
        ["thanks"] = "tack",
        ["dumb"] = "dum",
        ["and"] = "og",
        ["north"] = "nord",
        ["south"] = "syd",
        ["east"] = "øst",
        ["coffee"] = "kaffi",
        ["lemon"] = "citron",
        ["lemons"] = "citroner",
        ["fish"] = "fisk",
        ["shark"] = "hakarl",
        ["sharks"] = "hakarlar",
        ["bread"] = "brød",
        ["spider"] = "spindel",
        ["spiders"] = "spindlar",
        ["dwarf"] = "dvärg",
        ["dwarves"] = "dvärgar",
        ["fuck"] = "bork",
        ["fucked"] = "borked",
        ["fucking"] = "borking",
        ["pig"] = "svin",
        ["pigs"] = "svin",
        ["snake"] = "slange",
        ["snakes"] = "slangar",
        ["dragon"] = "drake",
        ["dragons"] = "drakar",
        ["egg"] = "ägg",
        ["eggs"] = "äggen",
    })
    
    new_text = RPstuff.replaceCharacters(new_text, {
        ["W"] = "V",
        ["w"] = "v",
        ["J"] = "Y",
        ["j"] = "y",
    })

    return RPstuff.replaceCharacters(new_text, {
        ["A"] = {"Å", "Ä", "Æ"},
        ["a"] = {"å", "ä", "æ"},
        ["O"] = {"Ö", "Ø"},
        ["o"] = {"ö", "ø"},
    }, 4, 0.5)
end

---@param text string
function RPstuff.transform_text_funcs.ru.OwOAccent(text)
    local new_text = {}
    local faces = {
        " (•`ω´•)", " ;;w;;", " owo", " UwU", " >w<", " ^w^",
        " ◕w◕", " OwO", " ÓwÓ", " ÕwÕ", " @w@", " σωσ", " OɯO",
        " oʍo", " oᗯo", " ๏w๏",
    }

    local prev_fi, prev_li = 0, 0
    local fi, li = 0, 0
    while true do
        fi, li = string.find(text, "!+", prev_li+1)
        if fi == nil then
            if prev_fi == 0 then
                local changed_part = utf8.gsub(text, "[рл]", "в")
                changed_part = utf8.gsub(changed_part, "[РЛ]", "В")
                return changed_part
            elseif prev_li ~= #text then
                local changed_part = string.sub(text, prev_li+1, #text)
                changed_part = utf8.gsub(changed_part, "[рл]", "в")
                changed_part = utf8.gsub(changed_part, "[РЛ]", "В")
                new_text[#new_text+1] = changed_part
            end
            break
        end

        local changed_part = string.sub(text, prev_li+1, fi-1)
        changed_part = utf8.gsub(changed_part, "[рлт]", "в")
        changed_part = utf8.gsub(changed_part, "[РЛТ]", "В")
        new_text[#new_text+1] = changed_part
        new_text[#new_text+1] = faces[random(1, #faces)]
        prev_fi, prev_li = fi, li
    end

    new_text = table.concat(new_text);
    return RPstuff.replaceWord(new_text, {
        ["ах"] = "арф", ["Ах"] = "Арф",
        ["блядь"] = "мяя", ["Блядь"] = "Мяя", ["БЛЯДЬ"] = "МЯЯ!",
        ["сука"] = ">w<", ["Сука"] = ">w<", ["СУКА"] = "๏w๏",
    });
end

---@param text string
function RPstuff.transform_text_funcs.en.barkAccent(text)
    local new_text = {}
    local barks = {
        " Woof!", " WOOF", " wof-wof"
    }

    local prev_fi, prev_li = 0, 0
    local fi, li = 0, 0
    while true do
        fi, li = string.find(text, "!+", prev_li+1)
        if fi == nil then
            if prev_fi == 0 then
                return text:gsub("l", "r")
                    :gsub("L", "R");
            elseif prev_li ~= #text then
                new_text[#new_text+1] = string.sub(text, prev_li+1, #text)
                    :gsub("l", "r")
                    :gsub("L", "R");
            end
            break
        end

        new_text[#new_text+1] = string.sub(text, prev_li+1, fi-1)
            :gsub("l", "r")
            :gsub("L", "R");
        new_text[#new_text+1] = barks[random(1, #barks)]
        prev_fi, prev_li = fi, li
    end

    new_text = table.concat(new_text);
    return RPstuff.replaceWord(new_text, {
        ["ah"] = "arf", ["Ah"] = "Arf",
        ["oh"] = "oof", ["Oh"] = "Oof",
    });
end

---@param text string
function RPstuff.transform_text_funcs.ru.barkAccent(text)
    local new_text = {}
    local barks = {
        " Вуф!", " ВУФ", " вуф-вуф"
    }

    local prev_fi, prev_li = 0, 0
    local fi, li = 0, 0
    while true do
        fi, li = string.find(text, "!+", prev_li+1)
        if fi == nil then
            if prev_fi == 0 then
                return text:gsub("л", "р")
                    :gsub("Л", "Р");
            elseif prev_li ~= #text then
                new_text[#new_text+1] = string.sub(text, prev_li+1, #text)
                    :gsub("л", "р")
                    :gsub("Л", "Р");
            end
            break
        end

        new_text[#new_text+1] = string.sub(text, prev_li+1, fi-1)
            :gsub("л", "р")
            :gsub("Л", "Р");
        new_text[#new_text+1] = barks[random(1, #barks)]
        prev_fi, prev_li = fi, li
    end

    new_text = table.concat(new_text);
    return RPstuff.replaceWord(new_text, {
        ["ах"] = "арф", ["Ах"] = "Арф",
        ["ох"] = "ууф", ["Ох"] = "Ууф",
    });
end

---@param text string
function RPstuff.transform_text_funcs.ru.lizardAccent(text)
    local s = {"cc", "ccc"}
    local big_s = {"CC", "CCC"}
    local h = {"шш", "шшш"}
    local big_h = {"ШШ", "ШШШ"}
    return RPstuff.replaceCharacters(text, {
        ["с"] = s,
        ["c"] = s,
        ["з"] = s,
        ["С"] = big_s,
        ["C"] = big_s,
        ["З"] = big_s,
        ["щ"] = h,
        ["ч"] = h,
        ["Щ"] = big_h,
        ["Ч"] = big_h,
    })
end

-- Returns the Levenshtein distance between the two given strings
---@param str1 string
---@param str2 string
---@return number
function RPstuff.levenshtein(str1, str2)
	local len1 = utf8.len(str1)
	local len2 = utf8.len(str2)
	local matrix = {nil}
	local cost = 0
    local SByte = utf8.byte
	
    -- quick cut-offs to save time
	if (len1 == 0) then
		return len2
	elseif (len2 == 0) then
		return len1
	elseif (str1 == str2) then
		return 0
	end
	
    -- initialise the base matrix values
	for i = 0, len1, 1 do
		matrix[i] = {nil, nil, nil}
		matrix[i][0] = i
	end
	for j = 0, len2, 1 do
		matrix[0][j] = j
	end
	
    -- actual Levenshtein algorithm
	for i = 1, len1, 1 do
		for j = 1, len2, 1 do
			if (SByte(str1, i) == SByte(str2, j)) then
				cost = 0
			else
				cost = 1
			end
			
            local current_row = matrix[i]
            local prev_row = matrix[i-1]
            local v1 = current_row[j-1] + 1
            local v2 = prev_row[j-1] + cost
            if v1 < v2 then
                current_row[j] = v1
            else
                current_row[j] = v2
            end
		end
	end
	
    -- return the last value - this is the Levenshtein distance
	return matrix[len1][len2]
end


return RPstuff
