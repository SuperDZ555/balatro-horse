SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/brownhorse.lua"))()
    assert(SMODS.load_file("jokers/whitehorse.lua"))()
    assert(SMODS.load_file("jokers/blackhorse.lua"))()
    assert(SMODS.load_file("jokers/skeletonhorse.lua"))()
    assert(SMODS.load_file("jokers/businesshorse.lua"))()
    assert(SMODS.load_file("jokers/flathorse.lua"))()
    assert(SMODS.load_file("jokers/invertedhorse.lua"))()
    assert(SMODS.load_file("jokers/evilhorse.lua"))()
    assert(SMODS.load_file("jokers/zombiehorse.lua"))()
    assert(SMODS.load_file("jokers/flippedhorse.lua"))()
    assert(SMODS.load_file("jokers/horze.lua"))()
    assert(SMODS.load_file("jokers/glasshorse.lua"))()
    assert(SMODS.load_file("jokers/baldhorse.lua"))()
    assert(SMODS.load_file("jokers/appaloosahorse.lua"))()
    assert(SMODS.load_file("jokers/clydesdalehorse.lua"))()
    assert(SMODS.load_file("jokers/flamemarehorse.lua"))()
    assert(SMODS.load_file("jokers/magnifiedhorse.lua"))()
    assert(SMODS.load_file("jokers/demonhorse.lua"))()
    assert(SMODS.load_file("jokers/scribblehorse.lua"))()
    assert(SMODS.load_file("jokers/winterponyhorse.lua"))()
    assert(SMODS.load_file("jokers/hooorse.lua"))()
    assert(SMODS.load_file("jokers/blurryhorse.lua"))()
    assert(SMODS.load_file("jokers/whiteandgoldhorse.lua"))()
    assert(SMODS.load_file("jokers/blackandbluehorse.lua"))()
    assert(SMODS.load_file("jokers/trojanhorse.lua"))()
    assert(SMODS.load_file("jokers/unicorn.lua"))()
    assert(SMODS.load_file("jokers/statuehorse.lua"))()
    assert(SMODS.load_file("jokers/horsepng.lua"))()
    assert(SMODS.load_file("jokers/transhorse.lua"))()
    assert(SMODS.load_file("jokers/pridefulhorse.lua"))()
    assert(SMODS.load_file("jokers/hor.lua"))()
    assert(SMODS.load_file("jokers/eyes.lua"))()
    assert(SMODS.load_file("jokers/glitchedhorse.lua"))()
    assert(SMODS.load_file("jokers/idiothorse.lua"))()
    assert(SMODS.load_file("jokers/honse.lua"))()
    assert(SMODS.load_file("jokers/45angledhorse.lua"))()
    assert(SMODS.load_file("jokers/thehorse.lua"))()
    assert(SMODS.load_file("jokers/bsodhorse.lua"))()
    assert(SMODS.load_file("jokers/statichorse.lua"))()
    assert(SMODS.load_file("jokers/crownedhorse.lua"))()
    assert(SMODS.load_file("jokers/horsecube.lua"))()
    assert(SMODS.load_file("jokers/giraffe.lua"))()
    assert(SMODS.load_file("jokers/deadhorse.lua"))()
    assert(SMODS.load_file("jokers/fauxbrownhorse.lua"))()
    assert(SMODS.load_file("jokers/themareofmaws.lua"))()
    assert(SMODS.load_file("jokers/theartist.lua"))()
    assert(SMODS.load_file("jokers/theshapeshifter.lua"))()
    assert(SMODS.load_file("jokers/thechildofvoid.lua"))()
    assert(SMODS.load_file("jokers/theflower.lua"))()
    assert(SMODS.load_file("jokers/thecreature.lua"))()
    assert(SMODS.load_file("jokers/thesharktailedhorse.lua"))()
	assert(SMODS.load_file("jokers/househorse.lua"))()
    assert(SMODS.load_file("jokers/shyhorse.lua"))()
    assert(SMODS.load_file("jokers/cringehorse.lua"))()
end

