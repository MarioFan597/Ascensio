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
					"{C:mult}+#1#{} Mult",
				},
			},

			j_asc_greedy = {
				name = "Avarus",
				text = {
					"Played cards with {C:diamond}Diamond",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored",
				},
			},

			j_asc_lusty = {
				name = "Libido",
				text = {
					"Played cards with {C:heart}Heart",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored",
				},
			},

			j_asc_wrathful = {
				name = "Iram",
				text = {
					"Played cards with {C:spade}Spade",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored",
				},
			},

			j_asc_gluttonous = {
				name = "Gula",
				text = {
					"Played cards with {C:club}Club",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored",
				},
			},

			j_asc_stencil = {
				name = "Inanis",
				text = {
					"Gains {X:mult,C:white}X#2#{} Mult for every",
					"empty {C:attention}Joker{} slot at end of round",
					"Gains {C:dark_edition}+#4#{} {C:attention}Joker{} slots at end of shop",
					"{C:inactive}(Currently {}{X:mult,C:white}X#1#{}{C:inactive} Mult and {}{C:dark_edition}+#3#{C:inactive} Joker Slots)",
				},
			},

			j_asc_credit_card = {
				name = "Debitum Accepi",
				text = {
					"Go up to {C:red}-$#1#{} in debt",
					"Gains {X:chips,C:white}X#3#{} Chips for every",
					"dollar of debt you have",
					"when leaving the shop",
					"{C:inactive}(Currently {X:chips,C:white}X#2#{}{C:inactive} Chips)",
				},
			},

			j_asc_mystic_summit = {
				name = "Fabulosa Radices",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult",
					"Gains {X:dark_edition,C:white}^#2#{} Mult at end of round",
					"when {C:attention}0{} discards remaining",
				},
			},

			j_asc_misprint = {
				name = "Defectus",
				text = {
					"", -- look in misprint.lua for the text
				},
			},

			j_asc_fibonacci = {
				name = "Proportio Aurea",
				text = {
					"Each played {C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
					"gives {X:mult,C:white}X#1#{} Mult when scored",
					"Joker gains previous {X:mult,C:white}X{} Mult",
					"before scoring each card",
					"Resets each hand played",
					"{C:inactive}[ex: X1, X2, X3, X5, X8, etc.]",
				},
			},

			j_asc_scary = {
				name = "Immanis Facies",
				text = {
					"Played face cards",
					"give {X:dark_edition,C:white}^#1#{} Chips",
					"when scored",
				},
			},

			j_asc_abstract = {
				name = "Aenigmatum",
				text = {
					"This Joker gains {X:dark_edition,C:white}^#2#{} Mult",
					"for each {C:attention}Joker{} card",
					"{C:inactive}(Currently {X:dark_edition,C:white}^#1#{} {C:inactive}Mult)",
				},
			},
			j_asc_blackboard = {
				name = "Tabula Lapidea",
				text = {
					"Gains {X:mult,C:white}X#3#{} Mult for all", 
					"{C:spade}Spades{} & {C:club}Clubs{} held in hand;", 
					"instead gains {X:mult,C:white}X#2#{} Mult per card", 
					"if all cards are {C:spade}Spades{} or {C:club}Clubs{}",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult)"

				},
			},

			j_asc_dna = {
				name = "Sui Replicatio",
				text = {
					"If {C:attention}first hand{} of round has only {C:attention}1{} card,",
					"add {C:attention}#1#{} permanent copies to deck,",
					"draw them to {C:attention}hand{},",
					"and destroy remaining cards in {C:attention}hand{}",
				},
			},

			j_asc_blue = {
				name = "Magnus Sapphirus",
				text = {
					"{X:chips,C:white}X#2#{} Chips for each",
					"remaining card in {C:attention}deck{},",
					"Gains {X:chips,C:white}X#3#{} Chips when",
					"a card is added to {C:attention}deck{}",
					"{C:inactive}(Currently: {}{X:chips,C:white}X#1#{C:inactive} chips)",
				},
			},

			j_asc_square = {
				name = "Dimensio Quattuor",
				text = {
					"This Joker gains {X:dark_edition,C:edition}^^#1#{} Chips",
					"if played hand has",
					"exactly {C:attention}4{} cards",
					"{C:inactive}(Currently {X:dark_edition,C:edition}^^#2#{} {C:inactive}Chips)",
				},
			},

			j_asc_midas = {
				name = "Rex Midas",
				text = {
					"All played cards become",
					"{C:attention}Gold{} and {C:attention}Golden{} when scored,",
					"{C:attention}Gold{} cards held in hand",
					"give {X:dark_edition,C:white}^#1#{} Mult",
				},
			},

			j_asc_golden = {
				name = "Purus Aurum",
				text = {
					"{X:money,C:white}X#2#{} total money at end of round,",
					"{C:green}#1# in #4#{} chance to increase ",
					"multiplier by {C:money}#3#{} each trigger", -- hello everybody my name is multiplier
				},
			},

			j_asc_bull = {
				name = "Taurus",
				text = {
					"{C:white,X:dark_edition}^#2#{} Chips for",
					"every {C:money}$1{} you have",
					"{C:inactive}(Currently {}{C:white,X:dark_edition}^#1#{C:inactive} Chips){}",
				},
			},

			j_asc_seltzer = {
				name = "Bulla Aquae",
				text = {
					"Retriggers all cards played {C:attention}#1#{} time(s)",
					"Increase number of retriggers",
					"after {C:attention}#3#{} hands",
					"{C:inactive}(Hands until upgrade: {C:attention}#2#{C:inactive})",
				},
			},

			j_asc_throwback = {
				name = "Desiderium",
				text = {
					"Gains {X:mult,C:white}X(n^#3#){} Mult for each",
					"{C:attention}Blind{} skipped this run",
					"{X:attention,C:white}n{} is equal to the current",
					"number of {C:attention}Blinds{} skipped",
					"{C:inactive,s:0.9}(Currently {X:mult,C:white,s:0.9}X#1#{}{C:inactive,s:0.9} Mult and {C:attention,s:0.9}#2#{}{C:inactive,s:0.9} skips)",
				},
			},

			j_asc_hanging_chad = {
				name = "Charta Electionis",
				text = {
					"Retrigger the first",
					"scored card {C:attention}#1#{} times",
				},
			},

			j_asc_blueprint = {
				name = "Hyacintho Progressus",
				text = {
					"Retriggers {C:attention}Joker{} to the right",
					"for each copy of that {C:attention}Joker{} you own",
					"{C:attention}Duplicate Joker{} to the right at end of shop",
					"{C:inactive}(Must have room)",
				},
			},

			j_asc_oops = {
				name = "Fortunae Risus",
				text = {
					"{C:cry_code}Rig{} all scored cards and a random",
					"{C:attention}Joker{} before each hand played,",
					"{C:red}fixed{} {C:green}1 in 6{} chance to grant",
					"{C:dark_edition}+#1#{} {C:attention}Joker{} or consumable slot",
					"{C:inactive}(Currently {C:dark_edition}+#2#{}{C:attention} Joker{}{C:inactive} slot(s) and",
					"{C:attention}+#3#{} {C:inactive}consumable slot(s))",
				},
			},

			j_asc_duo = {
				name = "Sum Duo",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult if played",
					"hand contains",
					"a {C:attention}Pair{}",
				},
			},

			j_asc_trio = {
				name = "Sum Trio",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult if played",
					"hand contains",
					"a {C:attention}Three of a Kind{}",
				},
			},

			j_asc_family = {
				name = "Sum Quattuor",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult if played",
					"hand contains",
					"a {C:attention}Four of a Kind{}",
				},
			},

			j_asc_order = {
				name = "Sum Constituto",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult if played",
					"hand contains",
					"a {C:attention}Straight",
				},
			},

			j_asc_tribe = {
				name = "Sum Carnes Unius",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult if played",
					"hand contains",
					"a {C:attention}Flush",
				},
			},

			j_asc_brainstorm = {
				name = "Magnum Opus",
				text = {
					"Retrigger leftmost {C:attention}Joker{} by number of ",
					"{C:attention}Jokers{} between it and this {C:attention}Joker{} inclusively,", -- comma splice to be consistent with vanilla. womp womp to all the grammar people
					"at end of shop, create a {C:attention}Joker",
					"of same rarity as leftmost",
					"{C:inactive}(Cannot affect self and must have room)",
				},
			},

			j_asc_drivers_license = {
				name = "Identitatis Discrimine",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
					"{C:attention}Doubles{} for every {C:attention}modification{}",
					"in remaining deck",
				},
			},

			j_asc_canio = {
				name = "Thanatos",
				text = {
					"Gains {X:dark_edition,C:white}^#2#{} Mult per destroyed face card,",
					"destroyed face cards are returned to hand",
					"{C:inactive}(Currently {X:dark_edition,C:white}^#1#{}{C:inactive} Mult)",
				},
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
			]]
			--

			-----Cryptid-----
			j_asc_canvas = {
				name = "Oleum Pictura",
				text = {
					"{C:attention}Retrigger{} all {C:attention}Jokers{} to the left",
					"once for {C:attention}every{} Joker{} including itself",
					"to the right of this Joker",
					"Creates a {C:dark_edition}Negative{} {C:attention,T:j_joker}Joker{} when exiting shop",
					"{C:inactive}(Does not need room)"
				},
			},
			j_asc_gardenfork = {
				name = "Contra Homo",
				text = {
					"{X:money,C:white}X#1#{} total money if played hand",
					"contains an {C:attention}Ace{} or {C:attention}7{}",
				},
			},

			j_asc_like_antennas_to_heaven = {
				name = "Contra Logos",
				text = {
					"This Joker gains {X:dark_edition,C:white}^#1#{} Chips",
					"for every {C:attention}7{} or {C:attention}4{}",
					"contained in full hand",
					"{C:inactive}(Currently {X:dark_edition,C:white}^#2#{} {C:inactive}Chips)",
				},
			},

			j_asc_high_five = {
				name = "Superioris Manus",
				text = {
					"Before scoring, if played hand",
					"contains a scoring {C:attention}5{},",
					"convert {C:attention}all{} scored",
					"cards to {C:dark_edition}Astral {C:attention}5{}s",
				},
			},

			j_asc_oil_lamp = {
				name = "Lucerna",
				text = {
					"Increase values of all {C:attention}Jokers",
					"by {C:attention}X#1#{} at the end of round.",
					"{C:inactive}(Does not affect self)", -- oil lamp does not say "if possible," so why should this
				},
			},

			j_asc_hunting_season = {
				name = "Sine Fine Venari",
				text = {
					"If Hand contains an odd number of cards above {C:attention}1{},",
					"{C:red}destroy{} the {C:attention}center{} card after scoring",
					"Remaining played cards gain bonus {X:mult,C:white}XMult{}",
					"equal to {C:red}destroyed{} card's rank",
					"{C:inactive}(J = 11, Q = 12, K = 13, A = 14)",
					--divided by {C:attention}10{}",
				},
			},

			-----Cryptid Mortals-----

			j_asc_b_cake = {
				name = "Birthday Cake",
				text = {
					"{C:chips}+#1#{} Chips",
					"{C:chips}-#2#{} Chips per {C:attention}reroll{},", -- see flash card for {c} formatting on "reroll" when used in reference to gaining/losing values
					"{C:green}Rerolls{} are free", -- see choas the clown for {c} formatting on "reroll" when used in reference to free rerolls
				},
			},

			-----Astronomica-----

			j_asc_stopwatch = {
				name = "Aeon",
				text = {
					"Gives {C:chips}+G {C:black}Chips for each {C:attention}second{}",
					"the {C:black}game has been open where {C:chips}G{} is",
					"the number of decks won on {C:money}Gold Stake",
					"{C:inactive}(Currently {C:chips}#1# {C:inactive}Chips and {C:money}#2# Gold wins)",
					"{C:inactive}(At least gives 1 Chip per second)",
				},
			},

			j_asc_facsimile = {
				name = "Coccineum Progressus",
				text = {
					"Retriggers {C:attention}Joker{} to the left",
					"for each copy of that {C:attention}Joker{} you own",
					"{C:attention}Duplicate Joker{} to the left at end of shop",
					"{C:inactive}(Must have room)",
				},
			},

			-----Entropy-----

			j_asc_sunny_joker = {
				name = "Solis",
				text = {
					"Gains {X:gold,C:white}^#2#{} Ascension Power",
					"for each {C:gold}Ascended{} hand played",
					"{C:inactive}(Currently: {X:gold,C:white}^#1#{}{C:inactive}){}",
				},
			},

			-----Entropy Entropics-----
			j_asc_sunny_joker_entr = {
				name = "Iliakos",
				text = {
					"{X:gold,C:white}#3##1#{} Ascension Power",
					"Increases operator after",
					"{C:attention}#2#{} {C:gold}Ascended{} hands played",
				},
			},
		},
		Other = {
			asc_ascensionable = {
				name = "Ascension Candidate",
				text = {
					"This Joker can reach",
					"a {C:cry_exotic,E:1}Higher Form{}",
				},
			},
			asc_apothable = {
				name = "Apotheosis Candidate",
				text = {
					"This Joker can reach",
					"an {C:entr_entropic,E:1}Even Higher Form{}",
				},
			},
		},
		Planet = {},
		Spectral = {
			c_asc_ascension = {
				name = "Ascension",
				text = {
					"Transforms viable {C:attention}Jokers{} to",
					"their {C:cry_exotic,E:1}Exotic{} counterpart",
					"Destroy all other held {C:attention}Jokers{}",
				},
			},
		},
		Code = {},
		Omen = {
			c_asc_apotheosis = {
				name = "Apotheosis",
				text = {
					"Transforms viable {C:attention}Jokers{} to",
					"their {C:entr_entropic,E:1}Entropic{} counterpart",
					"Destroy all other held Jokers",
				},
			},
		},
		Back = {
			b_asc_starlight = {
				name = "Starlight Deck",
				text = {
					"Start with an {C:cry_exotic,T:c_asc_ascension}Ascension{C:attention} Card",
					"Jokers are {C:attention}20X{} more",
					"likely to be {C:dark_edition}Negative",
					"{C:attention}-2{} Joker slots",
					"{C:inactive,s:0.7}Starlight, starbright,{}",
					"{C:inactive,s:0.7}First star I see tonight;{}",
					"{C:inactive,s:0.7} I wish I may, I wish I might{}",
					"{C:inactive,s:0.7}have the wish I wish tonight{}",
				},
			},
		},
		Stake = {},
		Tag = {},
		Tarot = {},
		Voucher = {},
	},
	misc = {
		dictionary = {
			asc_config = "Config",
			asc_config_insanity_mode = "Insanity Mode!!!",
		},
	},
}
