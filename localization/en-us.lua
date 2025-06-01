return {
	descriptions = {
		Back = {},
		Blind = {},
		Edition = {},
		Enhanced = {},
		Joker = {
			-----Vanilla-----
			j_asc_jimbo = {
				name = "Balatro",
				text = {
					"{C:mult}+#1#{} Mult"
				}
			},

			j_asc_greedy = {
				name = "Avarus",
				text = {
					"Played cards with {C:diamond}Diamond",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored"
				}
			},

			j_asc_lusty = {
				name = "Libido",
				text = {
					"Played cards with {C:heart}Heart",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored"
				}
			},

			j_asc_wrathful = {
				name = "Iram",
				text = {
					"Played cards with {C:spade}Spade",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored"
				}
			},

			j_asc_gluttonous = {
				name = "Gula",
				text = {
					"Played cards with {C:club}Club",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored"
				}
			},

			j_asc_stencil = {
				name = "Inanis",
				text = {
					"Gains {X:mult,C:white}X#2#{} Mult for every",
					"empty {C:attention}Joker{} slot at end of round",
					"Gains {C:dark_edition}+#4#{} {C:attention}Joker{} slots at end of shop",
					"{C:inactive}(Currently {}{X:mult,C:white}X#1#{}{C:inactive} Mult and {}{C:dark_edition}+#3#{C:inactive} Joker Slots)"
				}
			},

			j_asc_credit_card = {
				name = "Debitum Accepi",
				text = {
					"Go up to {C:red}-$#1#{} in debt",
					"Gains {X:chips,C:white}X#3#{} Chips for every",
					"dollar of debt you have",
					"when leaving the shop",
					"{C:inactive}(Currently {X:chips,C:white}X#2#{}{C:inactive} Chips)"
				}
			},

			j_asc_mystic_summit = {
				name = "Fabulosa Radices",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult",
					"Gains {X:dark_edition,C:white}^#2#{} Mult at end of round",
					"when {C:attention}0{} discards remaining",
				}
			},

			j_asc_misprint = {
				name = "Defectus",
				text = {
					"", -- look in misprint.lua for the text
				}
			},

			j_asc_scary = {
				name = "Immanis Facies",
				text = {
					"Played face cards", 
					"give {X:dark_edition,C:white}^#1#{} Chips",
					"when scored"
				}
			},

			j_asc_abstract = {
				name = "Aenigmatum",
				text = {
					"This Joker gains {X:dark_edition,C:white}^#2#{} Mult", 
					"for each {C:attention}Joker{} card",
					"{C:inactive}(Currently {X:dark_edition,C:white}^#1#{} {C:inactive}Mult)"
				}
			},

			j_asc_dna = {
				name = "Sui Replicatio",
				text = {
					"If {C:attention}first hand{} of round has only {C:attention}1{} card,", 
					"add {C:attention}#1#{} permanent copies to deck,",
					"draw them to {C:attention}hand{},", 
					"and destroy remaining cards in {C:attention}hand{}"
				}
			},

			j_asc_midas = {
				name = "Rex Midas",
				text = {
					"All played cards become", 
					"{C:attention}Gold{} and {C:attention}Golden{} when scored,",
					"{C:attention}Gold{} cards held in hand",
					"give {X:dark_edition,C:white}^#1#{} Mult"
				}
			},

			j_asc_golden = {
				name = "Purus Aurum",
				text = {
					"{X:money,C:white}X#2#{} total money at end of round,",
					"{C:green}#1# in #4#{} chance to increase ",
					"multiplier by {C:money}#3#{} each trigger" -- hello everybody my name is multiplier
				}
			},
			
			j_asc_bull = {
				name = "Taurus",
				text = {
					"{C:white,X:dark_edition}^#2#{} Chips for",
					"every {C:money}$1{} you have",
					"{C:inactive}(Currently {}{C:white,X:dark_edition}^#1#{C:inactive} Chips){}"
				}
			},

			j_asc_seltzer = {
				name = "Bulla Aquae",
				text = {
					"Retriggers all cards played {C:attention}#1#{} time(s)", 
					"Increase number of retriggers",
					"after {C:attention}#3#{} hands",
					"{C:inactive}(Hands until upgrade: {C:attention}#2#{C:inactive})"
				}
			},

			j_asc_hanging_chad = {
				name = "Charta Electionis",
				text = {
					"Retrigger the first",
					"scored card {C:attention}#1#{} times"
				}
			},

			j_asc_blueprint = {
				name = "Hyacintho Progressus",
				text = {
					"Retriggers {C:attention}Joker{} to the right",
					"for each copy of that {C:attention}Joker{} you own",
					"{C:attention}Duplicate Joker{} to the right at end of shop",
					"{C:inactive}(Must have room)"
				}
			},

			j_asc_oops = {
				name = "Fortunae Risus",
				text = {
					"{C:cry_code}Rig{} all scored cards and a random", 
					"{C:attention}Joker{} before each hand played,",
					"{C:red}fixed{} {C:green}1 in 6{} chance to grant",
					"{C:dark_edition}+#1#{} {C:attention}Joker{} or consumable slot",
					"{C:inactive}(Currently {C:dark_edition}+#2#{}{C:attention} Joker{}{C:inactive} slot(s) and",
					"{C:attention}+#3#{} {C:inactive}consumable slot(s))"
				}
			},

			j_asc_duo = {
				name = "Sum Duo",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult if played", 
					"hand contains",
					"a {C:attention}Pair{}"
				}
			},

			j_asc_trio = {
				name = "Sum Trio",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult if played", 
					"hand contains",
					"a {C:attention}Three of a Kind{}"
				}
			},

			j_asc_family = {
				name = "Sum Quattuor",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult if played", 
					"hand contains",
					"a {C:attention}Four of a Kind{}"
				}
			},

			j_asc_order = {
				name = "Sum Constituto",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult if played",
					"hand contains",
					"a {C:attention}Straight"
				}
			},

			j_asc_tribe = {
				name = "Sum Carnes Unius",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult if played",
					"hand contains",
					"a {C:attention}Flush"
				}
			},

			j_asc_brainstorm = {
				name = "Magnum Opus",
				text = {
					"Retrigger leftmost {C:attention}Joker{} by number of ",
					"{C:attention}Jokers{} between it and this {C:attention}Joker{} inclusively,", -- comma splice to be consistent with vanilla. womp womp to all the grammar people
					"at end of shop, create a {C:attention}Joker",
					"of same rarity as leftmost",
					"{C:inactive}(Cannot affect self and must have room)"
				}
			},

			j_asc_drivers_license = {
				name = "Identitatis Discrimine",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
					"{C:attention}Doubles{} for every {C:attention}modification{}",
					"in remaining deck"
				}
			},

			j_asc_canio = {
				name = "Thanatos",
				text = {
					"Gains {X:dark_edition,C:white}^#2#{} Mult per destroyed face card,",
					"destroyed face cards are returned to hand",
					"{C:inactive}(Currently {X:dark_edition,C:white}^#1#{}{C:inactive} Mult)"
				}
			},

			--[[
			j_asc_to_the_moon = {
				name = "Pecunia Dominus",
				text = {
					"Whenever you would gain {C:money}${},",
					"gain {X:money,C:white}triple{} that amount",
					"All purchases only spend"
				}
			},
			]]--

			-----Cryptid-----

			j_asc_gardenfork = {
				name = "Contra Homo",
				text = {
					"{X:money,C:white}X#1#{} total money if played hand",
					"contains an {C:attention}Ace{} or {C:attention}7{}"
				}
			},

			j_asc_high_five = {
				name = "Superioris Manus",
				text = {
					"Before scoring, if played hand", 
					"contains a scoring {C:attention}5{},",
					"convert {C:attention}all{} scored",
					"cards to {C:dark_edition}Astral {C:attention}5{}s",
				}
			},

			j_asc_oil_lamp = {
				name = "Lucerna",
				text = {
					"Increase values of all {C:attention}Jokers", 
					"by {C:attention}X#1#{} at the end of round.",
					"{C:inactive}(Does not affect self)" -- oil lamp does not say "if possible," so why should this
				}
			},

			j_asc_hunting_season = {
				name = "Sine Fine Venari",
				text = {
					"If Hand contains an odd number of cards above {C:attention}1{},",
					"{C:red}destroy{} the {C:attention}center{} card after scoring",
					"Remaining played cards gain bonus {X:mult,C:white}XMult{}",
					"equal to {C:red}destroyed{} card's rank",
					"{C:inactive}(J = 11, Q = 12, K = 13, A = 14)"
					--divided by {C:attention}10{}",
				}
			},

			-----Cryptid Mortals-----

			j_asc_b_cake = {
				name = "Birthday Cake",
				text = {
					"{C:chips}+#1#{} Chips", 
					"{C:chips}-#2#{} Chips per {C:attention}reroll{},", -- see flash card for {c} formatting on "reroll" when used in reference to gaining/losing values
					"{C:green}Rerolls{} are free" -- see choas the clown for {c} formatting on "reroll" when used in reference to free rerolls
				}
			},

			-----Astronomica-----

			j_asc_stopwatch = {
				name = "Aeon",
				text = {
					"Gives {C:chips}+G {C:black}Chips for each {C:attention}second{}",
					"the {C:black}game has been open where {C:chips}G{} is",
					"the number of decks won on {C:money}Gold Stake",
					"{C:inactive}(Currently {C:chips}#1# {C:inactive}Chips and {C:money}#2# Gold wins)",
					"{C:inactive}(At least gives 1 Chip per second)"
				}
			},

			j_asc_facsimile = {
				name = "Coccineum Progressus",
				text = {
					"Retriggers {C:attention}Joker{} to the left",
					"for each copy of that {C:attention}Joker{} you own",
					"{C:attention}Duplicate Joker{} to the left at end of shop",
					"{C:inactive}(Must have room)"
				}
			},

			
		},
		Other = {},
		Planet = {},
		Spectral = {
			c_asc_ascension = {
				name = "Ascension",
				text = {
					"Transforms viable {C:attention}Jokers{} to",
					"their {C:cry_exotic,E:1}Exotic{} counterpart,",
					"destroy all other {C:attention}Jokers{}"
				},
			},
		},
		Code = {},
		Stake = {},
		Tag = {},
		Tarot = {},
		Voucher = {},
	},
    misc = {
            dictionary = {
                asc_config = "Config",
                asc_config_insanity_mode = "Insanity Mode!!!"
        }},
}