--load sounds
assert(SMODS.load_file("sounds.lua"))()
SMODS.ObjectType({
    key = "horse_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "horse_horse_jokers",
    cards = {
        ["j_horse_brownhorse"] = true,
        ["j_horse_whitehorse"] = true,
        ["j_horse_blackhorse"] = true,
        ["j_horse_skeletonhorse"] = true,
        ["j_horse_businesshorse"] = true,
        ["j_horse_flathorse"] = true,
        ["j_horse_invertedhorse"] = true,
        ["j_horse_evilhorse"] = true,
        ["j_horse_zombiehorse"] = true,
        ["j_horse_flippedhorse"] = true,
        ["j_horse_horze"] = true,
        ["j_horse_glasshorse"] = true,
        ["j_horse_baldhorse"] = true,
        ["j_horse_appaloosahorse"] = true,
        ["j_horse_clydesdalehorse"] = true,
        ["j_horse_flamemarehorse"] = true,
        ["j_horse_magnifiedhorse"] = true,
        ["j_horse_demonhorse"] = true,
        ["j_horse_scribblehorse"] = true,
        ["j_horse_winterponyhorse"] = true,
        ["j_horse_hooorse"] = true,
        ["j_horse_blurryhorse"] = true,
        ["j_horse_whiteandgoldhorse"] = true,
        ["j_horse_blackandbluehorse"] = true,
        ["j_horse_unicorn"] = true,
        ["j_horse_statuehorse"] = true,
        ["j_horse_horsepng"] = true,
        ["j_horse_transhorse"] = true,
        ["j_horse_pridefulhorse"] = true,
        ["j_horse_hor"] = true,
        ["j_horse_eyes"] = true,
        ["j_horse_glitchedhorse"] = true,
        ["j_horse_idiothorse"] = true,
        ["j_horse_honse"] = true,
        ["j_horse_45angledhorse"] = true,
        ["j_horse_bsodhorse"] = true,
        ["j_horse_statichorse"] = true,
        ["j_horse_crownedhorse"] = true,
        ["j_horse_horsecube"] = true,
        ["j_horse_giraffe"] = true,
        ["j_horse_deadhorse"] = true,
        ["j_horse_fauxbrownhorse"] = true,
        ["j_horse_househorse"] = true,
        ["j_horse_shyhorse"] = true,
        ["j_horse_cringehorse"] = true
    },
})

SMODS.ObjectType({
    key = "horse_common_horses",
    cards = {
        ["j_horse_brownhorse"] = true,
        ["j_horse_whitehorse"] = true,
        ["j_horse_blackhorse"] = true,
        ["j_horse_businesshorse"] = true,
        ["j_horse_flathorse"] = true,
        ["j_horse_invertedhorse"] = true,
        ["j_horse_evilhorse"] = true,
        ["j_horse_zombiehorse"] = true,
        ["j_horse_flippedhorse"] = true,
        ["j_horse_horze"] = true,
        ["j_horse_glasshorse"] = true,
        ["j_horse_appaloosahorse"] = true,
        ["j_horse_clydesdalehorse"] = true,
        ["j_horse_flamemarehorse"] = true,
        ["j_horse_magnifiedhorse"] = true,
        ["j_horse_demonhorse"] = true,
        ["j_horse_scribblehorse"] = true,
        ["j_horse_winterponyhorse"] = true,
        ["j_horse_hooorse"] = true,
        ["j_horse_blurryhorse"] = true
    },
})

SMODS.ObjectType({
    key = "horse_trojan_horse",
    cards = {
        ["j_horse_trojanhorse"] = true
    },
})

SMODS.ObjectType({
    key = "horse_the_horse",
    cards = {
        ["j_horse_thehorse"] = true
    },
})

SMODS.ObjectType({
    key = "horse_horse_legendaries",
    cards = {
        ["j_horse_themareofmaws"] = true,
        ["j_horse_theartist"] = true,
        ["j_horse_theshapeshifter"] = true,
        ["j_horse_thechildofvoid"] = true,
        ["j_horse_theflower"] = true,
        ["j_horse_thecreature"] = true,
        ["j_horse_thesharktailedhorse"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {},
        post_trigger = true 
    }
end