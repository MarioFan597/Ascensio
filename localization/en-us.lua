return {
	descriptions = {
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
					{
						"Gains {X:mult,C:white}X#2#{} Mult for every",
						"empty {C:attention}Joker{} slot",
						"at end of round",
						"{C:inactive}(Currently {}{X:mult,C:white}X#1#{}{C:inactive} Mult)",
					},
					{
						"Gains {C:dark_edition}+#4#{} {C:attention}Joker{} slots",
						"at end of shop",
						"{C:inactive}(Currently {}{C:dark_edition}+#3#{C:inactive} Joker Slots)",
					},
				},
			},

			j_asc_four_fingers = {
				name = "Truncus Manus",
				text = {
					"All {C:attention}Flushes{} and {C:attention}Straights{} can",
					"be made with {C:attention}2{} cards",
					"Extra cards contribute",
					"to Ascension Power",
				},
			},

			j_asc_mime = {
				name = "Silentium",
				text = {
					{
						"The {C:dark_edition}editions{} of",
						"Playing Cards become",
						"held in hand effects",
					},
					{
						"{C:attention}Retrigger{} all cards",
						"held in hand once",
					},
					{
						"{C:attention}Retrigger{} editioned",
						"Playing Cards once",
					},
				},
			},

			j_asc_ceremonial = {
				name = "Fractus Capulo",
				text = {
					"When Blind is selected, {C:green}#1# in #2#{} chance",
					"to destroy every other {C:attention}Joker{}",
					"Gains {X:dark_edition,C:white}^#3#{} Mult for each",
					"{C:attention}Joker{} destroyed this way",
					"{C:inactive}(Currently {X:dark_edition,C:white}^#4#{}{C:inactive} Mult)",
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

			j_asc_banner = {
				name = "Conquestum",
				text = {
					{
						"Gains {X:chips,C:white}X#2#{} Chips per remaining",
						"{C:attention}discard{} every hand played",
						"{C:inactive}(Currently {X:chips,C:white}X#1#{}{C:inactive} Chips)",
					},
					{
						"On scoring, {X:chips,C:white}X#3#{} Chips for",
						"each remaining {C:attention}discard{}",
					},
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

			j_asc_marble = {
				name = "Stela Marmorea",
				text = {
					{
						"Creates {C:attention}#2#{} {C:dark_edition}Mosaic{}",
						"{C:attention}Stone{} cards when",
						"{C:attention}Blind{} is selected",
						"{C:inactive}(Max {C:attention}#4#{C:inactive} cards)",
					},
					{
						"Retrigger played {C:attention}Stone{}",
						"Cards {C:attention}#1#{} times",
						"{C:inactive}(Max {C:attention}#3#{C:inactive} retriggers)",
					},
					--[[{
						"{C:attention}Stone{} cards give",
						"{X:dark_edition,C:white}^#2#{} Chips when scored.",  
					},]]
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
					{
						"Each played {C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
						"gives {X:mult,C:white}X#1#{} Mult when scored",
					},
					{
						"Joker gains previous {X:mult,C:white}XMult{}",
						"before scoring each card",
						"Resets each hand played.",
						"{C:inactive}(e.g: X1, X2, X3, X5, X8, etc.){}",
					},
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

			j_asc_banana = {
				name = "Musa Acuminata",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
					"At the end of round, has a",
					"{C:green}#3# in #4#{} chance to duplicate itself",
					"Otherwise, gains {X:mult,C:white}X#2#{} Mult",
					"{C:inactive}(Must have room){}",
					"{C:money,E:2}OH, BANANA!{}",
				},
			},

			j_asc_even_steven = {
				name = "Sinistra",
				text = {
					{
						"Played cards with {C:attention}even{} rank",
						"give {X:mult,C:white}X#1#{} Mult when scored",
						"{C:inactive}(10, 8, 6, 4, 2){}",
					},
					{
						"Instead gives {X:mult,C:white}X#2#{} Mult",
						"if played hand has an {C:attention}even{}",
						"amount of cards in it",
					},
				},
			},

			j_asc_odd_todd = {
				name = "Dextra",
				text = {
					{
						"Played cards with {C:attention}odd{} rank",
						"give {X:chips,C:white}X#1#{} Chips when scored",
						"{C:inactive}(A, 9, 7, 5, 3){}",
					},
					{
						"Instead gives {X:chips,C:white}X#2#{} Chips",
						"if played hand has an {C:attention}odd{}",
						"amount of cards in it",
					},
				},
			},

			j_asc_blackboard = {
				name = "Tabula Lapidea",
				text = {
					{
						"Gains {X:mult,C:white}X#3#{} Mult for every",
						"{C:spade}Spades{} & {C:club}Clubs{} held in hand",
						"{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult)",
					},
					{
						"Instead gains {X:mult,C:white}X#2#{} Mult per card",
						"if all cards are {C:spade}Spades{} or {C:club}Clubs{}",
					},
				},
			},

			j_asc_ice_cream = {
				name = "Glacies Cremoris",
				text = {
					"{X:dark_edition,C:white}^#1#{} Chips",
					"Gains {X:dark_edition,C:white}^#2#{} Chips for",
					"every hand played this run",
					"after each hand played",
					"{C:inactive}(Currently {C:attention}#3#{C:inactive} hands played)"
				},
			},

			j_asc_dna = {
				name = "Sui Replicatio",
				text = {
					"If {C:attention}first hand{} of round has only {C:attention}1{} card,",
					"add {C:attention}#1#{} permanent copies to deck,",
					"draw them to {C:attention}hand{}, and destroy",
					"non-identical cards held in {C:attention}hand{}",
					"{C:inactive}(Max {C:attention}#2#{} {C:inactive}cards created)",
				},
			},

			j_asc_blue = {
				name = "Magnus Sapphirus",
				text = {
					{
						"{X:chips,C:white}X#2#{} Chips for each",
						"remaining card in {C:attention}deck{}",
						"{C:inactive}(Currently: {}{X:chips,C:white}X#1#{C:inactive} chips)",
					},
					{
						"Increases Chips per card",
						"by {X:chips,C:white}X#3#{} when a card",
						"is added to {C:attention}deck{}",
					},
				},
			},

			j_asc_musa_ingens = {
				name = "Musa Ingens",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult",
					"{C:money,E:2}OH, BANANA!{}",
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

			j_asc_hologram = {
				name = "Nebulosa Imago",
				text = {
					{
						"Whenever a {C:attention}card{} is scored,",
						"create {C:attention}#1#{} duplicates of it",
						"and add them to deck, then destroy it.",
						"{C:inactive}(Maximum 40 duplicates.){}",
					},
					{
						"Whenever a {C:attention}card{} is",
						"{C:attention}added to deck{} or {C:attention}destroyed{},",
						"gains {X:dark_edition,C:white}^#2#{} Mult.",
						"{C:inactive}(Currently {X:dark_edition,C:white}^#3#{} Mult.){}",
					},
				},
			},

			j_asc_midas = {
				name = "Rex Midas",
				text = {
					{
						"All played cards become",
						"{C:attention}Gold{} and {C:attention}Golden{} when scored",
					},
					{
						"{C:attention}Gold{} cards held in hand",
						"give {X:dark_edition,C:white}^#1#{} Mult",
					},
				},
			},

			j_asc_to_the_moon = {
				name = "Pecunia Dominus",
				text = {
					"Whenever you would gain {C:money}${},",
					"gain {X:money,C:white}triple{} that amount",
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
					{
						"Retriggers all cards played {C:attention}#1#{} time(s)",
						"{C:inactive}(Max {C:attention}#4#{} {C:inactive}retriggers)",
					},
					{
						"Increase number of retriggers",
						"after {C:attention}#3#{} hands",
						"{C:inactive}(Hands until upgrade: {C:attention}#2#{C:inactive})",
					},
				},
			},

			j_asc_smiley_face = {
				name = "Acclamatio",
				text = {
					{
						"Retrigger {C:attention}face{} cards for",
						"amount of previously scored",
						"{C:attention}face{} cards in played hand",
						"{C:inactive}(Max {C:attention}#2#{} {C:inactive}retriggers)",
					},
					{
						"Played {C:attention}face{} cards give",
						"{C:white,X:mult}X#1#{} Mult when scored",
					},
				},
			},

			j_asc_campfire = {
				name = "Silva Ardens",
				text = {
					{
						"Gains {C:white,X:dark_edition}^#2#{} Mult for each card {C:attention}sold{}",
						"Resets when {C:attention}Boss Blind{} is defeated",
						"{C:inactive}(Currently {}{C:white,X:dark_edition}^#1#{C:inactive} Mult)",
					},
					{
						"Increases gain after",
						"{C:attention}Boss Blind{} by {C:white,X:dark_edition}^#3#{} Mult",
						"for each card {C:attention}sold{} this {C:attention}Ante{}",
						"{C:inactive}(Currently {C:attention}#4#{} {C:inactive}cards sold){}",
					},
				},
			},

			j_asc_sock_and_buskin = {
				name = "Thalia et Melpomene",
				text = {
					{

						"Retrigger all played",
						"{C:attention}face{} cards {C:attention}#1#{} times",
						"{C:inactive}(Max {C:attention}#4#{} {C:inactive}retriggers)",
					},
					{
						"{C:attention}Face{} cards scored",
						"give {X:chips,C:white}X#2#{} Chips and those",
						"{C:attention}held in hand{} give {X:mult,C:white}X#3#{} Mult",
					},
				},
			},

			j_asc_smeared = {
				name = "Inquino",
				text = {
					"{C:attention}All{} cards count as",
					"every {C:attention}suit{} and every {C:attention}rank{}",
					"Cards with a suit or a rank",
					"{C:attention}cannot{} be debuffed",
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
					{
						"Retrigger the first scored",
						"card for current handsize",
						"{C:inactive}(Currently {C:attention}#1#{} {C:inactive}retriggers)",
						"{C:inactive}(Max {C:attention}#3#{} {C:inactive}retriggers)",
					},
					{
						"{C:attention}+#2#{} permanent hand size when",
						"{C:attention}Boss Blind{} is defeated",
					},
				},
			},

			j_asc_blueprint = {
				name = "Hyacintho Progressus",
				text = {
					{
						"Retriggers {C:attention}Joker{} to the right",
						"for each copy of that {C:attention}Joker{} you own",
					},
					{
						"{C:attention}Duplicate Joker{} to right at end of shop",
						"{C:inactive}(Must have room)",
					},
				},
			},

			j_asc_oops = {
				name = "Fortunae Risus",
				text = {
					{
						"{C:cry_code}Rig{} all scored cards and a random",
						"{C:attention}Joker{} before each hand played",
					},
					{
						"{C:red}Fixed{} {C:green}1 in 6{} chance each hand to grant",
						"{C:dark_edition}+#1#{} {C:attention}Joker{} or consumable slot",
						"{C:inactive}(Currently {C:dark_edition}+#2#{}{C:attention} Joker{}{C:inactive} slot(s)",
						"{C:inactive}and {C:attention}+#3#{} {C:inactive}consumable slot(s))",
					},
				},
			},

			j_asc_duo = {
				name = "Sum Duo",
				text = {
					"If played hand contains a {C:attention}Pair{},",
					"{X:dark_edition,C:white}^#1#{} Mult and convert",
					"cards {C:attention}held in hand{} to the",
					"most common {C:attention}Rank{} in played hand",
				},
			},

			j_asc_trio = {
				name = "Sum Trio",
				text = {
					"If played hand contains a",
					"{C:attention}Three of a Kind{}, {X:dark_edition,C:white}^#1#{} Mult and",
					"convert cards {C:attention}held in hand{} to the",
					"most common {C:attention}Rank{} in played hand",
				},
			},

			j_asc_family = {
				name = "Sum Quattuor",
				text = {
					"If played hand contains a",
					"{C:attention}Four of a Kind{}, {X:dark_edition,C:white}^#1#{} Mult and",
					"convert cards {C:attention}held in hand{} to the",
					"most common {C:attention}Rank{} in played hand",
				},
			},

			j_asc_order = {
				name = "Sum Constituto",
				text = {
					"If played hand contains a {C:attention}Straight{},",
					"{X:dark_edition,C:white}^#1#{} Mult and convert",
					"cards {C:attention}held in hand{} to the {C:attention}Rank{}",
					"of each card in order of played hand",
				},
			},

			j_asc_tribe = {
				name = "Sum Carnes Unius",
				text = {
					"If played hand contains a {C:attention}Flush{},",
					"{X:dark_edition,C:white}^#1#{} Mult and convert",
					"cards {C:attention}held in hand{} to the",
					"most common {C:attention}Suit{} in played hand",
				},
			},

			j_asc_brainstorm = {
				name = "Magnum Opus",
				text = {
					{
						"Retrigger leftmost {C:attention}Joker{} by",
						"number of {C:attention}Jokers{} between it",
						"and this {C:attention}Joker{} inclusively",
					},
					{
						"At end of shop, create a {C:attention}Joker",
						"of same rarity as leftmost",
						"{C:inactive,s:0.9}(Cannot affect self; must have room)",
					},
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

			j_asc_bootstraps = {
				name = "Inflatio",
				text = {
					"{X:mult,C:white}X#2#{} Mult for every {C:money}$1{} you have",
					"Earn {C:money}$#3#{} at end of round",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult)",
				},
			},

			j_asc_canio = {
				name = "Thanatos",
				text = {
					"Gains {X:dark_edition,C:white}^#2#{} Mult per destroyed {C:attention}face{} card,",
					"destroyed {C:attention}face{} cards are returned to hand",
					"{C:inactive}(Currently {X:dark_edition,C:white}^#1#{}{C:inactive} Mult)",
				},
			},

			-----Cryptid-----
			j_asc_canvas = {
				name = "Oleum Pictura",
				text = {
					{
						"{C:attention}Retrigger{} all {C:attention}Jokers{} to the left",
						"once for {C:attention}every{} Joker{} including itself",
						"to the right of this Joker",
					},
					{
						"Creates a {C:dark_edition}Negative{} {C:attention,T:j_joker}Joker{}",
						"when exiting shop",
						"{C:inactive}(Does not need room)",
					},
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
					"by {C:attention}X#1#{} at the end of round",
					"{C:inactive}(Does not affect self)", -- oil lamp does not say "if possible," so why should this
				},
			},

			j_asc_hunting_season = {
				name = "Sine Fine Venari",
				text = {
					"If Hand contains odd number of cards above {C:attention}1{},",
					"{C:red}destroy{} the {C:attention}center{} card after scoring",
					"Remaining played cards gain {X:mult,C:white}XMult{}",
					"equal to {C:red}destroyed{} card's rank",
					"{C:inactive}(J = 11, Q = 12, K = 13, A = 14)",
					--divided by {C:attention}10{}",
				},
			},

			j_asc_code_joker = {
				name = "Transcriptio Virtualis",
				text = {
					{
						"Creates a {C:dark_edition}Negative{} {C:cry_code}Code Card{} when",
						"{C:attention}Blind{} is selected with {C:attention}#1#{} uses",
					},
					{
						"Increase uses by {C:attention}#2#{}",
						"at the end of {C:attention}Boss Blind{}",
					},
				},
			},

			-----Cryptid Mortals-----

			j_asc_b_cake = {
				name = "Birthday Cake",
				text = {
					"{C:chips}+#1#{} Chips",
					"{C:chips}-#2#{} Chips per {C:attention}reroll{}", -- see flash card for {c} formatting on "reroll" when used in reference to gaining/losing values
					"{C:green}Rerolls{} are free", -- see choas the clown for {c} formatting on "reroll" when used in reference to free rerolls
				},
			},

			j_asc_b_pie = {
				name = "Blueberry Pi",
				text = {
					"{X:chips,C:white}Xpi{} Chips if",
					"{C:attention}exactly{} #2#",
					"hands remaining",
				},
			},

			j_asc_orion_pax = {
				name = "Orion Pax",
				text = {
					"{X:mult,C:white}X#1#{} Mult if all cards",
					"in played hand are",
					"{C:attention}Aces{}, {C:attention}2s{}, {C:attention}3s{}, {C:attention}5s{}, or {C:attention}7s{}",
				},
			},

			j_asc_accomplice = {
				name = "Accomplice",
				text = {
					"Leftmost Joker gains {C:mult}+#1#{} Mult",
					"or {C:chips}+#2#{} Chips at end of round",
					"if it is a {C:attention}Type Mult{} or",
					"{C:attention}Type Chips{} Joker respectively",
				}
			},

			j_asc_exorcist = {
				name = "Exorcist",
				text = {
					"When a {X:cry_cursed,C:white}Cursed{} Joker is",
					"obtained, destroy it",
					"and create a {C:cry_candy}Candy{}",
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
					{
						"Retriggers {C:attention}Joker{} to the left",
						"for each copy of that {C:attention}Joker{} you own",
					},
					{
						"{C:attention}Duplicate Joker{} to right at end of shop",
						"{C:inactive}(Must have room)",
					},
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
			j_asc_marble_entr = {
				name = "Petrinos Vlemma",
				text = {
					{
						"Creates {C:attention}#2#{} {C:attention}Crimson Seal{}",
						"{C:dark_edition}Mosaic{} {C:attention}Stone{} cards when",
						"{C:attention}Blind{} is selected",
						"{C:inactive}(Max {C:attention}#4#{C:inactive} cards)",
					},
					{
						"Retrigger played {C:attention}Stone{}",
						"Cards {C:attention}#1#{} times",
						"{C:inactive}(Max {C:attention}#3#{C:inactive} retriggers)",
					},
					{
						"{C:attention}Stone{} cards in",
						"remaining deck can be",
						"{C:attention}bought{} and {C:attention}sold{} for {C:money}$#5#{}"  
					},
				},
			},
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
			asc_astronomica_compat = {
				name = "Astronomica Compat",
				text = {
					"Also gives {X:purple,C:white}Astronomica's{}",
					"{C:attention}Type Score{} Jokers",
					"{C:purple}+300{} Score"
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
			k_asc_banana = "Banana", --Banana Rariety Label
			asc_banana_ex = "Banana!",
			b_sell_stone = "-Stones",
			b_buy_stone = "+Stones",
			asc_mossaic_stone_cards = "Mossaic Stone Cards",
			asc_config = "Config",
			asc_config_insanity_mode = "Insanity Mode!!!",
		},
	},
}
