return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Enhanced={},
        Joker={
             ----Vanilla------
            j_asc_jimbo = {
            name = 'Balatro',
		    text = {
                --"{X:dark_edition,C:white}^#1#{} Mult"
                "{C:mult}+#1#{} Mult"
		    	}
		    },
		    j_asc_duo = {
            name = 'Sum Duo',
		    text = {
                "{X:dark_edition,C:white}^#1#{} Mult if played", 
                "hand contains",
                "a {C:attention}Pair{}"
		    	}
		    },
            j_asc_trio = {
            name = 'Sum Trio',
            text = {
                "{X:dark_edition,C:white}^#1#{} Mult if played", 
                "hand contains",
                "a {C:attention}Three of a Kind{}"
                }
            },
            j_asc_family = {
            name = 'Sum Quattuor',
            text = {
                "{X:dark_edition,C:white}^#1#{} Mult if played", 
                "hand contains",
                "a {C:attention}Four of a Kind{}"
                }
            },
		    j_asc_seltzer = {
            name = 'Bulla Aquae',
		    text = {
                "Retriggers all cards played {C:attention}#1#{} time(s)", 
                "Increase number of retriggers",
                "after {C:attention}#3#{} hands",
                "{C:inactive}(Hands until upgrade: {C:attention}#2#{C:inactive})"
		    	}
		    },
		    j_asc_midas = {
            name = 'Rex Midas',
		    text = {
                "All played cards become", 
                "{C:attention}Gold{} and {C:attention}Golden{} when scored,",
                "{C:attention}Gold{} cards held in hand",
                "give {X:dark_edition,C:white}^#1#{} Mult"
		    	}
		    },

            j_asc_scary = {
            name = 'Immanis Facies',
            text = {
                "Played face cards", 
                "give {X:dark_edition,C:white}^#1#{} Chips",
                "when scored"
                }
            },

            j_asc_abstract = {
            name = 'Aenigmatum',
            text = {
                "This Joker gains {X:dark_edition,C:white}^#2#{} Mult", 
                "for each {C:attention}Joker{} card,",
                "{C:inactive}(Currently {X:dark_edition,C:white}^#1#{} {C:inactive}Mult)"
                }
            },

            j_asc_oops = {
            name = 'Fortunae Risus',
            text = {
                "{C:cry_code}Rig{} all scored cards and a random", 
                "{C:attention}Joker{} before each hand played,",
                "fixed {C:attention}1{} in {C:attention}6{} chance to grant",
                "{C:dark_edition}+#1#{} Joker or consumable slot",
                --"{C:inactive}(Odds unchangeable with prob manip)",
                "{C:inactive}(Currently {C:dark_edition}+#2# J{}{C:inactive} and {C:dark_edition}+#3# C{}{C:inactive})"
                }
            },

            j_asc_golden = {
            name = 'Purus Aurum',
            text = {
                "{X:money,C:white}X#2#{} total money at end of round,",
                "{C:green}#1# in #4#{} chance to increase ",
                "multipler by {C:money}#3#{} each trigger"
                }
            },
			j_asc_greedy = {
				name = "Avarus",
				text = {
					"Played cards with {C:diamond}Diamond",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored",
				}
			},

			j_asc_lusty = {
				name = "Libido",
				text = {
					"Played cards with {C:heart}Heart",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored",
				}
			},

			j_asc_wrathful = {
				name = "Iram",
				text = {
					"Played cards with {C:spade}Spade",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored",
				}
			},

			j_asc_gluttonous = {
				name = "Gula",
				text = {
					"Played cards with {C:club}Club",
					"suit give {X:dark_edition,C:white}^#1#{} Mult",
					"when scored",
				}
			},

            ----Cryptid------
            j_asc_high_five = {
            name = 'Superioris Manus',
            text = {
                "Before scoring, if played hand", 
                "contains a scoring {C:attention}5{},",
                "convert {C:attention}all{} scored cards to {C:attention}5{}s",
                "They also become {C:dark_edition}Astral"
                }
            },
            j_asc_oil_lamp = {
            name = 'Lucerna',
            text = {
                "Increase values of all {C:attention}Jokers", 
                "by {C:attention}X#1#{} at the end of round.",
                "{C:inactive}(If possible, doesn't affect self)"
                }
            },

            ----Cryptid Mortals------
            j_asc_b_cake = {
            name = 'Birthday Cake',
            text = {
                "{C:chips}+#1#{} Chips", 
                "{C:chips}-#2#{} Chips per reroll,",
                "rerolls are free"
                }
            },
        },
        Other={},
        Planet={},
        Spectral={
            c_asc_ascension = {
                name = "Ascension",
                text = {
                    "Transforms viable {C:attention}Jokers{} to",
                    "their{C:cry_exotic,E:1} Exotic{} counterpart,",
                    "destroy all other {C:attention}Jokers{}",
                },
            },
        },
		Code={},
        Stake={},
        Tag={},
        Tarot={},
        Voucher={},
    	misc = {},
	}
}
