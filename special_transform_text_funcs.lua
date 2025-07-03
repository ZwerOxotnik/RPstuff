local utf8 = require('utf8/init'):init()


local random = math.random


return {
    en = {
        stutter = function(text, stutterProb, FourProb, ThreeProb, CutProb)
            stutterProb = stutterProb or 0.5
            ThreeProb = ThreeProb or -1
            FourProb = FourProb or -1
            CutProb = CutProb or -1
            local stutter_characters = {
                ["b"] = true,
                ["c"] = true,
                ["d"] = true,
                ["f"] = true,
                ["g"] = true,
                ["h"] = true,
                ["j"] = true,
                ["k"] = true,
                ["l"] = true,
                ["m"] = true,
                ["n"] = true,
                ["p"] = true,
                ["q"] = true,
                ["r"] = true,
                ["s"] = true,
                ["t"] = true,
                ["v"] = true,
                ["w"] = true,
                ["x"] = true,
                ["y"] = true,
                ["z"] = true,
            }

            local splitted_text = {}

            for c in utf8.gmatch(text, '.') do
                if (stutter_characters[c] and random() <= stutterProb) then
                    if (random() <= FourProb) then
                        splitted_text[#splitted_text+1] = c;
                        splitted_text[#splitted_text+1] = "-";
                        splitted_text[#splitted_text+1] = c;
                        splitted_text[#splitted_text+1] = "-";
                        splitted_text[#splitted_text+1] = c;
                        splitted_text[#splitted_text+1] = "-";
                        splitted_text[#splitted_text+1] = c;
                    elseif (random() <= ThreeProb) then
                        splitted_text[#splitted_text+1] = c;
                        splitted_text[#splitted_text+1] = "-";
                        splitted_text[#splitted_text+1] = c;
                        splitted_text[#splitted_text+1] = "-";
                        splitted_text[#splitted_text+1] = c;
                    elseif (random() <= CutProb) then
                        c = "";
                    else
                        splitted_text[#splitted_text+1] = c;
                        splitted_text[#splitted_text+1] = "-";
                        splitted_text[#splitted_text+1] = c;
                    end
                else
                    splitted_text[#splitted_text+1] = c;
                end
            end

            return table.concat(splitted_text)
        end
    }
}
