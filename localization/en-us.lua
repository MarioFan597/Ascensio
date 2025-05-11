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
					"empty Joker Slot at end of round",
					"Gains {C:dark_edition}+#4#{} Joker Slots at end of shop",
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

			j_asc_misprint = {
				name = "Defectus",
				text = {
					"",
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
					"for each {C:attention}Joker{} card,",
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
					"multipler by {C:money}#3#{} each trigger"
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

			j_asc_oops = {
				name = "Fortunae Risus",
				text = {
					"{C:cry_code}Rig{} all scored cards and a random", 
					"{C:attention}Joker{} before each hand played,",
					"{C:red}fixed{} {C:green}1 in 6{} chance to grant",
					"{C:dark_edition}+#1#{} Joker or consumable slot",
					"{C:inactive}(Currently {C:dark_edition}+#2# J{}{C:inactive} and {C:dark_edition}+#3# C{}{C:inactive})"
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

			j_asc_drivers_license = {
				name = "Identitatis Discrimine",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
					"{C:attention}Doubles{} for every {C:attention}Modification{}",
					"in remaining deck"
				}
			},

			j_asc_thanatos = {
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
					"{X:money,C:white}X#1#{} total money if played hand,",
					"contains an {C:attention}Ace{} or {C:attention}7{}"
				}
			},

			j_asc_high_five = {
				name = "Superioris Manus",
				text = {
					"Before scoring, if played hand", 
					"contains a scoring {C:attention}5{},",
					"convert {C:attention}all{} scored cards to {C:attention}5{}s",
					"They also become {C:dark_edition}Astral"
				}
			},

			j_asc_oil_lamp = {
				name = "Lucerna",
				text = {
					"Increase values of all {C:attention}Jokers", 
					"by {C:attention}X#1#{} at the end of round.",
					"{C:inactive}(If possible, doesn't affect self)"
				}
			},

			-----Cryptid Mortals-----
			j_asc_b_cake = {
				name = "Birthday Cake",
				text = {
					"{C:chips}+#1#{} Chips", 
					"{C:chips}-#2#{} Chips per reroll,",
					"rerolls are free"
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
