return {
	descriptions = {
		Mod = {
			Ascensio = {
				name = "Ascēnsiō",
				text = {
					"{C:cry_exotic,E:1,s:1.6}Exoticfy your Jokers!{}",
					"{s:1.3}Adds {C:cry_exotic,E:1,s:1.3}Exotic{s:1.3} forms to normal Jokers",
					"{s:1.3}and vice versa",
					"{s:1.2} {}",
					"{s:1.4,C:attention}Special thanks to:{}",
					"{s:0.5} ",
					"{X:asc_tattered,C:black,s:1.2}Tatteredlurker{}     {X:asc_slipstream,C:black,s:1.2}Lil_Mr._Slipstream{}", --I know B: should be used, but it isnt working
					"{C:asc_tattered,s:0.8}Art                           {C:asc_slipstream,s:0.8}Art   ",
					"{s:0.2} ",
					" {X:asc_glitchkat,C:white,s:1.2}Glitchkat10{}       {X:asc_somethingcom515,C:white,s:1.2}Somethingcom515{}",
					"{C:asc_glitchkat,s:0.8}Coding, Idea Aproval{}            {C:asc_somethingcom515,s:0.8}Coding        ",
					"{s:0.2} ",
					"   {X:asc_hssr,C:black,s:1.2}hssr{}             {X:asc_omega,C:black,s:1.2}OmegaLife{}  ",
					"{C:asc_hssr,s:0.8}Ideas, Suggestion Sheet Creation{}      {C:asc_omega,s:0.8}Coding, Ideas          ",
					"{s:0.2} ",
					"     {X:asc_oinite,C:white,s:1.2}Oinite12{}           {X:asc_hexa,C:black,s:1.2}HexaCryonic{}    ",
					"  {C:asc_oinite,s:0.8}Art, Animation Framework{}         {C:asc_hexa,s:0.8}Art, Coding          ",
					"{X:asc_grahkon,C:asc_grahkon_bg,s:1.2}Grahkon{}",
					"{C:asc_grahkon_bg,s:0.8}Art, Ideas{}",
					"{s:1.0} ",
					"{s:1.1}And the rest of the Cryptid and Ascensio Discords!",
				},
			},
		},
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
					{
						"Played cards with {C:diamond}Diamond{} suit",
						"give {X:dark_edition,C:white}^#1#{} Mult when scored",
					},
					{
						"Gains {X:dark_edition,C:white}^#2#{} Mult for",
						"every {C:money}${} earned",
					},
				},
			},

			j_asc_lusty = {
				name = "Libido",
				text = {
					{
						"Played cards with {C:heart}Heart{} suit",
						"give {X:dark_edition,C:white}^#1#{} Mult when scored",
					},
					{
						"{C:green}#2# in #3#{} chance for scored",
						"{C:heart}Hearts{} to give adjacent",
						"{C:heart}Hearts{} {C:attention}#4#{} extra trigger",
						"{C:inactive}(Max {C:attention}#5#{} {C:inactive}retriggers)",
					},
				},
			},

			j_asc_wrathful = {
				name = "Iram",
				text = {
					{
						"Played cards with {C:spade}Spade{} suit",
						"give {X:dark_edition,C:white}^#1#{} Mult when scored",
					},
					{
						"{C:green}#3# in #4#{} chance for scored {C:spade}Spades{}",
						"to {C:attention}destroy{} a non-{C:spade}Spade{} card",
						"held in hand and add {X:dark_edition,C:white}^#2#{} Mult",
						"to this Joker at end of hand",
					},
				},
			},

			j_asc_gluttonous = {
				name = "Gula",
				text = {
					{
						"Played cards with {C:club}Club{} suit",
						"give {X:dark_edition,C:white}^#1#{} Mult when scored",
					},
					{
						"Cards with {C:club}Club{} suit",
						"{C:attention}held in hand{} also score",
					},
				},
			},

			j_asc_jolly = {
				name = "Iocosum",
				text = {
					{
						"Gains {X:mult,C:white}X#1#{} Mult",
						"per {C:attention}consecutive{}",
						"{C:attention}#3#{} that is played",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
					},
					{
						"Levels up {C:attention}#3#{} by",
						"the {C:attention}highest rank{} in",
						"hand at end of round",
					},
				},
			},

			j_asc_zany = {
				name = "Eccentricus",
				text = {
					{
						"Gains {X:mult,C:white}X#1#{} Mult per {C:attention}consecutive{}",
						"{C:attention}#3#{} that is played",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
					},
					{
						"Levels up {C:attention}#3#{} by",
						"the {C:attention}highest rank{} in",
						"hand at end of round",
					},
				},
			},

			j_asc_mad = {
				name = "Insanus",
				text = {
					{
						"Gains {X:mult,C:white}X#1#{} Mult",
						"per {C:attention}consecutive{}",
						"{C:attention}#3#{} that is played",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
					},
					{
						"Levels up {C:attention}#3#{} by",
						"the {C:attention}highest rank{} in",
						"hand at end of round",
					},
				},
			},

			j_asc_crazy = {
				name = "Obscuritas",
				text = {
					{
						"Gains {X:mult,C:white}X#1#{} Mult",
						"per {C:attention}consecutive{}",
						"{C:attention}#3#{} that is played",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
					},
					{
						"Levels up {C:attention}#3#{} by",
						"the {C:attention}highest rank{} in",
						"hand at end of round",
					},
				},
			},

			j_asc_droll = {
				name = "Ludibrium",
				text = {
					{
						"Gains {X:mult,C:white}X#1#{} Mult",
						"per {C:attention}consecutive{}",
						"{C:attention}#3#{} that is played",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
					},
					{
						"Levels up {C:attention}#3#{} by",
						"the {C:attention}highest rank{} in",
						"hand at end of round",
					},
				},
			},

			j_asc_sly = {
				name = "Dolosus",
				text = {
					{
						"Gains {X:chips,C:white}X#1#{} Chips",
						"per {C:attention}consecutive{}",
						"{C:attention}#3#{} that is played",
						"{C:inactive}(Currently {X:chips,C:white}X#2#{}{C:inactive} Chips)",
					},
					{
						"Levels up {C:attention}#3#{} by",
						"the {C:attention}highest rank{} in",
						"hand at end of round",
					},
				},
			},

			j_asc_wily = {
				name = "Versutus",
				text = {
					{
						"Gains {X:chips,C:white}X#1#{} Chips per {C:attention}consecutive{}",
						"{C:attention}#3#{} that is played",
						"{C:inactive}(Currently {X:chips,C:white}X#2#{}{C:inactive} Chips)",
					},
					{
						"Levels up {C:attention}#3#{} by",
						"the {C:attention}highest rank{} in",
						"hand at end of round",
					},
				},
			},

			j_asc_clever = {
				name = "Calliditas",
				text = {
					{
						"Gains {X:chips,C:white}X#1#{} Chips",
						"per {C:attention}consecutive{}",
						"{C:attention}#3#{} that is played",
						"{C:inactive}(Currently {X:chips,C:white}X#2#{}{C:inactive} Chips)",
					},
					{
						"Levels up {C:attention}#3#{} by",
						"the {C:attention}highest rank{} in",
						"hand at end of round",
					},
				},
			},

			j_asc_devious = {
				name = "Impietas",
				text = {
					{
						"Gains {X:chips,C:white}X#1#{} Chips",
						"per {C:attention}consecutive{}",
						"{C:attention}#3#{} that is played",
						"{C:inactive}(Currently {X:chips,C:white}X#2#{}{C:inactive} Chips)",
					},
					{
						"Levels up {C:attention}#3#{} by",
						"the {C:attention}highest rank{} in",
						"hand at end of round",
					},
				},
			},

			j_asc_crafty = {
				name = "Astutia",
				text = {
					{
						"Gains {X:chips,C:white}X#1#{} Chips",
						"per {C:attention}consecutive{}",
						"{C:attention}#3#{} that is played",
						"{C:inactive}(Currently {X:chips,C:white}X#2#{}{C:inactive} Chips)",
					},
					{
						"Levels up {C:attention}#3#{} by",
						"the {C:attention}highest rank{} in",
						"hand at end of round",
					},
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

			j_asc_wee = {
				name = "Scurra Microscopica",
				text = {
					"This Joker gains {X:dark_edition,C:edition}^^#2#{} {C:chips}Chips{}",
					"when each played {C:attention}2{} is scored",
					"{C:inactive}(Currently{} {X:dark_edition,C:edition}^^#1#{}{C:inactive} Chips){}",
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
					"Gains {X:dark_edition,C:white}^#2#{} Mult at",
					"end of round when {C:attention}0{}",
					"discards remaining",
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

			j_asc_loyalty_card = {
				name = "Emptor Fidelis",
				text = {
					"{X:mult,C:white}X#1#{}",
					"{C:attention}X#2#{} for every {C:attention}#4#{} {C:inactive}[#3#]{} hands played",
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
						"Resets each hand played",
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
					"{X:dark_edition,C:white}^#2#{} Mult for",
					"each {C:attention}Joker{} card",
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

			j_asc_supernova = {
				name = "Singularitas",
				text = {
					"Gain the number of times current",
					"{C:attention}poker hand{} has been played",
					"this run as {X:mult,C:white}XMult{}",
					"{C:inactive}(Currently{} {X:mult,C:white}X#1#{}{C:inactive}){}",
				},
			},

			j_asc_space = {
				name = "Solutus",
				text = {
					"Upgrade level of current played",
					"{C:attention}poker hand{} by {X:dark_edition,C:white}#1#{}",
					"for each {C:attention}hand played{} this {C:attention}Ante{}",
					"{C:inactive}(Reset when a {C:attention}Boss blind{} {C:inactive}is{} {C:attention}defeated{}{C:inactive}){}",
					"{C:inactive}(Currently {X:dark_edition,C:white}#2#{} {C:inactive}hand played){}",
				},
			},

			j_asc_egg = {
				name = "Cunae",
				text = {
					{
						"At the {C:attention}end of round{}, gain",
						"{X:dark_edition,C:white}X#1#{} of self's {C:attention}sell value{}",
					},
					{
						"At the {C:attention}start of round{}, gain",
						"self's sell value's rounded up",
						"standard logarithm as {X:mult,C:white}XMult{}",
						"{C:inactive}(Currently{} {X:mult,C:white}X#2#{}{C:inactive}){}",
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
					"{C:inactive}(Currently {C:attention}#3#{C:inactive} hands played)",
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
						"This Joker gains {X:dark_edition,C:white}^#2#{} Mult",
						"every time a {C:attention}playing card{} is",
						"added to deck or destroyed",
						"{C:inactive}(Currently{} {X:dark_edition,C:white}^#3#{} {C:inactive}Mult){}",
					},
					{
						"Before {C:attention}first hand{} of round,",
						"this Joker creates {C:attention}#1#{} copy",
						"of last scored {C:attention}playing card{}",
						"{C:inactive}(Max{} {C:attention}#4#{} {C:inactive}cards created){}",
					},
				},
			},

			j_asc_obelisk = {
				name = "Obeliscus Calumniatus",
				text = {
					"This Joker gains {X:mult,C:white}XMult{} equal to",
					"{C:attention}consecutive{}",
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
					"gain {X:money,C:white}X#1#{} that amount",
				},
			},

			j_asc_golden = {
				name = "Purus Aurum",
				text = {
					"{X:money,C:white}X#2#{} total money at end of round,",
					"{C:green}#1# in #4#{} chance to increase ",
					"multiplier by {X:money,C:white}X#3#{} each payout", -- hello everybody my name is multiplier
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
						"Retriggers all cards",
						"played {C:attention}#1#{} time(s)",
						"{C:inactive}(Max {C:attention}#4#{} {C:inactive}retriggers)",
					},
					{
						"Increase retriggers",
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

			j_asc_mr_bones = {
				name = "Carcer Animarum",
				text = {
					{
						"{C:attention}Once{} every {C:attention}#5#{} rounds {C:attention}beaten{} {C:inactive}[#6#]{},",
						"prevent {C:attention}Death{} if chips scored",
						"are at least {C:attention}#1#%{} of required Chips",
						"{C:inactive}(Currently #3#){}",
					},
					{
						"Whenever you {C:attention}lose{} to a blind",
						"gain {X:dark_edition,C:edition}^^#2#{} Chips",
						"{C:inactive}(Currently{} {X:dark_edition,C:edition}^^#4#{}{C:inactive}){}",
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
					{
						"{C:attention}All{} cards count as",
						"every {C:attention}suit{} and every {C:attention}rank{}",
					},
					{
						"Cards with a suit or a rank",
						"{C:attention}cannot{} be debuffed",
					},
				},
			},

			j_asc_throwback = {
				name = "Desiderium",
				text = {
					"{X:mult,C:white}X(n^#3#){} Mult for each",
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
						"Retriggers {C:attention}Joker{} to",
						"the right for each copy of",
						"that {C:attention}Joker{} you own",
					},
					{
						"{C:attention}Duplicate Joker{} to right",
						"at end of shop",
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
						"{C:red}Fixed{} {C:green}1 in 6{} chance each hand to",
						"grant {C:dark_edition}+#1#{} {C:attention}Joker{} or consumable slot",
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
					"{C:attention}X#2#{} for every {C:attention}modification{}",
					"in remaining deck",
				},
			},

			j_asc_bootstraps = {
				name = "Inflatio",
				text = {
					{
						"{X:mult,C:white}X#2#{} Mult for every",
						"{C:money}$1{} you have",
						"{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult)",
					},
					{
						"Earn {C:money}$#3#{} at",
						"end of round",
					},
				},
			},

			j_asc_canio = {
				name = "Thanatos",
				text = {
					{
						"Gains {X:dark_edition,C:white}^#2#{} Mult per",
						"destroyed {C:attention}face{} card",
						"{C:inactive}(Currently {X:dark_edition,C:white}^#1#{}{C:inactive} Mult)",
					},
					{
						"Destroyed {C:attention}face{} cards",
						"are returned to hand",
					},
				},
			},

			j_asc_seance = {
				name = "Praesagium",
				text = {
					{
						"If played hand is a {C:attention}#2#{},",
						"{C:red}fixed{} {C:green}1 in #3#{} chance to create",
						"{C:attention}#1#{} {C:dark_edition}Negative Rare{} consumable",
						"{C:inactive,s:0.8}(Poker hand changes at end of round){}",
					},
					{
						"When the above probabilites {C:attention}fails{},",
						"{C:attention}double{} the chance of creating",
						"{C:attention}#1#{} {C:dark_edition}Negative Rare{} consumable",
						"Otherwise, {C:attention}reset the probabilites{}",
					},
				},
			},

			-----Cryptid-----
			j_asc_canvas = {
				name = "Pictura Olei",
				text = {
					{
						"{C:attention}Retrigger{} all {C:attention}Jokers{} to",
						"the left once for {C:attention}every{}",
						"Joker{} {C:inactive}(including itself){} to",
						"the right of this Joker",
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
				name = "Manus Superior",
				text = {
					"Before scoring, if played",
					"hand contains a scoring {C:attention}5{},",
					"convert {C:attention}all{} scored",
					"cards to {C:dark_edition}Astral {C:attention}5{}s",
				},
			},

			j_asc_oil_lamp = {
				name = "Lucerna",
				text = {
					"Increase values of all",
					"{C:attention}Jokers{} by {C:attention}X#1#{}",
					"at the end of round",
					"{C:inactive}(Does not affect self)", -- oil lamp does not say "if possible," so why should this
				},
			},

			j_asc_hunting_season = {
				name = "Sine Fine Venari",
				text = {
					"If Hand contains odd number of",
					"cards above {C:attention}1{}, {C:red}destroy{} the",
					"{C:attention}center{} card after scoring",
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
						"Creates a {C:dark_edition}Negative{} {C:cry_code}Code Card{} with",
						"{C:attention}#1#{} uses when {C:attention}Blind{} is selected",
					},
					{
						"Increase uses by {C:attention}#2#{} when",
						"a {C:attention}Boss Blind{} is {C:attention}defeated{}",
					},
				},
			},

			j_asc_chad = {
				name = "Vir Inter Homines",
				text = {
					{
						"Retrigger {C:attention}leftmost{} and",
						"{C:attention}rightmost{} Jokers {C:attention}#5#{} times and",
						"{C:attention}once{} for each {C:attention}empty{} Joker slot",
						"{C:inactive}(Currently{} {C:attention}#1#{} {C:inactive}retriggers){}",
						"{C:inactive}(Max{} {C:attention}#2#{} {C:inactive}retriggers){}",
					},
					{
						"Gains {C:dark_edition}+#3#{} {C:attention}Joker{} slots",
						"at end of shop",
						"{C:inactive}(Currently{} {C:dark_edition}+#4#{} {C:inactive}Joker slots){}",
					},
				},
			},

			j_asc_sync_catalyst = {
				name = "Fusio Nuclearis",
				text = {
					{
						"At the {C:attention}start of round{},",
						"balances {C:chips}hands{} with {C:mult}discards{} and",
						"self's {X:dark_edition,C:white}^Chips{} with self's {X:dark_edition,C:white}^Mult{}",
						"{C:inactive}(Currently{} {X:dark_edition,C:white}^#2#{} {C:inactive}Chips and{} {X:dark_edition,C:white}^#1#{} {C:inactive}Mult){}",
					},
					{
						"Balance {C:chips}Chips{} and {C:mult}Mult{}",
						"at the {C:attention}final{} scoring step",
					},
					{
						"Whenever a {C:attention}Boss Blind{} is",
						"{C:attention}defeated{}, gains {X:dark_edition,C:white}^#3#{} {C:mult}Mult{}",
					},
				},
			},
			-----Cryptid Mortals-----

			j_asc_copy_cat = {
				name = "Copy Cat",
				text = {
					{
						"Retrigger all cards",
						"played {C:attention}#2#{} time(s)",
						"{C:inactive}(Max {C:attention}#3#{}{C:inactive} retriggers)",
					},
					{
						"Each played card gives",
						"{C:mult}+#1#{} Mult when scored",
					},
				},
			},

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
				},
			},

			j_asc_duane = {
				name = "Dubious Duane",
				text = {
					"This Joker gains {C:mult}+#2#{} Mult",
					"when a {C:attention}Joker{} is scored",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
				},
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
						"Retriggers {C:attention}Joker{} to",
						"the left for each copy of",
						"that {C:attention}Joker{} you own",
					},
					{
						"{C:attention}Duplicate Joker{} to left",
						"at end of shop",
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

			j_asc_chuckle_cola = {
				name = "Cachinno Bulla",
				text = {
					{
						"Multiply the {C:blue}Chips{} of",
						"{C:attention}scored{} cards by {X:blue,C:white}X#1#{}",
					},
					{
						"After scoring {C:attention}#2#{}",
						"cards, increase multiplier",
						"by {X:blue,C:white}X#3#{} and {C:attention}double{}",
						"card scoring requirement",
					},
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
						"{C:attention}bought{} and {C:attention}sold{} for {C:money}$#5#{}",
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

			j_asc_beyond_jimbo = {
				name = "{s:4}The One Above All{}",
				text = {
					"{X:dark_edition,C:white,s:8}#1#{} {C:mult}Mult{}",
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
			asc_astronomica_compat = { --Displays astronomica compact effect for Accomplice
				name = "Astronomica Compat",
				text = {
					"Also gives {X:purple,C:white}Astronomica's{}",
					"{C:attention}Type Score{} Jokers",
					"{C:purple}+300{} Score",
				},
			},
			asc_cyclic = {
				name = "Cyclic",
				text = {
					"Rotates between its {C:cry_exotic,E:1}Ascendant{}",
					"version, regular version and",
					"being {C:red}debuffed{} every round",
				},
			},
			asc_fixed = {
				name = "Fixed",
				text = {
					"{C:attention}Listed{} {C:green,E:1}probabilites{}",
					"can not be altered",
				},
			},
			--Special Thanks Descriptions
			asc_tatterd = {
				name = "Tattered Credits",
				text = {
					"Artist",
				},
			},
		},
		Planet = {},
		Sleeve = {
			sleeve_asc_starlight = {
				name = "Starlight Sleeve",
				text = {
					"Start with an {C:cry_exotic,T:c_asc_ascension}Ascension{C:attention} Card",
					"Jokers are {C:attention}20X{} more",
					"likely to be {C:dark_edition}Negative{}",
					"{C:attention}-2{} Joker slots",
				},
			},

			sleeve_asc_starlight_alt = {
				name = "Starlight Sleeve",
				text = {
					"Jokers are {C:attention}10X{} more",
					"likely to be {C:dark_edition}Negative{}",
					"{C:attention}-1{} Joker slots",
				},
			},
		},
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
		Numina = {
			c_asc_samsara = {
				name = "Samsara",
				text = {
					"Select a Joker",
					"to become {C:cry_exotic,E:1}Cylcic{}",
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
					"{C:inactive,s:0.6}Starlight, starbright,{}",
					"{C:inactive,s:0.6}First star I see tonight;{}",
					"{C:inactive,s:0.6} I wish I may, I wish I might{}",
					"{C:inactive,s:0.6}have the wish I wish tonight{}",
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
			asc_inactive = "Inactive", --For exotic Bones
			asc_saved_by_bones = "Saved by Carcer Animarum",
			asc_chips = "Chips", --To make hyperoperators work
			asc_mult = "Mult",
			asc_seance_msg = "The World is not here...",
			k_numina = "Numina", --Numina Labels
			b_numina_cards = "Numina Cards",
			asc_wish_ex = "I Wish!", --Superior Manus Effect
			b_sell_stone = "-Stones",
			b_buy_stone = "+Stones",
			asc_mossaic_stone_cards = "Mossaic Stone Cards",
			asc_special_thanks = "Special Thanks",
			asc_config_insanity_mode = "Insanity Mode!!!",
			asc_config_insanity_explanation = "Stops Gateway and Ascension from destroying Jokers",
		},
		labels = {
			numina = "Numina",
			k_asc_transcendent = "Transcendental",
		},
	},
}
