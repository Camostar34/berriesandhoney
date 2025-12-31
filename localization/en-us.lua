return {
    descriptions = {
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

            j_smsn_bash = {
                name = "Bashkelox",
                text = {
                    "{C:attention}x#1#{} Blind requirement",
                    "{C:green}#2# in 2{} chance to {C:red}debuff{} at the end of round",
                    "{C:attention}Resets{} every Ante",
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
                    "Earn #1# chips in {C:attention}#2# rounds{}",
                    "to permamently gain {C:blue}+1{} hand every round,",
                    "otherwise permamently {C:red}lose{} a hand",
                },
            },

            j_smsn_rivalssamson = {
                name = "ROA Samson",
                text = {
                    "Earn {C:blue}#1#{} Chips in {C:attention}#2# rounds{}",
                    "to gain {C:money}#3#${}",
                    "otherwise {C:red}lose{} {C:money}#3#${}",
                },
            },

            j_smsn_hercule = {
                name = "Hercule",
                text = {
                    "Always draws {C:attention}#1#{} extra",
                    "cards when you {C:blue}Play{} or {C:red}Discard{}",
                },
            },

            j_smsn_emmy = {
                name = "Emmy Bunderbatch",
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
                name = "KATAMARI",
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

            j_smsn_gardener = {
                name = "Gardener",
                text = {
                    "Creates a {C:dark_edition}Berry Card{}",
                    "Every {C:attention}#1#{} {C:inactive}[#2#]{} hands played",
                },
            },

            j_smsn_mintjams = {
                name = "Mint Jams",
                text = {
                    "Scored cards without a {C:attention}modifier{} have a",
                    "{C:green}#1# in #2#{} to create a {C:dark_edition}Berry Card{}",
                    "Consumed if a modified card is scored",
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
                    "idk what he does yet i just like",
                    "paddington and thought he fit the vibe",
                    "of the mod",
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

            j_smsn_honeycombtoffee = {
                name = "Honeycomb Toffee",
                text = {
                    "Scored {C:attention}Gold Cards{} are treated as {C:attention}Glass Cards{}",
                    "But are {C:green}twice as likely{} to break",
                },
            },

            j_smsn_hothoney = {
                name = "Hot Honey",
                text = {
                    "Scored {C:attention}Gold Cards{} give {X:mult,C:white}x#1#{} Mult",
                    "Lose {C:money}$#2#{} when a Gold Card is scored",
                },
            },

            j_smsn_mycom = {
                name = "MYCOM MAIM MARIONETTE",
                text = {
                    "Gains {X:mult,C:white}x#1#{} when a hand is played",
                    "containing an {C:attention}unscored{} card",
                    "{C:attention}Resets{} on discard",
                    "{C:inactive,s:0.8}(Currently {X:mult,C:white}x#2#{C:inactive,s:0.8} Mult)",
                },
            },

            j_smsn_stomachbook = {
                name = "GOODNIGHT HYPNOPOMP",
                text = {
                    "",
                },
            },

            j_smsn_robotface = {
                name = "Robot Face",
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
                    "The shop {C:attention}only{} contains",
                    "{C:dark_edition}Berry Cards{} and {C:dark_edition}Picnic Packs{}",
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
                name = "Apprenticeship  Memory",
                text = {
                    "Create a {C:dark_edition}Negative Berry Card{}",
                    "when {C:attention}#1#{} or more face",
                    "cards are discarded",
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

            j_smsn_bearstack = {
                name = "Bear Stack",
                text = {
                    "Retrigger all cards",
                    "if played hand contains",
                    "a {C:attention}Three of a Kind{}",
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

            j_smsn_rabbick = {
                name = "Rabbick Sappy",
                text = {
                    "Retrigger a {C:attention}Rouxles Karrd{}",
                    "of a {C:clubs}Clubs{} suit",
                },
            },

            j_smsn_yappy = {
                name = "Evil Sappy (Yappy)",
                text = {
                    "",
                },
            },

            j_smsn_thegoteam = {
                name = "Thunder, Lightning, Strike!!",
                text = {
                    "{C:red}+#1#{} Mult and {C:money}$#2#{}",
                    "if hand contains a {C:attention}Flash{}",
                    "and a {C:attention}Queen{}",
                },
            },

            j_smsn_kuchinohanabi = {
                name = "Kuchinohanabi",
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
                    "{X:chips,C:white}X#1#{} on the",
                    "first {C:attention}Flash{}",
                    "of the round",
                },
            },

            -- GUEST JOKERS 

            j_smsn_peapod = {
                name = "Pea Pod",
                text = {
                    {
                        "Steals a random {C:attention}Consumable{} at the end of round",
                        "Gains {C:blue}+#1#{} Chips for every taken Consumable",
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

            j_smsn_pedro = {
                name = "Pedro Pave",
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

            j_smsn_astro = {
                name = "Astro",
                text = {
                    {
                        "{C:attention}Doubles{} all {C:blue}Chip{} effects.",
                    },
                },
            },

            j_smsn_angel = {
                name = "Angel",
                text = {
                    {
                        "does a {C:attention}silly{}",
                        ":)",
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
            smsn_freshness = {
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
        v_dictionary = {
            a_art       = { "Art: #1#" },
            a_code      = { "Code: #1#" },
            a_idea      = { "Idea: #1#" },
            a_character = { "Char: #1#" },
        },

        dictionary = {
            k_smsn_Berry_cards      = "Berry Cards",
            k_smsn_berry            = "Berry Card",
            k_plus_commonrambley    = "All Aboard!",
            k_littlelad             = "Upgrade!!",
        },
    },
}