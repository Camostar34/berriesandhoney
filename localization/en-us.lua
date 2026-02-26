return {
    descriptions = {

        Blind = {
            bl_smsn_mess = {
                name = "The Mess",
                text = {
                    "Oopsie!!",
                }
            },

            bl_smsn_grizzly = {
                name = "The Grizzly",
                text = {
                    "Destroys all consumables",
                    "upon entering the Blind"
                }
            },

            bl_smsn_preserves = {
                name = "The Preserves",
                text = {
                    "Discarded cards are",
                    "returned to your deck"
                }
            },

        },
        

        Edition = {
            e_smsn_redglaze = {
                name = "Strawberry Glazed",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:attention}Removes{} edition",
                    "after scoring",
                }
            },
            e_smsn_blueglaze = {
                name = "Blueberry Glazed",
                text = {
                    "{X:chips,C:white}X#1#{} Chips",
                    "{C:attention}Removes{} edition",
                    "after scoring",
                }
            },
            e_smsn_brownglaze = {
                name = "Maple Glazed",
                text = {
                    "{C:attention}+#1#{} hand size",
                    "{C:attention}Removes{} edition",
                    "after scoring or discard",
                }
            },
            e_smsn_yellowglaze = {
                name = "Lemon Poppy Glazed",
                text = {
                    "Earn {C:money}$#1#{} when",
                    "played and scored",
                    "{C:attention}Removes{} edition",
                    "after scoring",
                }
            },

            e_smsn_orangeglaze = {
                name = "Honey Glazed",
                text = {
                    "Return to hand",
                    "after scoring",
                    "{C:attention}Removes{} edition",
                    "after scoring",
                }
            },

        },
        Back = {
            b_smsn_picnic = {
                name = "Gingham Deck",
                text = {
                    "{C:attention}+#1#{} Consumable slots",
                    "{C:red}#2#{} Joker slot",
                    "{C:dark_edition}Berry Cards{} may",
                    "appear in the shop",
                },
            },
                b_smsn_rokuyo = {
                name = "Rokuyo Deck",
                text = {
                    "{C:green}Listed probabilities{} are",
                    "{C:attention}doubled{} or {C:red}halved{}",
                    "depending on Ante",
                    "and current {C:attention}Blind{}"
                },
            },
             b_smsn_evilegg = {
                name = "Evil Egg Deck",
                text = {
                    "{C:attention}I{} laid this egg",
                    "(Testing for jokers",
                    "with easter egg art)",
                },
            },
            b_smsn_sticky = {
                name = "Sticky Deck",
                text = {
                    "{C:red}#2#{} hand size",
                    "Lose {C:money}$#1#{} when {C:red}discarding{}",
                    "three or more cards",
                    "Start run with",
                    "{C:attention}Beehive{} and {C:attention}Honey Jar{}",
                },
            },
            b_smsn_defunct = {
                name = "Defunct Deck",
                text = {
                    "Start with {C:attention}Rambley The Raccoon{}",
                    "and no face cards in your deck",
                    "Face cards added to deck",
                    "become {C:dark_edition}Holographic{}",
                },
            },
        },

        Sleeve = {
            sleeve_smsn_picnicsleeve = {
                name = "Gingham Sleeve",
                text = {
                    "{C:attention}+2{} Consumable slots",
                    "{C:red}-1{} Joker slot",
                    "{C:dark_edition}Berry Cards{} may",
                    "appear in the shop",
                },
            },
            sleeve_smsn_picnicsleeve_alt = {
                name = "Gingham Sleeve",
                text = {
                    "{C:spectral}Berry{} Cards are",
                    "{C:attention}2x{} more likely to appear{},",
                    "Start with {C:spectral}Retinal Bloom{}",
                },
            },

            sleeve_smsn_stickysleeve = {
                name = "Sticky Sleeve",
                text = {
                    "{C:red}-1{} hand size",
                    "Lose {C:money}$1{} when {C:red}discarding{}",
                    "three or more cards",
                    "Start run with",
                    "{C:attention}Beehive{} and {C:attention}Honey Jar{}",
                },
            },
            sleeve_smsn_stickysleeve_alt = {
                name = "Sticky Sleeve",
                text = {
                    "{C:attention}Honey Jar{}'s denominator is",
                    "halved when a {C:attention}Boss Blind{},",
                    "is defeated",
                    "Start with an",
                    "additional {C:attention}Samson{}",
                },
            },

            sleeve_smsn_defunctsleeve = {
                name = "Defunct Sleeve",
                text = {
                    "Start with {C:attention}Rambley The Raccoon{}",
                    "and no face cards in your deck",
                    "Face cards added to deck",
                    "become {C:dark_edition}Holographic{}",
                },
            },
            sleeve_smsn_defunctsleeve_alt = {
                name = "Defunct Sleeve",
                text = {
                    "Start the run with",
                    "{C:attention}Magic Trick{}",
                    "Face cards added to deck",
                    "become {C:dark_edition}Polychrome{}",
                },
            },
        },

        Joker = {
            j_smsn_samson = {
                name = "Samson",
                text = {
                    "{C:attention}Gold Cards{} return to",
                    "your hand after scoring",
                },
            },

            j_smsn_joylon = {
                name = "Joylon Amurr",
                text = {
                    "{C:attention}Gold Cards{} in hand",
                    "and scored give {C:blue}#1#{} Chips",
                },
            },

            j_smsn_grouphug = {
                name = "Group Hug!!",
                text = {
                    "{C:attention}OC{} and {C:attention}Guest{} Jokers",
                    "from {C:attention}Berries and Honey{}",
                    "each give {C:red}+#1#{} Mult",
                },
            },

            j_smsn_frostingknife = {
                name = "Frosting Knife",
                text = {
                    "Played {C:attention}glazed{} cards",
                    "have a {C:green}#1# in #2#{} chance",
                    "to give an adjacent card the same Glaze",
                },
            },

            j_smsn_doubledipping = {
                name = "Double Dipping",
                text = {
                    "Retrigger all",
                    "{C:attention}Glazed{} cards",
                },
            },

            j_smsn_goldenoreo = {
                name = "Golden Oreo",
                text = {
                    "Earn {C:money}$#1#{} when a",
                    "{C:attention}Cookie{} card is scored",
                },
            },

            j_smsn_honeyslime = {
                name = "Honey Slime",
                text = {
                    "{C:green}#1# in #2#{} chance to add",
                    "a {C:money}Gold Seal{} to first",
                    "played card when a",
                    "{C:negative_edition}Berry Card{} is used",
                },
            },

            j_smsn_goldenslime = {
                name = "{C:edition}Golden Slime{}",
                text = {
                    "Earn {C:money}$#1#{} when a",
                    "{C:attention}consumable{} is used",
                    "{C:green}#2# in #3#{} chance to {C:red}disappear{}",
                    "at the end of the round",
                },
            },

            j_smsn_bash = {
                name = "Bashkelox",
                text = {
                    "{C:attention}x#1#{} Blind requirement",
                    "{C:green}#2# in 2{} chance to {C:red}debuff{} at the end of round",
                    "{C:attention}Resets{} every Ante",
                },
            },

            j_smsn_sytoroonson = {
                name = {
                    'Sytoroonson',
                    '{s:0.75}Comfort Dreamon',
                },
                text = {
                    "Retrigger all cards if",
                    "hand contains a {C:attention}[rank]{} of {C:hearts}Hearts{}",
                    "{C:inactive}(Rank changes every round){}",
                },
            },

            j_smsn_denali = {
                name = "Denali Calvana",
                text = {
                    "{C:red}+#4#{} Mult for every {C:money}Light{} suit {C:inactive}[#1#]{} card in your {C:attention}full deck{}",
                    "{C:red}-#4#{} Mult for every {C:dark_edition}Dark{} suit{C:inactive}[#2#]{} in your {C:attention}full deck{}",
                    "{C:inactive}(Currently{} {C:red}+#3#{} {C:inactive}Mult){}",
                },
            },

            j_smsn_luzia = {
                name = "Luzia Amurr",
                text = {
                    "{C:red}+#4#{} Mult for every {C:dark_edition}Dark{} suit {C:inactive}[#2#]{} card in your {C:attention}full deck{}",
                    "{C:red}-#4#{} Mult for every {C:money}Light{} suit {C:inactive}[#1#]{} in your {C:attention}full deck{}",
                    "{C:inactive}(Currently{} {C:red}+#3#{} {C:inactive}Mult){}",
                },
            },

            j_smsn_rivalshercule = {
                name = "ROA Hercule",
                text = {
                    "Gain {C:attention}+#1#{} hand size when",
                    "a hand is played, {C:red}resets{}",
                    "at the end of the round",
                    "{C:inactive}(Currently {C:attention}+#2#{C:inactive} hand size){}"
                },
            },

            j_smsn_rivalsemmy = {
                name = "ROA Emmy",
                text = {
                    "{C:dark_edition}Berry Card{} effects",
                    "are {C:attention}doubled{}",
                },
            },

            j_smsn_rivalssamson = {
                name = "ROA Samson",
                text = {
                    "If hand contains one single {C:attention}Gold Card{},",
                    "destroy it and turn {C:attention}#1#{}",
                    "cards in hand into Gold Cards",
                },
            },

            j_smsn_hercule = {
                name = "Hercule",
                text = {
                    "Always draws {C:attention}#1#{} extra",
                    "cards when you {C:blue}Play{} or {C:red}Discard{}",
                },
            },

            j_smsn_bountifuljoker = {
                name = "Bountiful Joker",
                text = {
                    "{C:attention}Berry Cards{} in your",
                    "consumable area",
                    "each give {C:red}+#1#{} Mult",
                },
            },



            j_smsn_strawbnyan = {
                name = "Strawbnyan",
                text = {
                    "Using a {C:dark_edition}Berry Card{}",
                    "reduces the Blind requirement",
                    "by {C:attention}#1#%{}",
                },
            },

            j_smsn_berrypicking = {
                name = "Berry Picking",
                text = {
                    "{C:attention}Picnic Packs{} show 1 extra card",
                    "and let you choose 1 extra card",
                },
            },

            j_smsn_cherrybomb = {
                name = "Cherry Bomb",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:green}#2# in #3#{} chance to destroy",
                    "played cards and {C:attention}self destruct{}",
                },
            },

            j_smsn_emmy = {
                name = {
                    'Emmy Bunderbatch',
                    '{s:0.75}Confectionary Witch',
                },
                text = {
                    "Gains {C:red}+#1#{} Mult and {C:blue}+#2#{} Chips",
                    "when a {C:dark_edition}Berry Card{} is used",
                    "{C:inactive}(Currently{} {C:red}+#3#{} {C:inactive}Mult and {C:blue}+#4#{} {C:inactive}Chips){}",
                },
            },

            j_smsn_damacy = {
                name = "Katamari Damacy",
                text = {
                    {
                        "Gain {C:attention}+1{} Joker slot and",
                        "{C:attention}+1{} Consumable slot every",
                        "{C:attention}#1#{} {C:inactive}[#2#]{} rerolls without",
                        "buying a card",
                        "{s:0.7,C:inactive}(Does not reset when a card is bought){}",
                    },

                },
            },

            j_smsn_femtanyl = {
                name = {
                    'KATAMARI',
                    '{s:0.75}by FEMTANYL',
                },
                text = {
                    "{X:mult,C:white}x#1#{} Mult for every",
                    "reroll done this run",
                    "{C:inactive,s:0.8}(Currently {X:mult,C:white}x#2#{}{C:inactive,s:0.8} Mult)",
                },
            },

            j_smsn_piggybank = {
                name = "Piggy Bank",
                text = {
                    "Gain {C:money}$#1#{}",
                    "when a {C:attention}Gold Card{}",
                    "is destroyed",
                },
            },

            j_smsn_koban = {
                name = "Koban",
                text = {
                    "{C:green}+1{} to probabilites",
                    "per {C:attention}#1#{} Gold Cards",
                    "in hand",
                },
            },


            j_smsn_goldenparachute = {
                name = "Golden Parachute",
                text = {
                    "{C:attention}Prevents Death{} if there",
                    "is at least one {C:attention}Gold Card{}",
                    "in hand, then destroys all",
                    "{C:attention}Gold Cards{} in your full deck",
                },
            },

            j_smsn_goldentooth = {
                name = "Golden Tooth",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a {C:attention}Gold Card{} when purchasing",
                    "an item from the shop",
                },
            },

            j_smsn_hunnabee = {
                name = "Hunnabee",
                text = {
                    "Create {C:attention}#1#{} Gold Cards",
                    "when a Face card",
                    "is destoryed",
                },
            },

            j_smsn_golddigger = {
                name = "Gold Digger",
                text = {
                    "Earn {C:money}$#1#{} when",
                    "a [rank] of [suit]",
                    "is scored",
                    "{C:inactive}(Card changes every round){}",
                },
            },


            j_smsn_chamoille = {
                name = "Honey Chamoille Tea",
                text = {
                    "{C:attention}Gold Cards{} cannot",
                    "be debuffed",
                },
            },

            j_smsn_honeybutterchips = {
                name = "Honey Butter Chips",
                text = {
                    "The first {C:attention}Gold Card{} scored",
                    "gives {X:blue,C:white}X#1#{} Chips",
                    "loses {X:blue,C:white}X#2#{} Chips when activated",
                },
            },

            j_smsn_fortunecookie = {
                name = "Fortune Cookie",
                text = {
                    "Earn {C:money}$#1#{} at the end of round",
                    "Payout decreases by {C:red}$#2#{} when activated",
                    "Gain {C:purple}The Devil{} when depleted",
                },
            },

            j_smsn_gardener = {
                name = "Gardener",
                text = {
                    "Creates a {C:dark_edition}Berry Card{}",
                    "Every {C:attention}#1#{} {C:inactive}[#2#]{} hands played",
                    "{C:inactive,s:0.8}(Must have room)",
                },
            },

            j_smsn_mintjams = {
                name = {
                    'Mint Jams',
                    '{s:0.75}By Casiopea',
                },
                text = {
                    "Scored cards without a {C:attention}modifier{} have a",
                    "{C:green}#1# in #2#{} chance to create a {C:dark_edition}Berry Card{}",
                    "Consumed if a modified card is scored",
                    "{C:inactive,s:0.8}(Must have room)",
                },
            },

            j_smsn_pepperjelly = {
                name = "Ghost Pepper Jelly",
                text = {
                    "{C:dark_edition}Berry Cards{} held in your consumables",
                    "give {X:mult,C:white}x#1#{} Mult",
                    "{C:green}#2# in #3#{} chance to destroy",
                    "a berry when activated",
                },
            },

            j_smsn_spooky = {
                name = "Ghost Pepper Jelly",
                text = {
                    "Sell this card to create",
                    "2 Negative {C:dark_edition}Berry Cards{}.",
                    "{C:inactive,s:0.8}(Must have room)",
                },
            },

            j_smsn_razzby = {
                name = "Black Razzby",
                text = {
                    "Create a {C:dark_edition}Negative Berry Card{}",
                    "when a Joker is {C:attention}sold{} or {C:attention}destoryed{}",
                },
            },

            j_smsn_strabby = {
                name = "Strabby",
                text = {
                    "Gains {X:mult,C:white}x#1#{} Mult when using",
                    "a {C:dark_edition}Berry Card{}, then has a",
                    "{C:green}#2# in #3#{} chance to destroy a random Joker",
                    "{C:red}self-destructs{} if no Jokers avaliable",
                    "{C:inactive,s:0.8}(Currently {X:mult,C:white}x#2#{}{C:inactive,s:0.8} Mult)",

                },
            },

            j_smsn_honeyjar = {
                name = "Honey Jar",
                text = {
                    "{C:green}#1# in #2#{} chance to turn all scoring",
                    "cards into {C:attention}Gold Cards{}",
                    "Denominator {C:attention}increases{} with every hand",
                },
            },

            j_smsn_honeyqueen = {
                name = "Honey Queen",
                text = {
                    "Retrigger all {C:attention}Queens{}",
                    "per {C:attention}Gold Cards{}",
                    "held in hand",
                },
            },

            j_smsn_donuts = {
                name = "Box of Donuts",
                text = {
                    "{C:attention}Glazed{} cards will not lose their editions",
                    "Expires after {C:attention}#1#{} hands",
                },
            },

            j_smsn_ginghamjoker = {
                name = "Gingham Joker",
                text = {
                    "{C:attention}Gingham Cards{} are considered Wild Cards",
                    "and cannot be {C:attention}debuffed{}",
                },
            },

            j_smsn_cookiemonster = {
                name = "Cookie Monster",
                text = {
                    "Gains {X:chips,C:white}x#1#{} Chips when a",
                    "{C:attention}Cookie Card{} is destroyed",
                },
            },

            j_smsn_cookiejar = {
                name = "Cookie Jar",
                text = {
                    "Add a {C:attention}Cookie Card{} to your hand",
                    "at the beginning of the round",
                    "Depleted after {C:attention}#1#{} rounds",
                },
            },

            j_smsn_commonrambley = {
                name = "Rambley Railroad",
                text = {
                    "Create a {C:dark_edition}Rambleberry{} if hand contains",
                    "a {C:attention}face card{} and a {C:attention}Straight{}",
                },
            },

            j_smsn_uncommonrambley = {
                name = "Rambleberry RFRSHR",
                text = {
                    "Click to pay {C:money}$5{} and create",
                    "a {C:dark_edition}Rambleberry{}.",
                    "{C:inactive}Usable once per Ante; refills each Ante.{}",
                },
            },

            j_smsn_rarerambley = {
                name = "Retro Rambley",
                text = {
                    "Creates a {C:dark_edition}Rambleberry{}",
                    "when a {C:attention}booster pack{}",
                    "is opened",
                    "{C:inactive,s:0.8}(Must have room)",
                },
            },

            j_smsn_legendaryrambley = {
                name = "Rambley The Raccoon",
                text = {
                    "Has the combined effects of all",
                    "{C:purple}Rambley{} Jokers from this mod",
                    "Balances {C:purple}#1#%{} of {C:blue}Chips{} and {C:red}Mult{}",
                    "Increases by {C:attention}#2#%{} when a {C:dark_edition}Rambleberry{} is used",
                },
            },

            j_smsn_rambleydumpy = {
                name = "Rambley Dumpy",
                text = {
                    "Will Save You",
                },
            },

            j_smsn_littlelad = {
                name = "Little Lad",
                text = {
                    "Stores effects when a scoring",
                    "{C:dark_edition}Berry Card{} is used",
                    "{C:inactive,s:0.8}(Currently {C:blue}+#1#{C:inactive,s:0.8} Chips, {C:red}+#2#{C:inactive,s:0.8} Mult, and {X:mult,C:white}x#3#{C:inactive,s:0.8} Mult)",
                },
            },

            j_smsn_paddington = {
                name = "Paddington Bear",
                text = {
                    "{C:white,X:mult}X#1#{} Mult, gains {C:white,X:mult}X#2#{} Mult",
                    "when hand is played for",
                    "each card with {C:diamonds}Diamonds{}",
                    "suit held in hand"
                },
            },

            j_smsn_marmalade = {
                name = "Marmalade Sandwich",
                text = {
                    "{C:diamonds}Diamond{} cards held in hand",
                    "permamently gain {C:red}+#1#{} Mult",
                    "Eaten if a played hand leaves you",
                    "with no {C:diamonds}Diamond{} cards in hand",
                },
            },

            j_smsn_bumbling = {
                name = "Bumbling Joker",
                text = {
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Honeypot{}"
                }
            },

            j_smsn_stingy = {
                name = "Stingy Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}Honeypot{}"
                }
            },

            j_smsn_colony = {
                name = "The Colony",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Honeypot{}"
                }
            },

            j_smsn_meltingpot = {
                name = "Melting Pot",
                text = {
                    "{C:attention}Honeypot{} hands can be",
                    "made with {C:money}Gold Seals{}",
                    "and {C:attention}Honey Glaze{}"
                }
            },

            j_smsn_meadbarrel = {
                name = "Mead Barrel",
                text = {
                    "{C:attention}Gold Card{} values are doubled",
                    "Earn no {C:attention}Interest{}",
                }
            },

            j_smsn_apiary = {
                name = "Apiary",
                text = {
                    "{C:attention}Gold Cards{} give money",
                    "when {C:attention}drawn{} instead",
                    "at the end of the round"
                }
            },

            j_smsn_workerbee = {
                name = "Worker Bee",
                text = {
                    "{C:attention}6{}s are considered",
                    "{C:attention}Gold Cards{}",
                }
            },

            j_smsn_beebear = {
                name = "Bee Bear",
                text = {
                    "When a {C:attention}Gold Cards{} is activated",
                    "destory it and permamently gain",
                    "{C:mult}+#1#{} Mult",
                    "{C:inactive,s:0.8}(Currently {C:mult}+#2#{}{C:inactive,s:0.8} Mult)",
                }
            },

            j_smsn_lasthoneyjoker = {
                name = "idk yet",
                text = {
                    "i dont know but i just want an even number",
                },
            },

            j_smsn_crystalized = {
                name = "Crystalized Honey",
                text = {
                    "{C:money}Gold Cards{} give {C:chips}+#1#{} Chips",
                    "per {C:money}$#2#{} you have",
                    "{C:inactive,s:0.8}(Currently {C:chips}+#3#{}{C:inactive,s:0.8} Chips)",
                }
            },

            j_smsn_bearclaws = {
                name = "Bear Claws",
                text = {
                    ":3",
                }
            },

            j_smsn_honeycombtoffee = {
                name = "Honeycomb Toffee",
                text = {
                    "Scored {C:attention}Gold Cards{} are treated",
                    "as {C:attention}Glass Cards{}",
                    "But are {C:green}twice as likely{} to break",
                },
            },

            j_smsn_americanbrunch = {
                name = {
                    'American Brunch',
                    '{s:0.75}By The Buttertones',
                },
                text = {
                    "If first hand of a round",
                    "contains an {C:attention}unscored{} card",
                    "destroy it and gain {C:attention}#1#{}",
                    "{C:dark_edition}Berry Cards{}",
                    "{C:inactive,s:0.8}(Must have room)",
                },
            },

            j_smsn_teteatete = {
                name = {
                    'tete-a-tete',
                    '{s:0.75}By OSTER Project',
                },
                text = {
                    "{C:attention}Pairs{} can be made with",
                    "any 2 {C:attention}Face Cards{}"

                },
            },


            j_smsn_hothoney = {
                name = "Hot Honey",
                text = {
                    "Scored {C:attention}Gold Cards{} permanetly gain {X:mult,C:white}x#1#{} Mult",
                    "but lose {C:money}$#2#{} of held in hand value",
                },
            },

            j_smsn_boykisser = {
                name = "Boykisser",
                text = {
                    "Scored {C:attention}Kings{} and {C:attention}Jacks{}",
                    "permamently gain {C:red}+#1#{} Mult",
                },
            },

            j_smsn_glazer = {
                name = "Boykisser",
                text = {
                    "Scored {C:attention}Kings{} and {C:attention}Jacks{}",
                    "permamently gain {C:red}+#1#{} Mult",
                },
            },

            j_smsn_strawberrygirl = {
                name = {
                    'Strawberry Girl',
                    '{s:0.75}By Odyssey Eurobeat',
                },
                text = {
                    "Create a {C:dark_edition}Strawberry{}",
                    "when a {C:hearts}Heart Flush{}",
                    "is played",
                },
            },

            j_smsn_mycom = {
                name = {
                    'MYCOM MAIM MARIONETTE',
                    '{s:0.75}By Kidorikko',
                },
                text = {
                    "Gains {X:mult,C:white}x#1#{} when a hand is played",
                    "containing an {C:attention}unscored{} card",
                    "{C:attention}Resets{} on discard",
                    "{C:inactive,s:0.8}(Currently {X:mult,C:white}x#2#{C:inactive,s:0.8} Mult)",
                },
            },


            j_smsn_bambi = {
                name = {
                    'BAMBI',
                    '{s:0.75}By STOMACH BOOK',
                },
                text = {
                    "Destroy the first card scored",
                    "if a {C:dark_edition}Negative Berry Card{}",
                    "was consumed this hand",
                    "{s:0.75,E:1,C:inactive}What a merry way to rot~!"

                },
            },

            j_smsn_robotface = {
                name = {
                    'Robot Face',
                    '{s:0.75}By Caravan Palace',
                },
                text = {
                    "Scored {C:attention}Face Cards{} have a {C:green}#1# in #2#{} chance",
                    "to become a {C:attention}Steel Card{}",
                },
            },

            j_smsn_beehive = {
                name = "Beehive",
                text = {
                    "Activated {C:attention}Gold Cards{} permamently gain {C:money}$#1#{}",
                    "of held in hand value",
                    "at the end of the round",
                },
            },

            j_smsn_allberries = {
                name = "Oops! All Berries",
                text = {
                    "The shop is {C:attention}Guarnteed{}",
                    "to contain a {C:dark_edition}Mega Picnic Pack{}",
                    "{C:inactive,s:0.8}(Have we come full circle?)",
                },
            },

            j_smsn_airfreshener = {
                name = "Air Freshener",
                text = {
                    "Create #1# {C:dark_edition}Berry Cards{}",
                    " when {C:attention}Small Blind{}",
                    "is selected",
                    "{C:inactive,s:0.8}(Must have room)",
                },
            },

            j_smsn_dieting = {
                name = "Dieting Joker",
                text = {
                    "{C:blue}+#1#{} Chips per",
                    "per item in your",
                    "consumable area,",
                },
            },

            j_smsn_weightlossshake = {
                name = "Weight Loss Shake",
                text = {
                    "{C:green}+#1#{} to all",
                    "listed proabilities",
                    "{C:red}-1{} when a {C:attention}consumable{}",
                    "is used",
                },
            },

            j_smsn_memory = {
                name = "Memory of Apprenticeship",
                text = {
                    "Create a {C:dark_edition}Negative Berry Card{}",
                    "when {C:attention}#1#{} or more face",
                    "cards are discarded",
                },
            },
            j_smsn_memory_active = {
                name = "Memory of Apprenticeship",
                text = {
                    "Create a {C:dark_edition}Negative Berry Card{}",
                    "when {C:attention}#1#{} or more face",
                    "cards are discarded",
                    "{C:inactive,E:smsn_shaking}Why don't you remember her face?!?!?{}",
                },
            },

            j_smsn_twistedgarden = {
                name = "Twisted  Garden",
                text = {
                    "All {C:dark_edition}Berry Cards{}",
                    "added to your consumables",
                    "become {C:dark_edition}Negative{}",
                },
            },

            j_smsn_calvana = {
                name = "Calvana Family",
                text = {
                    "Retrigger a {C:attention}Three of a Kind{}",
                    "if the hand contains one",
                },
            },



            j_smsn_coughdrops = {
                name = "Honey Cough Drops",
                text = {
                    "When round begins, add a random",
                    "{C:attention}Gold{} playing card to your hand",
                    "Eaten if money exceeds {C:money}$#1#{}",
                },
            },

            j_smsn_chantilly = {
                name = "Chantilly Cake",
                text = {
                    "Gives {X:mult,C:white}xMult{} for",
                    "number of unique",
                    "{C:attention}Consumable types{}",
                    "in your Consumable area"
                },
            },

            j_smsn_fruitsando = {
                name = "Fruit Sando",
                text = {
                    "{C:dark_edition}Berry Cards{} held in your",
                    "consumables give {X:chips,C:white}x#1#{} Chips",
                    "{C:green}#2# in #3#{} chance to be {C:attention}eaten{} when",
                    "a berry is sold or activated"
                },
            },

            j_smsn_secondhelping = {
                name = "Second Helping",
                text = {
                    "{C:dark_edition}Berry Cards{} have a",
                    "{C:green}#1# in #2#{} chance to",
                    "trigger {C:attention}twice{}",



                },
            },


            j_smsn_flowworm = {
                name = "Flow Worm",
                text = {
                    "Retrigger every {C:attention}seventh{} scored card",
                    "{C:green}#1# in #2#{} chance to upgrade",
                    "at end of round",
                },
            },

            j_smsn_negativeflowworm = {
                name = "Flow Worm (Backlight)",
                text = {
                    "Every {C:attention}seventh{} card",
                    "discarded becomes {C:dark_edition}Negative{}",
                    "{C:attention}Reverts{} at end of round",
                },
            },

            j_smsn_keepyapping = {
                name = "Keep Yapping Your Mouth Buddy",
                text = {
                    "{C:red}+#1#{} Mult per",
                    "{C:attention}character{} in Boss Blind",
                    "description"
                },
            },

            j_smsn_tamago = {
                name = "Tamago Sando",
                text = {
                    "{C:diamonds}Diamond{} suits held",
                    "in hand give {C:money}$#1#{} each",
                    "{C:attention}Eaten{} if hand is played",
                    "without holding any {C:diamonds}Diamond{} suits",
                },
            },

            j_smsn_grilledcheese = {
                name = "Grilled Cheese",
                text = {
                    "{C:spades}Spade{} suits held",
                    "in hand give {C:red}+#1#{} Mult each",
                    "{C:attention}Eaten{} if hand is played",
                    "without holding any {C:spades}Spade{} suits",
                },
            },

            j_smsn_clubsandwich = {
                name = "Club Sandwich",
                text = {
                    "{C:clubs}Club{} suits held",
                    "in hand give {C:blue}+#1#{} Chips each",
                    "{C:attention}Eaten{} if hand is played",
                    "without holding any {C:clubs}Club{} suits",
                },
            },

            j_smsn_ruben = {
                name = "Ruben Sandwich",
                text = {
                    "{C:hearts}Heart{} suits held",
                    "in hand give {X:mult,C:white}x#1#{} Mult each",
                    "{C:attention}Eaten{} if hand is played",
                    "without holding any {C:hearts}Heart{} suits",
                },
            },

            j_smsn_cannery = {
                name = "Cannery",
                text = {
                    "Discarded cards have a",
                    "{C:green}#1# in #2#{} chance to",
                    "gain a {C:blue}Freshness Seal{}",



                },
            },

            j_smsn_cookiemonster = {
                name = "Cookie Monster",
                text = {
                    "{C:green}#3# in #4#{} chance to {C:red}destroy{}",
                    "played {C:attention}Cookie{} cards",
                    "Gains {C:white,X:chips}X#1#{} Chips when a",
                    "{C:attention}Cookie{} card is {C:red}destroyed{}",
                    "{C:inactive}(Currently {C:white,X:chips}X#2#{C:inactive} Chips){}"
                },
            },

            j_smsn_peanutbutter = {
                name = "Peanut Butter",
                text = {
                    "Cards return to your hand after scoring",
                    "Consumed after {C:attention}#1#{} hands",
                },
            },

            j_smsn_peoplepleaser = {
                name = "People Pleaser",
                text = {
                    "Face cards gain random",
                    "{C:attention}Glazes{} after scoring",
                },
            },

            j_smsn_crazyglazer = {
                name = "Crazy Glazer",
                text = {
                    "Cards drawn during a round",
                    "have a {C:green}#1# in #2#{} chance",
                    "to gain a random {C:attention}Glaze{}"
                },
            },


            j_smsn_commonrambley = {
                name = "Rambley Railroad",
                text = {
                    "Create a {C:dark_edition}Rambleberry{} if hand contains",
                    "a {C:attention}face card{} and a {C:attention}Straight{}",
                },
            },

            j_smsn_fireblanket = {
                name = "Fire Blanket",
                text = {
                    "{C:attention}Gingham Cards{} have a {C:green}#1# in #2#{}",
                    "chance to give {X:mult,C:white}xMult{}",
                    "for every unique suit in hand",
                },
            },

            j_smsn_mouse = {
                name = "Mouse Joker",
                text = {
                    "When you {C:red}discard{} a",
                    "single {C:attention}Gold{} card, remove",
                    "its {C:attention}Enhancement{} and",
                    "earn {C:attention}double{} its held",
                    "in hand value",
                },
            },

            j_smsn_muffintray = {
                name = "Muffin Tray",
                text = {
                    "Trigger all {C:attention}Bonus Cards{}",
                    "and {C:attention}Mult Cards{}",
                    "held in hand",

                }

            },

            j_smsn_compost = {
                name = "Compost Bin",
                text = {
                    "This Joker gains {C:gold}$#1#{} of",
                    "sell value every #2#",
                    "{C:dark_edition}Berry Cards{} sold",
                },
            },

            j_smsn_manicface = {
                name = "Manic Face",
                text = {
                    "Played {C:attention}face{} cards give",
                    "{E:smsn_glitching,C:attention}someth{} when scored",
                },
            },

            j_smsn_berryboy = {
                name = "Berryboy Joker",
                text = {
                    "Creates a {C:purple}Death{} or",
                    "{C:purple}Hanged Man{} Tarot when",
                    "a {C:negative_edition}Berry Card{} is sold"
                },
            },



            j_smsn_sticker = {
                name = "Scented Sticker",
                text = {
                    "Retrigger a played card with a {C:attention}seal{}",
                    "per the amount of",
                    "{C:dark_edition}Berry Cards{} you own",
                },
            },


            j_smsn_hamtaro = {
                name = "Hamtaro",
                text = {
                    "Earn {C:money}$#1#{} for",
                    "every card {C:attention}held in hand{}",
                    "at the end of the round",
                },
            },

            j_smsn_stilton = {
                name = "Geronimo Stilton",
                text = {
                    "Create a {C:purple}Tarot{} Card",
                    "when a {C:money}Gold Seal{}",
                    "is scored",
                },
            },

            j_smsn_pooh = {
                name = "Winnie The Pooh",
                text = {
                    "Gain {C:money}$3{} when-",
                    "Wait, where is he??",
                    "{s:1.2,E:1}     Oh Bother...{}     ",
                },
            },

            j_smsn_pipingbag = {
                name = "Piping Bag",
                text = {
                    "[Suit] are shuffled",
                    "to the {C:attention}top{} of your deck",
                    "{C:inactive}(Suit changes at the end of round){}",
                },
            },

            -- CROSSMOD JOKERS

            j_smsn_microplastics = {
                name = "Full of Microplastics",
                text = {
                    "Create 1 {C:dark_edition}Berry Card{} per",
                    "{C:nflame_silicon}Silicon{} card owned",
                    "when a {C:attention}Boss Blind{} is selected",
                    "{C:inactive,s:0.8}(Does not have to have room)",
                },
            },

            j_smsn_secretsamson = {
                name = "Full of Microplastics",
                text = {
                    "Create 1 {C:dark_edition}Berry Card{} per",
                    "{C:nflame_silicon}Silicon{} card owned",
                    "when a {C:attention}Boss Blind{} is selected",
                    "{C:inactive,s:0.8}(Does not have to have room)",
                },
            },

            j_smsn_tasteful = {
                name = "Tasteful Joker",
                text = {
                    "{C:attention}+#1#{} hand size if",
                    "a hand containing",
                    "a {C:attention}#2#{}",
                    "was played this round"
                }
            },

            j_smsn_grenade = {
                name = "Flash Grenade",
                text = {
                    "Playing a {C:attention}Flash{}",
                    "counts as your",
                    "{C:attention}most played Poker Hand{}",
                    "{C:inactive,s:0.8}(Usable once per round)",
                },
            },

            j_smsn_jollysappy = {
                name = "Jolly Sappy",
                text = {
                    "{s:4}pair{}",
                },
            },

            j_smsn_rabbicksappy = {
                name = "Rabbick Sappy",
                text = {
                    "Retrigger a {C:attention}Rouxles Karrd{}",
                    "of a {C:clubs}Clubs{} suit",
                },
            },

            j_smsn_evilsappy = {
                name = "Evil Sappy (Yappy)",
                text = {
                    "{X:mult,C:white}x#1#{} Mult",
                    "Gains {X:mult,C:white}x#2#{} per card scored",
                    "with a {C:attention}Permament Bonus{}",
                    "then removes card bonuses",


                },
            },


            j_smsn_papersappy = {
                name = "Paper Sappy",
                text = {
                    "After {C:attention}#1#{} rounds,",
                    "Sell this card to replenish",
                    "your {C:blue}Hands{} and {C:red}Discards{}",
                    "and reduce Blind size by {C:attention}#2#%{}",
                    "{C:inactive}(#3# / #1#)"
                },
            },

            j_smsn_nostalgicsappy = {
                name = "Nostalgic Sappy",
                text = {
                    "",
                },
            },

            j_smsn_thegoteam = {
                name = {
                    'Thunder, Lightning, Strike!!',
                    '{s:0.75}By The Go! Team',
                },
                text = {
                    "{C:red}+#1#{} Mult and {C:money}$#2#{}",
                    "if hand contains a {C:attention}Flash{}",
                    "and a {C:attention}Queen{}",
                },
            },

            j_smsn_kuchinohanabi = {
                name = {
                    'Kuchinohanabi',
                    '{s:0.75}By Hakushi Hasegawa',
                },
                text = {
                    "Earn {C:money}$#1#{} if {C:attention}Flash{}",
                    "was the only hand type",
                    "played this round",
                },
            },

            j_smsn_gushers = {
                name = "Gushers",
                text = {
                    "Create a {C:dark_edition}Berry Card{}",
                    "when a {C:attention}Flash{}",
                    "is played",
                    "Consumed in #1# rounds",
                },
            },

            j_smsn_thunderstorm = {
                name = "Stormcloud",
                text = {
                    "The first {C:attention}Flash{}",
                    "of the round",
                    "gives {X:chips,C:white}X#1#{} Chips",
                },
            },
            j_smsn_evilflashcard = {
                name = "'Flash' Card",
                text = {
                    "Huh??????????",
                },
            },
            -- GUEST JOKERS

            j_smsn_peapod = {
                name = "Pea Pod",
                text = {
                    {
                        "Steals a random {C:attention}Consumable{}",
                        "at end of round, gains {C:blue}+#1#{} Chips",
                        "for every stolen consumable",
                        "{C:inactive}(Currently{} {C:blue}+#2#{} {C:inactive}Chips){}",
                    },
                },
            },

            j_smsn_puddinhg = {
                name = "Puddinhg",
                text = {
                    {
                        "Earn {C:money}$#1#{} at the end of round",
                        "per {C:dark_edition}Strawberry{} used this run",
                        "{C:inactive,s:0.8}(Currently {C:money}$#2#{}{C:inactive,s:0.8})",
                    },
                },
            },

            j_smsn_cassknows = {
                name = "Cassknows",
                text = {
                    {
                        "Glazed Cards",
                        "have {C:attention}x#1#{} value",
                        "but are destroyed when their",
                        "edition is removed",
                    },
                },
            },

            j_smsn_buttercream = {
                name = "Buttercream Sundae",
                text = {
                    {
                        "{C:attention}Glazed Cards{} change",
                        "{C:attention}flavours{} instead of losing",
                        "their {C:attention}Glazes{} when used",
                    },
                },
            },

            j_smsn_shadow = {
                name = "Shadow Wizard",
                text = {
                    {
                        "",
                    },
                },
            },

            j_smsn_rose = {
                name = "Rose",
                text = {
                    {
                        "{C:red}Debuffs{} all face cards",
                        "{C:red}+#1#{} Mult for every face",
                        "card in your {C:attention}full deck{}",
                        "{C:inactive,s:0.8}(Currently {C:red}+#2#{C:inactive,s:0.8} Mult)",
                    },
                },
            },

            j_smsn_cheese = {
                name = "Cheese & Jeremy",
                text = {
                    {
                        "If played hand contains a",
                        "{C:attention}Gold Card{}, destroy it and upgrade",
                        "{C:attention}poker hand{} per cards destroyed",

                    },
                },
            },

            j_smsn_jadepenguin = {
                name = "Jade Penguin",
                text = {
                    "When {C:attention}#1#{} or more cards",
                    "are {C:red}discarded{} at once,",
                    "{C:green}#2# in #3#{} chance to {C:red}destroy{}",
                    "a discarded card and give {C:money}$#4#{}"
                },
            },

            j_smsn_pedro = {
                name = {
                    'Pedro Pavé',
                    '{s:0.75}The Pipedream Painter',
                },
                text = {
                    {
                        "",
                    },
                },
            },

            j_smsn_cozy = {
                name = "Cozy Fluffer Snugglepaws",
                text = {
                    {
                        "",
                    },
                },
            },

            j_smsn_ruby = {
                name = {
                    'Ruby',
                    '{s:0.75}Lord of Hope',
                },
                text = {
                    {
                        "Create a {C:spectral}Spectral{} card",
                        "on your {C:attention}final hand{}",
                        "with {C:attention}0{} discards remaining",
                    },
                },
            },

            j_smsn_astro = {
                name = "Astro",
                text = {
                    {
                        "Adjacent Jokers that give {C:red}+Mult{} also give",
                        "{C:chips}#1#x{} that amount in Chips; those that give",
                        "{X:mult,C:white}XMult{} also multiply Chips by",
                        "{X:chips,C:white}X#2#{} of that value.",
                        "{C:inactive,s:0.8}(xMult must be greater than 1)",
                    },
                },
            },

            j_smsn_ghost = {
                name = "Ghost",
                text = {
                    {
                        "If hand contains an",
                        "{C:attention}unscoring{} card, {C:red}destroy{}",
                        "one and create a {C:attention}Boo Berry{}",
                        "or a {C:attention}Franken Berry{}",
                        "{C:inactive}(Must have room){}"
                    },
                },
            },

            j_smsn_gordon = {
                name = "Gordon",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} Mult if played hand contains",
                        "only {C:diamonds}Diamonds{} and {C:spades}Spades{}",
                    },
                },
            },

            j_smsn_sappy = {
                name = "Sappy",
                text = {
                    {
                        "Draw an extra card per",
                        "{C:diamonds}Diamonds{} or {C:money}Gold Seals{}",
                        "scored the previous hand",
                    },
                },
            },
        },
        Planet = {
            c_smsn_honeyhive = {
                name = "Honeyhive Galaxy"
            }
        },

        Spectral = {
            c_smsn_retinalbloom = {
                name = "Retinal Bloom",
                text = {
                    "Add a {C:blue}Freshness Seal{}",
                    "to {C:attention}1{} selected",
                    "card in your hand",
                },
            },
        },

        Enhanced = {
            m_smsn_gingham = {
                name = "Gingham Card",
                text = {
                    "{C:red}+#1#{} Mult per {C:attention}unique{}",
                    "suit scored this hand",
                }
            },

            m_smsn_cookie = {
                name = "Cookie Card",
                text = {
                    "{C:blue}+#1#{} Chips and {C:red}+#2#{} Mult",
                    "no rank or suit",
                    "Consumed after {C:attention}#3#{} triggers",
                }
            },


        },

        Berry = {
            c_smsn_cranberries = {
                name = "Cranberries",
                text = {
                    "{C:red}+#1#{} Mult when you score",
                    "your next hand",
                    "always {C:attention}scores first{}",
                    "{C:inactive,s:0.8}(Currently #2#)",
                },
            },

            c_smsn_blueberries = {
                name = "Blueberries",
                text = {
                    "{C:blue}+#1#{} Chips when you score",
                    "your next hand",
                    "always {C:attention}scores first{}",
                    "{C:inactive,s:0.8}(Currently #2#)",
                },
            },

            c_smsn_boysenberry = {
                name = "Boysenberries",
                text = {
                    "{C:blue}+#1#{} Chips and {C:red}+#2#{} Mult",
                    "when you score your next hand",
                    "always {C:attention}scores first{}",
                    "{C:inactive,s:0.8}(Currently #3#)",
                },
            },

            c_smsn_rambleberry = {
                name = "Rambleberry",
                text = {
                    "{C:blue}+#1#{} Chips and {C:red}+#2#{} Mult",
                    "when you score your next hand",
                    "always {C:attention}scores first{}",
                    "{C:inactive,s:0.8}(Currently #3#)",
                },
            },

            c_smsn_grapes = {
                name = "Grapes",
                text = {
                    "{C:green}+#1#{} to all listed probabilties",
                    "Resets after scoring",
                    "{C:inactive,s:0.8}(Currently #3#)",
                },
            },

            c_smsn_raspberry = {
                name = "Raspberry",
                text = {
                    "{X:mult,C:white}x#1#{} Mult when you score",
                    "your next hand",
                    "always {C:attention}scores first{}",
                    "{C:inactive,s:0.8}(Currently #2#)",
                },
            },

            c_smsn_strawberry = {
                name = "Strawberry",
                text = {
                    "{C:red}+#1#{} and {X:mult,C:white}x#2#{} Mult",
                    "when you score your next hand",
                    "always {C:attention}scores first{}",
                    "{C:inactive,s:0.8}(Currently #3#)",
                },
            },

            c_smsn_cloudberry = {
                name = "Cloudberry",
                text = {
                    "{C:money}$#1#{} at the end",
                    "of the round",
                    "{C:inactive,s:0.8}(Currently #2#)",
                },
            },

            c_smsn_blackberry = {
                name = "Blackberry",
                text = {
                    "Draw {C:attention}#1#{} cards",
                    "to your hand during a round",
                },
            },

            c_smsn_crepes = {
                name = "Crepes",
                text = {
                    "One {C:attention}free{} reroll",
                    "Activates when entering shop",
                },
            },

            c_smsn_fruitsalad = {
                name = "Fruit Salad",
                text = {
                    "Creates up to {C:attention}#1#{} {C:dark_edition}Berry{} cards",
                    "{C:inactive,s:0.8}(Must have room)",
                },
            },

            c_smsn_cherry = {
                name = "Cherry",
                text = {
                    "Creates the last {C:dark_edition}Berry{} card used",
                    "{C:inactive,s:0.8}(Cannot copy Cherry)",
                    "{C:inactive,s:0.8}(Currently #1#)",
                },
            },

            c_smsn_yew = {
                name = "Yew Berry",
                text = {
                    "Your next hand will be considered",
                    "your {C:attention}most played hand{}",
                    "{C:inactive,s:0.8}(Currently #3#)",
                },
            },

            c_smsn_cuberry = {
                name = "Cuberry",
                text = {
                    "Retrigger the first",
                    "{C:attention}#1#{} scored cards",
                    "{C:inactive,s:0.8}(Currently #2#)",
                },
            },

            c_smsn_preserves = {
                name = "Fruit Preserves",
                text = {
                    "Increase the life of a {C:attention}Perishable{}",
                    "Joker by {C:attention}#1#{} round",
                },
            },

            c_smsn_donut = {
                name = "Jelly Donut",
                text = {
                    "Adds Chips and Mult equal to",
                    "{C:attention}#1#x{} the planet card values",
                    "of played hand",
                    "always {C:attention}scores first{}",
                    "{C:inactive,s:0.8}(Currently #3#)",
                },
            },

            c_smsn_riceball = {
                name = "Jelly Donut?",
                text = {
                    "What???????",
                },
            },
        },

        Other = {
            smsn_freshness_seal = {
                name = "Freshness Seal",
                text = {
                    "Creates a random {C:dark_edition}Berry{}",
                    "at the end of the round if held in hand",
                    "{C:inactive,s:0.8}(Must have room)",
                },
            },
        },
    },

    misc = {

        poker_hands = {
            smsn_honeypot = "Honeypot"
        },
        poker_hand_descriptions = {
            smsn_honeypot = {
                "5 Gold cards"
            }
        },
        v_dictionary = {
            a_art       = { "Art: #1#" },
            a_code      = { "Code: #1#" },
            a_idea      = { "Idea: #1#" },
            a_character = { "Char: #1#" },
            a_xchips = "X#1# Chips"
        },

        dictionary = {
            k_smsn_Berry_cards    = "Berry Cards",
            k_plus_berry          = "+1 Berry",
            k_smsn_berry          = "Berry Card",
            k_plus_commonrambley  = "All Aboard!",
            k_littlelad           = "Upgrade!!",
            k_m_smsn_glazed_ex    = "Glazed!",
            k_smsn_kaboom_ex      = "Kaboom!",
            k_smsn_disappeared_ex = "Disappeared!",
            k_smsn_yoink_ex       = "Yoink!",



            k_oc           = "Original Character",
            k_guest        = "Guest Joker",
            k_shitpost     = "Shitpost Joker",
            k_bitsandbops  = "Bits & Bops",
            k_sesamestreet = "Sesame Street",
            k_hamtaro      = "Hamtaro",
            k_schoolastic  = "Scholastic",
            k_rambley      = "Indigo Park",
            k_starburst    = "Starburst",
            k_warioware    = "Warioware",
            k_slimerancher = "Slime Rancher",
            k_ykw          = "Yokai Watch",
            k_bugsnax      = "Bugsnax",
            k_wip          = "NOT CODED",


        },
        labels = {
            -- Editions
            smsn_redglaze = "Strawberry Glazed",
            smsn_blueglaze = "Blueberry Glazed",
            smsn_yellowglaze = "Lemon Poppy Glazed",
            smsn_brownglaze = "Maple Glazed",
            smsn_orangeglaze = "Honey Glazed",

            -- Seals
            smsn_freshness_seal = "Freshness Seal",

        },
    },
}
