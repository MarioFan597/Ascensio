return {
    descriptions = {
        Mod = {
            Ascensio = {
                name = "升华 (Ascēnsiō)",
                text = {
                    "{C:cry_exotic,E:1,s:1.6}让你的小丑牌域外化！{}",
                    "{s:1.3}为普通小丑牌添加 {C:cry_exotic,E:1,s:1.3}域外{s:1.3} 形态",
                    "{s:1.3}反之亦然",
                    "{s:1.2} {}",
                    "{s:1.4,C:attention}特别鸣谢：{}",
                    "{s:0.5} ",
                    "{X:asc_tattered,C:black,s:1.2}Tatteredlurker{}     {X:asc_slipstream,C:black,s:1.2}Lil_Mr._Slipstream{}", 
                    "{C:asc_tattered,s:0.8}美术                           {C:asc_slipstream,s:0.8}美术   ",
                    "{s:0.2} ",
                    " {X:asc_glitchkat,C:white,s:1.2}Glitchkat10{}       {X:asc_somethingcom515,C:white,s:1.2}Somethingcom515{}",
                    "{C:asc_glitchkat,s:0.8}代码、点子核准{}            {C:asc_somethingcom515,s:0.8}代码        ",
                    "{s:0.2} ",
                    "   {X:asc_hssr,C:black,s:1.2}hssr{}             {X:asc_omega,C:black,s:1.2}Rhelvetican{}  ",
                    "{C:asc_hssr,s:0.8}点子、建议表制作{}      {C:asc_omega,s:0.8}代码、点子          ",
                    "{s:0.2} ",
                    "     {X:asc_oinite,C:white,s:1.2}Oinite12{}           {X:asc_hexa,C:black,s:1.2}HexaCryonic{}    ",
                    "  {C:asc_oinite,s:0.8}美术、动画框架{}         {C:asc_hexa,s:0.8}美术、代码          ",
                    "{X:asc_grahkon,C:asc_grahkon_bg,s:1.2}Grahkon{}",
                    "{C:asc_grahkon_bg,s:0.8}美术、点子{}",
                    "{s:1.0} ",
                    "{s:1.1}以及 Cryptid 和 Ascensio Discord 社区的各位！",
                },
            },
        },
        Blind = {},
        Edition = {},
        Enhanced = {},

        ---@type {[string]: { name: string|string[], text: string[]|string[][] }}
        Joker = {
            -----Vanilla-----
            j_asc_jimbo = {
                name = "巴拉特罗 (Balatro)",
                text = {
                    "{C:mult}+#1#{} 倍率",
                },
            },

            j_asc_greedy = {
                name = "贪婪 (Avarus)",
                text = {
                    {
                        "打出的 {C:diamond}方块{} 牌计分时",
                        "提供 {X:asc_emult,C:white}^#1#{} 倍率",
                    },
                    {
                        "每获得 {C:money}$1{}",
                        "增加 {X:asc_emult,C:white}^#2#{} 倍率",
                    },
                },
            },

            j_asc_lusty = {
                name = "色欲 (Libido)",
                text = {
                    {
                        "打出的 {C:heart}红桃{} 牌计分时",
                        "提供 {X:asc_emult,C:white}^#1#{} 倍率",
                    },
                    {
                        "计分的 {C:hearts}红桃{} 有 {C:green}#2# / #3#{} 的几率",
                        "使相邻的 {C:hearts}红桃{} {C:attention}额外触发 #4#{} 次",
                        "{C:inactive}(最高 {C:attention}#5#{} {C:inactive}次重新触发)",
                    },
                },
            },

            j_asc_wrathful = {
                name = "暴怒 (Iram)",
                text = {
                    {
                        "打出的 {C:spade}黑桃{} 牌计分时",
                        "提供 {X:asc_emult,C:white}^#1#{} 倍率",
                    },
                    {
                        "计分的 {C:spade}黑桃{} 有 {C:green}#3# / #4#{} 的几率",
                        "{C:attention}摧毁{} 一张手中持有的非 {C:spade}黑桃{} 牌",
                        "并在出牌结束时使此小丑牌",
                        "增加 {X:asc_emult,C:white}^#2#{} 倍率",
                    },
                },
            },

            j_asc_gluttonous = {
                name = "暴食 (Gula)",
                text = {
                    {
                        "打出的 {C:club}梅花{} 牌计分时",
                        "提供 {X:asc_emult,C:white}^#1#{} 倍率",
                    },
                    {
                        "{C:attention}留在手中{} 的",
                        "{C:club}梅花{} 牌也会参与计分",
                    },
                },
            },

            j_asc_jolly = {
                name = "诙谐 (Iocosum)",
                text = {
                    {
                        "每 {C:attention}连续{} 打出",
                        "一次 {C:attention}#3#{}，",
                        "获得 {X:mult,C:white}X#1#{} 倍率",
                        "{C:inactive}(当前为 {X:mult,C:white}X#2#{}{C:inactive} 倍率)",
                    },
                    {
                        "在回合结束时，将 {C:attention}#3#{} 升级",
                        "等同于手中 {C:attention}最高点数{} 的数值",
                    },
                },
            },

            j_asc_zany = {
                name = "古怪 (Eccentricus)",
                text = {
                    {
                        "每 {C:attention}连续{} 打出",
                        "一次 {C:attention}#3#{}，",
                        "获得 {X:mult,C:white}X#1#{} 倍率",
                        "{C:inactive}(当前为 {X:mult,C:white}X#2#{}{C:inactive} 倍率)",
                    },
                    {
                        "在回合结束时，将 {C:attention}#3#{} 升级",
                        "等同于手中 {C:attention}最高点数{} 的数值",
                    },
                },
            },

            j_asc_mad = {
                name = "疯狂 (Insanus)",
                text = {
                    {
                        "每 {C:attention}连续{} 打出",
                        "一次 {C:attention}#3#{}，",
                        "获得 {X:mult,C:white}X#1#{} 倍率",
                        "{C:inactive}(当前为 {X:mult,C:white}X#2#{}{C:inactive} 倍率)",
                    },
                    {
                        "在回合结束时，将 {C:attention}#3#{} 升级",
                        "等同于手中 {C:attention}最高点数{} 的数值",
                    },
                },
            },

            j_asc_crazy = {
                name = "晦暗 (Obscuritas)",
                text = {
                    {
                        "每 {C:attention}连续{} 打出",
                        "一次 {C:attention}#3#{}，",
                        "获得 {X:mult,C:white}X#1#{} 倍率",
                        "{C:inactive}(当前为 {X:mult,C:white}X#2#{}{C:inactive} 倍率)",
                    },
                    {
                        "在回合结束时，将 {C:attention}#3#{} 升级",
                        "等同于手中 {C:attention}最高点数{} 的数值",
                    },
                },
            },

            j_asc_droll = {
                name = "滑稽 (Ludibrium)",
                text = {
                    {
                        "每 {C:attention}连续{} 打出",
                        "一次 {C:attention}#3#{}，",
                        "获得 {X:mult,C:white}X#1#{} 倍率",
                        "{C:inactive}(当前为 {X:mult,C:white}X#2#{}{C:inactive} 倍率)",
                    },
                    {
                        "在回合结束时，将 {C:attention}#3#{} 升级",
                        "等同于手中 {C:attention}最高点数{} 的数值",
                    },
                },
            },

            j_asc_sly = {
                name = "狡诈 (Dolosus)",
                text = {
                    {
                        "每 {C:attention}连续{} 打出",
                        "一次 {C:attention}#3#{}，",
                        "获得 {X:chips,C:white}X#1#{} 筹码",
                        "{C:inactive}(当前为 {X:chips,C:white}X#2#{}{C:inactive} 筹码)",
                    },
                    {
                        "在回合结束时，将 {C:attention}#3#{} 升级",
                        "等同于手中 {C:attention}最高点数{} 的数值",
                    },
                },
            },

            j_asc_wily = {
                name = "诡计 (Versutus)",
                text = {
                    {
                        "每 {C:attention}连续{} 打出",
                        "一次 {C:attention}#3#{}，",
                        "获得 {X:chips,C:white}X#1#{} 筹码",
                        "{C:inactive}(当前为 {X:chips,C:white}X#2#{}{C:inactive} 筹码)",
                    },
                    {
                        "在回合结束时，将 {C:attention}#3#{} 升级",
                        "等同于手中 {C:attention}最高点数{} 的数值",
                    },
                },
            },

            j_asc_clever = {
                name = "聪慧 (Calliditas)",
                text = {
                    {
                        "每 {C:attention}连续{} 打出",
                        "一次 {C:attention}#3#{}，",
                        "获得 {X:chips,C:white}X#1#{} 筹码",
                        "{C:inactive}(当前为 {X:chips,C:white}X#2#{}{C:inactive} 筹码)",
                    },
                    {
                        "在回合结束时，将 {C:attention}#3#{} 升级",
                        "等同于手中 {C:attention}最高点数{} 的数值",
                    },
                },
            },

            j_asc_devious = {
                name = "曲折 (Impietas)",
                text = {
                    {
                        "每 {C:attention}连续{} 打出",
                        "一次 {C:attention}#3#{}，",
                        "获得 {X:chips,C:white}X#1#{} 筹码",
                        "{C:inactive}(当前为 {X:chips,C:white}X#2#{}{C:inactive} 筹码)",
                    },
                    {
                        "在回合结束时，将 {C:attention}#3#{} 升级",
                        "等同于手中 {C:attention}最高点数{} 的数值",
                    },
                },
            },

            j_asc_crafty = {
                name = "狡猾 (Astutia)",
                text = {
                    {
                        "每 {C:attention}连续{} 打出",
                        "一次 {C:attention}#3#{}，",
                        "获得 {X:chips,C:white}X#1#{} 筹码",
                        "{C:inactive}(当前为 {X:chips,C:white}X#2#{}{C:inactive} 筹码)",
                    },
                    {
                        "在回合结束时，将 {C:attention}#3#{} 升级",
                        "等同于手中 {C:attention}最高点数{} 的数值",
                    },
                },
            },

            j_asc_half = {
                name = "一分为二 (Scinditur In Duos)",
                text = {
                    {
                        "如果打出的手牌包含",
                        "{C:attention}#2#{} 张或更少的牌，",
                        "提供 {X:dark_edition,C:edition}^^#1#{} 倍率",
                    },
                },
            },

            j_asc_stencil = {
                name = "空洞 (Inanis)",
                text = {
                    {
                        "在回合结束时，每个",
                        "空置的 {C:attention}小丑牌{} 槽位",
                        "提供 {X:mult,C:white}X#2#{} 倍率",
                        "{C:inactive}(当前为 {}{X:mult,C:white}X#1#{}{C:inactive} 倍率)",
                    },
                    {
                        "在商店结束时，",
                        "获得 {C:dark_edition}+#4#{} {C:attention}小丑牌{} 槽位",
                        "{C:inactive}(当前为 {}{C:dark_edition}+#3#{C:inactive} 小丑牌槽位)",
                    },
                },
            },

            j_asc_four_fingers = {
                name = "断手 (Truncus Manus)",
                text = {
                    "所有 {C:attention}同花{} 和 {C:attention}顺子{} 都可以",
                    "用 {C:attention}2{} 张牌组成",
                    "多余的牌将转化为",
                    "升华力量(Ascension Power)",
                },
            },

            j_asc_wee = {
                name = "微观弄臣 (Scurra Microscopica)",
                text = {
                    "每当一张打出的 {C:attention}2{} 计分时，",
                    "此小丑牌获得 {X:dark_edition,C:edition}^^#2#{} {C:chips}筹码{}",
                    "{C:inactive}(当前为{} {X:dark_edition,C:edition}^^#1#{}{C:inactive} 筹码){}",
                },
            },

            j_asc_mime = {
                name = "死寂 (Silentium)",
                text = {
                    {
                        "游戏牌上的 {C:dark_edition}版本{} 效果",
                        "将转变为",
                        "留在手中的效果",
                    },
                    {
                        "{C:attention}重新触发{} 所有",
                        "留在手中的牌一次",
                    },
                    {
                        "{C:attention}重新触发{} 所有带有版本的",
                        "游戏牌一次",
                    },
                },
            },

            j_asc_credit_card = {
                name = "债务承担 (Debitum Accepi)",
                text = {
                    "最多允许负债 {C:red}-$#1#{}",
                    "离开商店时，你每有1美元的负债",
                    "就会获得 {X:chips,C:white}X#3#{} 筹码",
                    "{C:inactive}(当前为 {X:chips,C:white}X#2#{}{C:inactive} 筹码)",
                },
            },

            j_asc_ceremonial = {
                name = "断柄 (Fractus Capulo)",
                text = {
                    "选择盲注时，有 {C:green}#1# / #2#{} 的几率",
                    "摧毁所有其他的 {C:attention}小丑牌{}",
                    "每以此法摧毁一张 {C:attention}小丑牌{}",
                    "获得 {X:asc_emult,C:white}^#3#{} 倍率",
                    "{C:inactive}(当前为 {X:asc_emult,C:white}^#4#{}{C:inactive} 倍率)",
                },
            },

            j_asc_banner = {
                name = "征服 (Conquestum)",
                text = {
                    {
                        "每次打出牌型时，每剩余一次",
                        "{C:attention}弃牌次数{}，获得 {X:chips,C:white}X#2#{} 筹码",
                        "{C:inactive}(当前为 {X:chips,C:white}X#1#{}{C:inactive} 筹码)",
                    },
                    {
                        "计分时，每剩余一次",
                        "{C:attention}弃牌次数{}，提供 {X:chips,C:white}X#3#{} 筹码",
                    },
                },
            },

            j_asc_mystic_summit = {
                name = "神话之根 (Fabulosa Radices)",
                text = {
                    "{X:asc_emult,C:white}^#1#{} 倍率",
                    "如果剩余 {C:attention}0{} 次弃牌，",
                    "在回合结束时",
                    "获得 {X:asc_emult,C:white}^#2#{} 倍率",
                },
            },

            j_asc_marble = {
                name = "大理石碑 (Stela Marmorea)",
                text = {
                    {
                        "当选择 {C:attention}盲注{} 时",
                        "生成 {C:attention}#2#{} 张 {C:dark_edition}马赛克{}",
                        "{C:attention}石头{} 牌",
                        "{C:inactive}(最多 {C:attention}#4#{C:inactive} 张牌)",
                    },
                    {
                        "打出的 {C:attention}石头{} 牌",
                        "重新触发 {C:attention}#1#{} 次",
                        "{C:inactive}(最多 {C:attention}#3#{C:inactive} 次重新触发)",
                    },
                },
            },

            j_asc_loyalty_card = {
                name = "忠实买家 (Emptor Fidelis)",
                text = {
                    "{X:mult,C:white}X#1#{}",
                    "每打出 {C:attention}#4#{} {C:inactive}[#3#]{} 次牌，变为 {C:attention}X#2#{}",
                },
            },

            j_asc_misprint = {
                name = "残缺 (Defectus)",
                text = {
                    "", 
                },
            },

            j_asc_raised_fist = {
                name = "人民之拳 (Pugnus Populi)",
                text = {
                    "将留在手中 {C:attention}点数最低{} 的牌",
                    "的点数乘以 {X:attention,C:white}X#1#{}",
                    "并作为 {X:mult,C:white}X倍率{} 增加",
                    "{C:inactive}(当前为{} {X:mult,C:white}X#2#{} {C:inactive}倍率){}",
                },
            },

            j_asc_fibonacci = {
                name = "黄金比例 (Proportio Aurea)",
                text = {
                    {
                        "每张打出的 {C:attention}A{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, 或 {C:attention}8{}",
                        "在计分时提供 {X:mult,C:white}X#1#{} 倍率",
                    },
                    {
                        "在每张牌计分前，小丑牌会",
                        "获得其之前的 {X:mult,C:white}X倍率{}",
                        "每次出牌重置",
                        "{C:inactive}(例如: X1, X2, X3, X5, X8, 等等){}",
                    },
                },
            },

            j_asc_steel_joker = {
                name = "熔钢 (Chalybs Fusus)",
                text = {
                    {
                        "{C:attention}完整牌组{} 中每有一张",
                        "{C:attention}钢铁{} 牌，提供 {X:mult,C:white}X#3#{} 倍率",
                        "{C:inactive}(当前为{} {X:mult,C:white}X#4#{} {C:inactive}倍率){}",
                    },
                    {
                        "计分及留在手中的 {C:attention}钢铁{} 牌，",
                        "根据完整牌组中 {C:attention}钢铁{} 牌的数量，",
                        "每张提供 {X:mult,C:white}X#1#{} 倍率",
                        "{C:inactive}(当前为{} {X:mult,C:white}X#2#{} {C:inactive}倍率){}",
                    },
                },
            },

            j_asc_scary = {
                name = "骇人面容 (Immanis Facies)",
                text = {
                    "打出的 {C:attention}人头牌{}",
                    "在计分时提供 {X:asc_echips,C:white}^#1#{} 筹码",
                },
            },

            j_asc_abstract = {
                name = "谜团 (Aenigmatum)",
                text = {
                    "每有一张 {C:attention}小丑牌{}",
                    "提供 {X:asc_emult,C:white}^#2#{} 倍率",
                    "{C:inactive}(当前为 {X:asc_emult,C:white}^#1#{} {C:inactive}倍率){}",
                },
            },

            j_asc_hack = {
                name = "毫不荒谬 (Non Ridiculum)",
                text = {
                    {
                        "每张打出的",
                        "{C:attention}2{}, {C:attention}3{}, {C:attention}4{} 和 {C:attention}5{}",
                        "重新触发 {C:attention}等同于其点数{} 的次数",
                    },
                    {
                        "每有一张计分的",
                        "{C:attention}2{}, {C:attention}3{}, {C:attention}4{} 和 {C:attention}5{}，",
                        "获得 {X:mult,C:white}X1{} 倍率",
                        "{C:inactive}(当前为 {X:mult,C:white}X#1#{} {C:inactive}倍率){}",
                    },
                },
            },

            j_asc_banana = {
                name = "小果野蕉 (Musa Acuminata)",
                text = {
                    "{X:mult,C:white}X#1#{} 倍率",
                    "回合结束时，有",
                    "{C:green}#3# / #4#{} 的几率复制自身",
                    "否则，获得 {X:mult,C:white}X#2#{} 倍率",
                    "{C:inactive}(必须有空位){}",
                    "{C:money,E:2}哦，香蕉！{}",
                },
            },

            j_asc_madness = {
                name = "人类狂怒 (Furor Hominis)",
                text = {
                    {
                        "当选择 {C:attention}盲注{} 时，",
                        "此小丑牌获得 {X:mult,C:white}X#2#{} 倍率",
                        "{C:inactive}(当前为{} {X:mult,C:white}X#1#{} {C:inactive}倍率){}",
                    },
                    {
                        "当选择 {C:attention}小盲注{} 或 {C:attention}大盲注{} 时，",
                        "摧毁一张 {C:attention}随机{} 小丑牌，",
                        "并根据那张小丑牌的 {C:money}出售价值{}",
                        "增加此牌的 {X:mult,C:white}X倍率{} 增幅",
                    },
                },
            },

            j_asc_even_steven = {
                name = "左 (Sinistra)",
                text = {
                    {
                        "打出的 {C:attention}偶数{} 点数牌",
                        "在计分时提供 {X:mult,C:white}X#1#{} 倍率",
                        "{C:inactive}(10, 8, 6, 4, 2){}",
                    },
                    {
                        "如果打出的手牌包含",
                        "{C:attention}偶数张牌{}，",
                        "则改为提供 {X:mult,C:white}X#2#{} 倍率",
                    },
                },
            },

            j_asc_odd_todd = {
                name = "右 (Dextra)",
                text = {
                    {
                        "打出的 {C:attention}奇数{} 点数牌",
                        "在计分时提供 {X:chips,C:white}X#1#{} 筹码",
                        "{C:inactive}(A, 9, 7, 5, 3){}",
                    },
                    {
                        "如果打出的手牌包含",
                        "{C:attention}奇数张牌{}，",
                        "则改为提供 {X:chips,C:white}X#2#{} 筹码",
                    },
                },
            },

            j_asc_supernova = {
                name = "奇点 (Singularitas)",
                text = {
                    "将本次游戏中，当前",
                    "{C:attention}牌型{} 已被打出的次数",
                    "转化为 {X:mult,C:white}X倍率{}",
                    "{C:inactive}(当前为{} {X:mult,C:white}X#1#{}{C:inactive}){}",
                },
            },

            j_asc_space = {
                name = "解脱 (Solutus)",
                text = {
                    {
                        "本 {C:attention}底注{} 内每 {C:attention}出过一次牌{}，",
                        "就将当前打出 {C:attention}牌型{} 的",
                        "等级提升 {X:dark_edition,C:white}#1#{} 级",
                        "{C:inactive}(在击败 {C:attention}Boss盲注{} {C:inactive}时重置){}",
                        "{C:inactive}(当前已出牌 {X:dark_edition,C:white}#2#{} {C:inactive}次){}",
                        "{C:inactive}(无法被重新触发){}",
                    },
                    {
                        "每经过 {C:attention}#3#{} {C:inactive}(#4#){} 个底注",
                        "牌型升级的 {C:attention}修正值{} 增加 {C:attention}#5#{}",
                    },
                },
            },

            j_asc_egg = {
                name = "摇篮 (Cunae)",
                text = {
                    {
                        "在 {C:attention}回合结束时{}，获得",
                        "等同于其自身 {C:attention}出售价值{} {X:dark_edition,C:white}X#1#{} 的金额",
                    },
                    {
                        "在 {C:attention}回合开始时{}，将其自身出售价值的",
                        "常用对数(向上取整)转化为 {X:mult,C:white}X倍率{}",
                        "{C:inactive}(当前为{} {X:mult,C:white}X#2#{}{C:inactive}){}",
                    },
                },
            },

            j_asc_blackboard = {
                name = "石板 (Tabula Lapidea)",
                text = {
                    {
                        "手中每有一张 {C:spade}黑桃{} 和 {C:club}梅花{}，",
                        "获得 {X:mult,C:white}X#3#{} 倍率",
                        "{C:inactive}(当前为 {X:mult,C:white}X#1#{} {C:inactive}倍率)",
                    },
                    {
                        "如果手中的牌全都是 {C:spade}黑桃{} 或 {C:club}梅花{}，",
                        "则改为每张牌提供 {X:mult,C:white}X#2#{} 倍率",
                    },
                },
            },

            j_asc_ice_cream = {
                name = "冰淇淋 (Glacies Cremoris)",
                text = {
                    "{X:asc_echips,C:white}^#1#{} 筹码",
                    "每次出牌后，根据本次游戏",
                    "已出的手牌总数，",
                    "获得 {X:asc_echips,C:white}^#2#{} 筹码",
                    "{C:inactive}(当前为打出 {C:attention}#3#{C:inactive} 次牌)",
                },
            },

            j_asc_dna = {
                name = "自我复制 (Sui Replicatio)",
                text = {
                    "如果回合的 {C:attention}第一手牌{} 只有 {C:attention}1{} 张牌，",
                    "向牌组添加 {C:attention}#1#{} 张其永久复制品，",
                    "将其抽取到 {C:attention}手中{}，并摧毁",
                    "{C:attention}手中{} 所有与它不相同的牌",
                    "{C:inactive}(最多生成 {C:attention}#2#{} {C:inactive}张牌)",
                },
            },

            j_asc_splash = {
                name = "分形之湖 (Lacus Fractalis)",
                text = {
                    {
                        "每张 {C:attention}打出的牌{}",
                        "都参与计分",
                    },
                    {
                        "每有 {C:attention}#3#{} {C:inactive}(#4#){} 张牌计分：",
                        "{C:attention}+#1#{} 选牌上限",
                        "并 {C:attention}+#1#{} 手牌上限",
                        "{C:inactive,s:0.8}(当前为{} {C:attention,s:0.8}+#2#{}{C:inactive,s:0.8} 选牌上限){}",
                        "{C:inactive}(当前为{} {C:attention}+#2#{}{C:inactive} 手牌上限){}",
                    },
                },
            },

            j_asc_blue = {
                name = "大蓝宝石 (Magnus Sapphirus)",
                text = {
                    {
                        "{C:attention}牌组{} 中每剩余一张牌，",
                        "提供 {X:chips,C:white}X#2#{} 筹码",
                        "{C:inactive}(当前为: {}{X:chips,C:white}X#1#{C:inactive} 筹码)",
                    },
                    {
                        "当有卡牌被添加到 {C:attention}牌组{} 时，",
                        "每张牌提供的筹码数",
                        "增加 {X:chips,C:white}X#3#{}",
                    },
                },
            },

            j_asc_hiker = {
                name = "旅行社 (Agentia Viatorum)",
                text = {
                    "每当打出牌型时，",
                    "所有计分牌将永久获得等同于",
                    "所有计分牌 {C:attention}总点数{} 的 {X:chips,C:white}X筹码{}",
                    "{C:inactive,s:0.75}(J = 11, Q = 12, K = 13, A = 14){}",
                },
            },

            j_asc_musa_ingens = {
                name = "巨芭蕉 (Musa Ingens)",
                text = {
                    "{X:asc_emult,C:white}^#1#{} 倍率",
                    "{C:money,E:2}哦，香蕉！{}",
                },
            },

            j_asc_square = {
                name = "第四维度 (Dimensio Quattuor)",
                text = {
                    "如果打出的手牌",
                    "恰好包含 {C:attention}4{} 张牌，",
                    "此小丑牌获得 {X:dark_edition,C:edition}^^#1#{} 筹码",
                    "{C:inactive}(当前为 {X:dark_edition,C:edition}^^#2#{} {C:inactive}筹码)",
                },
            },

            j_asc_hologram = {
                name = "星云幻影 (Nebulosa Imago)",
                text = {
                    {
                        "每次有 {C:attention}游戏牌{} 被添加到",
                        "牌组或被摧毁时，此小丑牌",
                        "获得 {X:asc_emult,C:white}^#2#{} 倍率",
                        "{C:inactive}(当前为{} {X:asc_emult,C:white}^#3#{} {C:inactive}倍率){}",
                    },
                    {
                        "在回合的 {C:attention}第一手牌{} 之前，",
                        "此小丑牌会生成 {C:attention}#1#{} 张上一张",
                        "计分的 {C:attention}游戏牌{} 的复制品",
                        "{C:inactive}(最多生成{} {C:attention}#4#{} {C:inactive}张牌){}",
                    },
                },
            },

            j_asc_baron = {
                name = "第一大公 (Primus Archidux)",
                text = {
                    {
                        "手中每持有一张 {C:attention}K{}，",
                        "提供 {X:asc_emult,C:white}^#1#{} 倍率，并在每次出牌后",
                        "使此小丑牌的 {X:asc_emult,C:white}^倍率{}",
                        "增加 {X:asc_emult,C:white}^#2#{}",
                    },
                },
            },

            j_asc_cloud_nine = {
                name = "云端之上 (Supra Nubem)",
                text = {
                    {
                        "回合结束时，在 {C:attention}完整牌组{} 中",
                        "每有一张 {C:attention}9{}，获得等同于",
                        "总金钱 {X:money,C:white}X#1#{} 倍的资金",
                        "{C:inactive}(当前为{} {X:money,C:white}X#2#{}{C:inactive}){}",
                    },
                    {
                        "每当一张 {C:attention}9{} 计分时，",
                        "使该 {X:money,C:white}X金钱{} 增加 {X:money,C:white}X#3#{}",
                    },
                },
            },

            j_asc_rocket = {
                name = "孤独之路 (Via Solitaria)",
                text = {
                    {
                        "在 {C:attention}回合结束时{}，将所有",
                        "其他小丑牌的数值增加 {C:attention}+#1#{}",
                        "{C:inactive}(如果可行的话){}",
                        "{C:inactive}(不影响自身){}",
                    },
                    {
                        "在 {C:attention}回合结束时{} 获得 {C:money}$#2#{}",
                        "每击败一次 {C:attention}盲注{}，",
                        "奖励金增加 {C:money}$#1#{}",
                        "{C:inactive,s:0.7}晚安，泰拉{}",
                    },
                    {
                        "击败 {C:attention}Boss盲注{} 时，",
                        "将小丑牌数值乘以 {X:attention,C:white}X#3#{}",
                    },
                },
            },

            j_asc_obelisk = {
                name = "受谤方尖碑 (Obeliscus Calumniatus)",
                text = {
                    "此小丑牌获得等同于",
                    "{C:attention}连续{} 未打出你最常打出的",
                    "{C:attention}牌型{} 的出牌次数",
                    "的 {X:mult,C:white}X倍率{}",
                    "{C:inactive}(当前为 {}{X:mult,C:white}X#1#{}{C:inactive}){}",
                },
            },

            j_asc_midas = {
                name = "迈达斯王 (Rex Midas)",
                text = {
                    {
                        "所有打出的牌在计分时",
                        "都会变为 {C:attention}黄金牌{} 和 {C:attention}鎏金牌{}",
                    },
                    {
                        "留在手中的 {C:attention}黄金牌{}",
                        "提供 {X:asc_emult,C:white}^#1#{} 倍率",
                    },
                },
            },

            j_asc_photograph = {
                name = "记忆纸片 (Charta Memoria)",
                text = {
                    {
                        "在第一张 {C:attention}人头{} 牌 {C:attention}之前{}",
                        "计分的牌提供 {X:mult,C:white}X#2#{} 倍率",
                    },
                    {
                        "在第一张 {C:attention}人头{} 牌 {C:attention}之后{}",
                        "计分的牌提供 {X:asc_emult,C:white}^#3#{} 倍率",
                        "{C:inactive}(包含该人头牌自身)",
                    },
                    {
                        "{C:attention}+#1#{} 选牌上限",
                    },
                },
            },

            j_asc_to_the_moon = {
                name = "金钱领主 (Pecunia Dominus)",
                text = {
                    "每当你即将获得 {C:money}${} 时，",
                    "获得该金额的 {X:money,C:white}X#1#{} 倍",
                },
            },

            j_asc_golden = {
                name = "纯金 (Purus Aurum)",
                text = {
                    "回合结束时获得 {X:money,C:white}X#2#{} 的总资金，",
                    "每次支付时有 {C:green}#1# / #4#{} 的几率",
                    "使乘数增加 {X:money,C:white}X#3#{}",
                },
            },

            j_asc_baseball_card = {
                name = "绝无仅有 (Una Quaedam)",
                text = {
                    {
                        "当击败 {C:attention}Boss盲注{} 时，",
                        "{X:attention,C:white}X#1#{} {C:uncommon}罕见{} 小丑牌的数值",
                    },
                    {
                        "所有 {C:uncommon}罕见{} 小丑牌",
                        "提供 {X:asc_emult,C:white}^#2#{} 倍率",
                    },
                },
            },

            j_asc_bull = {
                name = "金牛座 (Taurus)",
                text = {
                    "你每拥有 {C:money}$1{}，",
                    "提供 {X:asc_echips,C:white}^#2#{} 筹码",
                    "{C:inactive}(当前为{} {X:asc_echips,C:white}^#1#{} {C:inactive}筹码){}",
                },
            },

            j_asc_trading = {
                name = "黄金梣树 (Fraxinus Aureus)",
                text = {
                    {
                        "如果回合的 {C:attention}第一次弃牌{} 恰好",
                        "包含 {C:attention}1{} 张牌，将其 {C:attention}摧毁{} 并应用",
                        "以下效果之一：",
                    },
                    {
                        "如果该 {C:attention}牌{} 是 {C:spades}黑桃{}，根据卡牌的点数",
                        "获得 {X:asc_echips,C:white}^筹码{}",
                        "{C:inactive}(当前为{} {X:asc_echips,C:white}^#1#{} {C:inactive}筹码){}",
                        "{C:inactive,s:0.75}(J = 1.1, Q = 1.2, K = 1.3, A = 1.4){}",
                    },
                    {
                        "如果该 {C:attention}牌{} 是 {C:hearts}红桃{}，根据卡牌的点数",
                        "获得 {X:asc_emult,C:white}^倍率{}",
                        "{C:inactive}(当前为{} {X:asc_emult,C:white}^#2#{} {C:inactive}倍率){}",
                        "{C:inactive,s:0.75}(J = 1.1, Q = 1.2, K = 1.3, A = 1.4){}",
                    },
                    {
                        "如果该 {C:attention}牌{} 是 {C:clubs}梅花{}，",
                        "所有 {C:attention}留在手中{} 的牌，根据该牌的点数",
                        "获得 {X:chips,C:white}X筹码{}",
                        "{C:inactive,s:0.75}(J = 11, Q = 12, K = 13, A = 14){}",
                    },
                    {
                        "如果该 {C:attention}牌{} 是 {C:diamonds}方块{}，",
                        "在 {C:attention}回合结束时{} 增加",
                        "{C:money}赚取的资金{}",
                        "{C:inactive}(当前为{} {X:money,C:white}+$#3#{} {C:inactive}){}",
                        "{C:inactive,s:0.75}(J = 11, Q = 12, K = 13, A = 14){}",
                    },
                },
            },

            j_asc_ancient = {
                name = "被遗忘的遗产 (Hereditas Oblita)",
                text = {
                    {
                        "每张打出的 {V:1}#1#{} 花色的牌",
                        "计分时提供 {X:asc_emult,C:white}^#2#{} 倍率",
                        "并使该数值增加 {X:asc_emult,C:white}^#3#{}",
                        "{C:inactive}(花色在回合结束时改变)",
                    },
                },
            },

            j_asc_seltzer = {
                name = "水泡 (Bulla Aquae)",
                text = {
                    {
                        "重新触发所有打出的牌",
                        "{C:attention}#1#{} 次",
                        "{C:inactive}(最多 {C:attention}#4#{} {C:inactive}次重新触发)",
                    },
                    {
                        "经过 {C:attention}#3#{} 次出牌后，",
                        "增加重新触发的次数",
                        "{C:inactive}(距离升级还需出牌: {C:attention}#2#{C:inactive})",
                    },
                },
            },

            j_asc_castle = {
                name = "灰烬堡垒 (Arx Cineris)",
                text = {
                    {
                        "每 {C:attention}弃掉{} 一张 {C:spades}黑桃{} 或 {C:clubs}梅花{} 牌，",
                        "此小丑牌获得",
                        "{X:asc_echips,C:white}^#1#{} 筹码",
                        "{C:inactive}(当前为{} {X:asc_echips,C:white}^#2#{} {C:inactive}筹码){}",
                    },
                    {
                        "每 {C:attention}弃掉{} 一张 {C:hearts}红桃{} 或 {C:diamonds}方块{} 牌，",
                        "此小丑牌获得",
                        "{X:asc_emult,C:white}^#3#{} 倍率",
                        "{C:inactive}(当前为{} {X:asc_emult,C:white}^#4#{} {C:inactive}倍率){}",
                    },
                },
            },

            j_asc_smiley = {
                name = "欢呼 (Acclamatio)",
                text = {
                    {
                        "根据本次出牌中，之前已计分的",
                        "{C:attention}人头{} 牌数量，",
                        "重新触发 {C:attention}人头{} 牌对应次数",
                        "{C:inactive}(最多 {C:attention}#2#{} {C:inactive}次重新触发)",
                    },
                    {
                        "打出的 {C:attention}人头{} 牌在计分时",
                        "提供 {C:white,X:mult}X#1#{} 倍率",
                    },
                },
            },

            j_asc_campfire = {
                name = "燃烧之林 (Silva Ardens)",
                text = {
                    {
                        "每 {C:attention}出售{} 一张牌获得 {X:asc_emult,C:white}^#2#{} 倍率",
                        "在击败 {C:attention}Boss盲注{} 后重置",
                        "{C:inactive}(当前为{} {X:asc_emult,C:white}^#1#{} {C:inactive}倍率){}",
                    },
                    {
                        "在击败 {C:attention}Boss盲注{} 后，本 {C:attention}底注{} 每",
                        "{C:attention}出售{} 过一张牌，便增加",
                        "{X:asc_emult,C:white}^#3#{} 倍率增幅",
                        "{C:inactive}(当前已出售 {C:attention}#4#{} {C:inactive}张牌){}",
                    },
                },
            },

            j_asc_mr_bones = {
                name = "灵魂囚笼 (Carcer Animarum)",
                text = {
                    {
                        "每 {C:attention}击败{} {C:attention}#5#{} 个回合 {C:inactive}[#6#]{} 会触发 {C:attention}一次{}，",
                        "如果计分的筹码至少达到",
                        "要求筹码的 {C:attention}#1#%{}，则防止 {C:attention}死亡{}",
                        "{C:inactive}(当前为 #3#){}",
                    },
                    {
                        "每当你 {C:attention}输掉{} 盲注时",
                        "此小丑牌获得 {X:dark_edition,C:edition}^^#2#{} 筹码",
                        "{C:inactive}(当前为{} {X:dark_edition,C:edition}^^#4#{}{C:inactive}){}",
                    },
                },
            },

            j_asc_sock_and_buskin = {
                name = "塔利亚与墨尔波墨涅 (Thalia et Melpomene)",
                text = {
                    {
                        "重新触发所有打出的",
                        "{C:attention}人头{} 牌 {C:attention}#1#{} 次",
                        "{C:inactive}(最多 {C:attention}#4#{} {C:inactive}次重新触发)",
                    },
                    {
                        "计分的 {C:attention}人头{} 牌",
                        "提供 {X:chips,C:white}X#2#{} 筹码，而",
                        "{C:attention}留在手中{} 的则提供 {X:mult,C:white}X#3#{} 倍率",
                    },
                },
            },

            j_asc_swashbuckler = {
                name = "海洋之鞭 (Flagellum Maris)",
                text = {
                    {
                        "在回合结束时，获得等同于",
                        "所有拥有 {C:attention}小丑牌{} 出售总价值",
                        "{X:money,C:white}X#2#{} 倍的 {X:mult,C:white}X倍率{}",
                        "{C:inactive}(当前为{} {X:mult,C:white}X#1#{} {C:inactive}倍率){}",
                    },
                    {
                        "当一张小丑牌被 {C:attention}购买{} 时",
                        "增加 {X:money,C:white}X#3#{} 的倍率增幅",
                    },
                },
            },

            j_asc_smeared = {
                name = "污染 (Inquino)",
                text = {
                    {
                        "没有 {C:attention}增强{} 效果的",
                        "计分牌将转化为",
                        "{C:attention}万能{} 牌",
                    },
                    {
                        "{C:attention}万能{} 牌无法被",
                        "{C:attention}削弱{}，并且在计分时",
                        "提供 {X:dark_edition,C:edition}^#1#{} 倍率",
                    },
                },
            },

            j_asc_throwback = {
                name = "渴望 (Desiderium)",
                text = {
                    "本次游戏中每跳过一个 {C:attention}盲注{}，",
                    "提供 {X:mult,C:white}X(n^#3#){} 倍率",
                    "{X:attention,C:white}n{} 等于当前",
                    "跳过 {C:attention}盲注{} 的数量",
                    "{C:inactive,s:0.9}(当前为 {X:mult,C:white,s:0.9}X#1#{}{C:inactive,s:0.9} 倍率，以及 {C:attention,s:0.9}#2#{}{C:inactive,s:0.9} 次跳过)",
                },
            },

            j_asc_hanging_chad = {
                name = "选举纸片 (Charta Electionis)",
                text = {
                    {
                        "对于当前的手牌上限，",
                        "重新触发第一张计分牌对应次数",
                        "{C:inactive}(当前为 {C:attention}#1#{} {C:inactive}次重新触发)",
                        "{C:inactive}(最多 {C:attention}#3#{} {C:inactive}次重新触发)",
                    },
                    {
                        "击败 {C:attention}Boss盲注{} 时，",
                        "永久 {C:attention}+#2#{} 手牌上限",
                    },
                },
            },

            j_asc_blueprint = {
                name = "蓝色进程 (Hyacintho Progressus)",
                text = {
                    {
                        "你每拥有一张该 {C:attention}小丑牌{} 的复制品，",
                        "就使右侧的 {C:attention}小丑牌{}",
                        "重新触发一次",
                    },
                    {
                        "在商店结束时，{C:attention}复制该小丑牌{}",
                        "到其右侧",
                        "{C:inactive}(必须有空位)",
                    },
                },
            },

            j_asc_oops = {
                name = "命运之笑 (Fortunae Risus)",
                text = {
                    {
                        "在每次出牌前，{C:cry_code}操纵{} 所有计分牌",
                        "以及一张随机的 {C:attention}小丑牌{}",
                    },
                    {
                        "每次出牌有 {C:red}固定的{} {C:green}1 / 6{} 的几率",
                        "授予 {C:dark_edition}+#1#{} 个 {C:attention}小丑牌{} 或消耗牌槽位",
                        "{C:inactive}(当前提供 {C:dark_edition}+#2#{}{C:attention} 小丑牌{}{C:inactive} 槽位",
                        "{C:inactive}以及 {C:attention}+#3#{} {C:inactive}消耗牌槽位)",
                    },
                },
            },

            j_asc_idols = {
                name = "神圣雕像 (Statua Sacra)",
                text = {
                    "每张计分的 {V:1}#2#{} 花色 {C:attention}#1#{}",
                    "会随机提供 {X:asc_emult,C:white}^#3#{} 倍率，",
                    "{X:asc_echips,C:white}^#3#{} 筹码 或 {X:money,C:white}X#3#{} 金钱之一，",
                    "{s:0.9}或者使自身的数值增加 {C:attention,s:0.9}+#4#{}",
                    "{C:inactive,s:0.75}(无法改变自身的操纵数值){}",
                    "{C:inactive}(卡牌每回合改变)",
                },
            },

            j_asc_seeing_double = {
                name = "双重视野 (Duplex Visio)",
                text = {
                    "此小丑牌获得等同于",
                    "打出牌型中计分的 {C:clubs}梅花{} 牌与",
                    "{s:0.9}其他 {C:attention,s:0.9}任意花色 {s:0.9}计分牌数量的",
                    "{C:attention}差值{} 的 {X:mult,C:white}X倍率{}",
                    "{C:inactive,s:0.9}(每种牌至少要包含一张)",
                    "{C:inactive}(当前为{} {X:mult,C:white}X#1#{} {C:inactive}倍率){}",
                },
            },

            j_asc_duo = {
                name = "我是二 (Sum Duo)",
                text = {
                    "如果打出的牌型包含 {C:attention}对子{}，",
                    "提供 {X:asc_emult,C:white}^#1#{} 倍率，并将",
                    "{C:attention}留在手中{} 的牌转化为",
                    "打出牌型中出现最多次的 {C:attention}点数{}",
                },
            },

            j_asc_trio = {
                name = "我是三 (Sum Trio)",
                text = {
                    "如果打出的牌型包含 {C:attention}三条{}，",
                    "提供 {X:asc_emult,C:white}^#1#{} 倍率，并将",
                    "{C:attention}留在手中{} 的牌转化为",
                    "打出牌型中出现最多次的 {C:attention}点数{}",
                },
            },

            j_asc_family = {
                name = "我是四 (Sum Quattuor)",
                text = {
                    "如果打出的牌型包含 {C:attention}四条{}，",
                    "提供 {X:asc_emult,C:white}^#1#{} 倍率，并将",
                    "{C:attention}留在手中{} 的牌转化为",
                    "打出牌型中出现最多次的 {C:attention}点数{}",
                },
            },

            j_asc_order = {
                name = "我是秩序 (Sum Constituto)",
                text = {
                    "如果打出的牌型包含 {C:attention}顺子{}，",
                    "提供 {X:asc_emult,C:white}^#1#{} 倍率，并将",
                    "{C:attention}留在手中{} 的牌",
                    "按打出牌型的顺序转化为对应的 {C:attention}点数{}",
                },
            },

            j_asc_tribe = {
                name = "我是同流 (Sum Carnes Unius)",
                text = {
                    "如果打出的牌型包含 {C:attention}同花{}，",
                    "提供 {X:asc_emult,C:white}^#1#{} 倍率，并将",
                    "{C:attention}留在手中{} 的牌转化为",
                    "打出牌型中出现最多次的 {C:attention}花色{}",
                },
            },

            j_asc_invisible = {
                name = "无瑕 (Immaculatus)",
                text = {
                    {
                        "在完成 {C:attention}#1#{} {C:inactive}(#2#){} 个 #3#后，",
                        "{C:attention}出售{} 这张牌",
                        "以复制右侧的 {C:attention}小丑牌{}",
                    },
                    {
                        "如果满足上述条件，",
                        "出售时将生成 {C:attention}#4#{} 个",
                        "带有 {C:dark_edition}负片{} 版本的 #5# 自身复制品",
                    },
                },
            },

            j_asc_brainstorm = {
                name = "伟大杰作 (Magnum Opus)",
                text = {
                    {
                        "重新触发最左侧的 {C:attention}小丑牌{}，次数",
                        "等同于它和这张 {C:attention}小丑牌{} 之间",
                        "包含的小丑牌数量 (包含两者自身)",
                    },
                    {
                        "在商店结束时，生成一张与最左侧",
                        "小丑牌相同稀有度的 {C:attention}小丑牌{}",
                        "{C:inactive,s:0.9}(无法影响自身；必须有空位)",
                    },
                },
            },

            j_asc_drivers_license = {
                name = "身份危机 (Identitatis Discrimine)",
                text = {
                    "{X:mult,C:white}X#1#{} 倍率",
                    "牌组中剩余每有一项 {C:attention}修改{}，",
                    "获得 {C:attention}X#2#{} 倍率",
                },
            },

            j_asc_bootstraps = {
                name = "通货膨胀 (Inflatio)",
                text = {
                    {
                        "你每拥有 {C:money}$1{}，",
                        "获得 {X:mult,C:white}X#2#{} 倍率",
                        "{C:inactive}(当前为 {X:mult,C:white}X#1#{} {C:inactive}倍率)",
                    },
                    {
                        "在回合结束时",
                        "赚取 {C:money}$#3#{}",
                    },
                },
            },

            j_asc_canio = {
                name = "塔纳托斯 (Thanatos)",
                text = {
                    {
                        "每摧毁一张 {C:attention}人头{} 牌",
                        "获得 {X:asc_emult,C:white}^#2#{} 倍率",
                        "{C:inactive}(当前为 {X:asc_emult,C:white}^#1#{}{C:inactive} 倍率)",
                    },
                    {
                        "被摧毁的 {C:attention}人头{} 牌",
                        "将返回到手中",
                    },
                },
            },

            j_asc_seance = {
                name = "预兆 (Praesagium)",
                text = {
                    {
                        "如果打出的牌型是 {C:attention}#2#{}，",
                        "有 {C:red}固定的{} {C:green}1 / #3#{} 的几率生成",
                        "{C:attention}#1#{} 张 {C:dark_edition}负片 稀有{} 消耗牌",
                        "{C:inactive,s:0.8}(牌型在回合结束时改变){}",
                    },
                    {
                        "当上述概率判定 {C:attention}失败{} 时，",
                        "生成 {C:attention}#1#{} 张 {C:dark_edition}负片 稀有{} 消耗牌",
                        "的几率将会 {C:attention}翻倍{}",
                        "否则，{C:attention}重置该几率{}",
                    },
                },
            },

            j_asc_vampire = {
                name = "鲜血始祖 (Proavus Sanguinis)",
                text = {
                    {
                        "每有一张计分的 {C:attention}增强{} 牌，获得",
                        "{X:dark_edition,C:edition}^^#2#{} 倍率，并移除卡牌的 {C:attention}增强{} 效果",
                        "{C:inactive}(当前为{} {X:dark_edition,C:edition}^^#1#{} {C:inactive}倍率){}",
                    },
                    {
                        "每次出牌如果没有",
                        "计分的 {C:attention}增强{} 牌，减少 {X:dark_edition,C:edition}^^#3#{} 倍率",
                        "{C:inactive}(不能低于 {X:dark_edition,C:edition}^^1{}{C:inactive}){}",
                    },
                },
            },

            -----Cryptid-----
            j_asc_canvas = {
                name = "油画 (Pictura Olei)",
                text = {
                    {
                        "{C:attention}重新触发{} 左侧所有 {C:attention}小丑牌{} 一次，",
                        "次数等同于此小丑牌右侧",
                        "{C:attention}所有{} 小丑牌 {C:inactive}(包含其自身){} 的数量",
                    },
                    {
                        "离开商店时生成一张",
                        "{C:dark_edition}负片{} {C:attention,T:j_joker}小丑牌{}",
                        "{C:inactive}(不需要空位)",
                    },
                },
            },

            j_asc_gardenfork = {
                name = "反抗世人 (Contra Homo)", 
                text = {
                    "如果打出的牌型中",
                    "包含 {C:attention}A{} 或 {C:attention}7{}，",
                    "总金钱 {X:money,C:white}X#1#{}",
                },
            },

            j_asc_nosound = {
                name = "反抗自我 (Contra Ipsum)", 
                text = {
                    {
                        "将每张打出的 {C:attention}7{}",
                        "额外重新触发 {C:attention}#1#{} 次",
                        "{C:inactive}(最高{} {C:attention}#2#{} {C:inactive}次重新触发){}"
                    },
                    {
                        "计分的 {C:attention}7{} 有 {C:green}#3# / #4#{} 的几率",
                        "将随机小丑牌的数值",
                        "{C:attention}乘以{} {C:attention}#5#{}",
                        "{C:inactive}(包括自身)"
                    },
                    {
                        "{C:red}摧毁{} 计分的 {C:attention}7{}"
                    },
                },
            },

            j_asc_like_antennas_to_heaven = {
                name = "反抗理智 (Contra Logos)", 
                text = {
                    "完整手牌中每包含一张",
                    "{C:attention}7{} 或 {C:attention}4{}，此小丑牌",
                    "获得 {X:asc_echips,C:white}^#1#{} 筹码",
                    "{C:inactive}(当前为 {X:asc_echips,C:white}^#2#{} {C:inactive}筹码)",
                },
            },

            j_asc_high_five = {
                name = "高阶之手 (Manus Superior)",
                text = {
                    "在计分前，如果打出的",
                    "手牌中包含一张计分的 {C:attention}5{}，",
                    "将 {C:attention}所有{} 计分牌",
                    "转化为带有 {C:dark_edition}星界{} 的 {C:attention}5{}",
                },
            },

            j_asc_oil_lamp = {
                name = "提灯 (Lucerna)",
                text = {
                    "在回合结束时",
                    "增加所有 {C:attention}小丑牌{} 的",
                    "数值 {C:attention}X#1#{}",
                    "{C:inactive}(不影响自身)", 
                },
            },

            j_asc_hunting_season = {
                name = "无尽狩猎 (Sine Fine Venari)",
                text = {
                    "如果打出的手牌包含大于 {C:attention}1{} 张的",
                    "奇数张牌，在计分后 {C:red}摧毁{} {C:attention}中心{} 的牌",
                    "剩余打出的牌获得等同于",
                    "{C:red}被摧毁{} 牌点数的 {X:mult,C:white}X倍率{}",
                    "{C:inactive}(J = 11, Q = 12, K = 13, A = 14)",
                },
            },

            j_asc_code_joker = {
                name = "虚拟转录 (Transcriptio Virtualis)",
                text = {
                    {
                        "当选择 {C:attention}盲注{} 时，生成一张",
                        "可用 {C:attention}#1#{} 次的 {C:dark_edition}负片{} {C:cry_code}代码牌{}",
                    },
                    {
                        "当一个 {C:attention}Boss盲注{} 被 {C:attention}击败{} 时，",
                        "使用次数增加 {C:attention}#2#{}",
                    },
                },
            },

            j_asc_chad = {
                name = "人中之杰 (Vir Inter Homines)",
                text = {
                    {
                        "重新触发 {C:attention}最左侧{} 和",
                        "{C:attention}最右侧{} 的小丑牌 {C:attention}#5#{} 次，且",
                        "每个 {C:attention}空置的{} 小丑牌槽位额外触发 {C:attention}1次{}",
                        "{C:inactive}(当前为{} {C:attention}#1#{} {C:inactive}次重新触发){}",
                        "{C:inactive}(最高{} {C:attention}#2#{} {C:inactive}次重新触发){}",
                    },
                    {
                        "在商店结束时",
                        "获得 {C:dark_edition}+#3#{} {C:attention}小丑牌{} 槽位",
                        "{C:inactive}(当前为{} {C:dark_edition}+#4#{} {C:inactive}小丑牌槽位){}",
                    },
                },
            },

            j_asc_sync_catalyst = {
                name = "核聚变 (Fusio Nuclearis)",
                text = {
                    {
                        "在 {C:attention}回合开始时{}，",
                        "平衡 {C:chips}出牌次数{} 与 {C:mult}弃牌次数{}，",
                        "并平衡自身的 {X:asc_echips,C:white}^筹码{} 与自身的 {X:asc_emult,C:white}^倍率{}",
                        "{C:inactive}(当前为{} {X:asc_echips,C:white}^#2#{} {C:inactive}筹码 以及{} {X:asc_emult,C:white}^#1#{} {C:inactive}倍率){}",
                    },
                    {
                        "在 {C:attention}最终{} 计分阶段",
                        "平衡 {C:chips}筹码{} 和 {C:mult}倍率{}",
                    },
                    {
                        "每当一个 {C:attention}Boss盲注{} 被",
                        "{C:attention}击败{} 时，获得 {X:asc_emult,C:white}^#3#{} {C:mult}倍率{}",
                    },
                },
            },

            j_asc_circus = {
                name = "流浪马戏团 (Grex Vagans)",
                text = {
                    {
                        "{C:common}普通{} 小丑牌提供 {X:asc_emult,C:white}^#1#{} 倍率",
                        "{C:uncommon}罕见{} 小丑牌提供 {X:asc_emult,C:white}^#2#{} 倍率",
                        "{C:rare}稀有{} 小丑牌提供 {X:asc_emult,C:white}^#3#{} 倍率",
                        "{C:cry_epic}史诗{} 小丑牌提供 {X:asc_emult,C:white}^#4#{} 倍率",
                        "{C:legendary}传奇{} 小丑牌提供 {X:asc_emult,C:white}^#5#{} 倍率",
                        "{C:cry_exotic}域外{} 小丑牌提供 {X:asc_emult,C:white}^#6#{} 倍率",
                        Entropy and "{C:entr_entropic}熵增{} 小丑牌提供 {X:asc_emult,C:white}^#7#{} 倍率" or nil,
                    },
                    {
                        Entropy and "在 {C:attention}回合结束时{}，将基础 {X:asc_emult,C:white}^倍率{} 增加 {X:asc_emult,C:white}^#8#{}" or "在 {C:attention}回合结束时{}，将基础 {X:asc_emult,C:white}^倍率{} 增加 {X:asc_emult,C:white}^#7#{}",
                    },
                },
            },

            j_asc_krusty = {
                name = "理念法则 (Iura Ideae)",
                text = {
                    {
                        "每当一张卡牌 {C:attention}计分{} 时，",
                        "此小丑牌获得 {X:mult,C:white}X#2#{} 倍率",
                        "{C:inactive}(当前为{} {X:mult,C:white}X#1#{} {C:inactive}倍率)",
                    },
                    {
                        "每当 {C:attention}Boss盲注{} 被击败时，",
                        "将其 {X:mult,C:white}X倍率{} {C:attention}增长量{} 增加 {X:mult,C:white}X#3#{}",
                    },
                },
            },

            j_asc_the = {
                name = "我即虚无 (Nihil Sum)",
                text = {
                    "如果打出的牌型为 {C:attention}无{}",
                    "摧毁所有 {C:attention}留在手中{} 的牌",
                    "每 {C:attention}摧毁{} 一张牌",
                    "获得 {X:asc_emult,C:white}^#2#{} 倍率",
                    "{C:inactive}(当前为 {X:asc_emult,C:white}^#1#{} {C:inactive}倍率){}",
                },
            },

            -----Cryptid Mortals-----

            j_asc_copy_cat = {
                name = "模仿猫",
                text = {
                    {
                        "重新触发所有打出的牌",
                        "{C:attention}#2#{} 次",
                        "{C:inactive}(最高 {C:attention}#3#{}{C:inactive} 次重新触发)",
                    },
                    {
                        "每张打出的牌在计分时",
                        "提供 {C:mult}+#1#{} 倍率",
                    },
                },
            },

            j_asc_b_cake = {
                name = "生日蛋糕",
                text = {
                    "{C:chips}+#1#{} 筹码",
                    "每次 {C:attention}重掷{} 减少 {C:chips}-#2#{} 筹码", 
                    "{C:green}重掷{} 是免费的", 
                },
            },

            j_asc_b_pie = {
                name = "蓝莓派 (Blueberry Pi)",
                text = {
                    "如果 {C:attention}恰好{} 剩余 #2# 次出牌",
                    "获得 {X:chips,C:white}Xpi{} 筹码",
                },
            },

            j_asc_orion_pax = {
                name = "奥利安·派克斯",
                text = {
                    "如果打出的手牌中所有卡牌",
                    "都是 {C:attention}A{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, 或 {C:attention}7{}",
                    "提供 {X:mult,C:white}X#1#{} 倍率",
                },
            },

            j_asc_accomplice = {
                name = "共犯",
                text = {
                    "回合结束时，最左侧的小丑牌",
                    "如果是 {C:attention}倍率型{} 或 {C:attention}筹码型{} 小丑牌",
                    "则分别获得 {C:mult}+#1#{} 倍率或 {C:chips}+#2#{} 筹码",
                },
            },

            j_asc_duane = {
                name = "可疑的杜安",
                text = {
                    "当一张 {C:attention}小丑牌{} 计分时，",
                    "此小丑牌获得 {C:mult}+#2#{} 倍率",
                    "{C:inactive}(当前为 {C:mult}+#1#{C:inactive} 倍率)",
                },
            },

            j_asc_exorcist = {
                name = "驱魔人",
                text = {
                    "当获得一张带有 {X:cry_cursed,C:white}诅咒{} 版本的",
                    "小丑牌时，将其摧毁",
                    "并生成一个 {C:cry_candy}糖果{}",
                },
            },

            -----Astronomica-----

            j_asc_stopwatch = {
                name = "永恒 (Aeon)",
                text = {
                    "{C:black}游戏每开启一 {C:attention}秒钟{}",
                    "提供 {C:chips}+G {C:black}筹码，其中 {C:chips}G{} 为",
                    "在 {C:money}黄金注{C:black} 难度下通关牌组的数量",
                    "{C:inactive}(当前为 {C:chips}#1# {C:inactive}筹码 且在黄金注有 {C:money}#2# 胜场)",
                    "{C:inactive}(每秒至少提供 1 筹码)",
                },
            },

            j_asc_facsimile = {
                name = "猩红进程 (Coccineum Progressus)",
                text = {
                    {
                        "你每拥有一张该 {C:attention}小丑牌{} 的复制品，",
                        "就使左侧的 {C:attention}小丑牌{}",
                        "重新触发一次",
                    },
                    {
                        "在商店结束时，{C:attention}复制该小丑牌{}",
                        "到其左侧",
                        "{C:inactive}(必须有空位)",
                    },
                },
            },

            -----Entropy-----

            j_asc_sunny_joker = {
                name = "太阳 (Solis)",
                text = {
                    "每打出一次 {C:gold}飞升{} 牌型，",
                    "获得 {X:gold,C:white}^#2#{} 升华力量(Ascension Power)",
                    "{C:inactive}(当前为: {X:gold,C:white}^#1#{}{C:inactive}){}",
                },
            },

            j_asc_chuckle_cola = {
                name = "笑声气泡 (Cachinno Bulla)",
                text = {
                    {
                        "将 {C:attention}计分{} 牌的",
                        "{C:blue}筹码{} 乘以 {X:blue,C:white}X#1#{}",
                    },
                    {
                        "每计分 {C:attention}#2#{} 张牌后，",
                        "将乘数增加 {X:blue,C:white}X#3#{}，并将",
                        "计分牌的需求数量 {C:attention}翻倍{}",
                    },
                },
            },

            -----Entropy Entropics-----
            j_asc_jimbo_entr = {
                name = "弄臣 (Gelotopoios)",
                text = {
                    { "将计分运算设置为", "{X:dark_edition,C:white}乘方{}" },
                    { "{C:mult}+4{} 倍率" },
                },
            },

            j_asc_marble_entr = {
                name = "石化凝视 (Petrinos Vlemma)",
                text = {
                    {
                        "当选择 {C:attention}盲注{} 时",
                        "生成 {C:attention}#2#{} 张带有 {C:attention}猩红蜡封{} 的",
                        "{C:dark_edition}马赛克{} {C:attention}石头{} 牌",
                        "{C:inactive}(最多 {C:attention}#4#{C:inactive} 张牌)",
                    },
                    {
                        "打出的 {C:attention}石头{} 牌",
                        "重新触发 {C:attention}#1#{} 次",
                        "{C:inactive}(最多 {C:attention}#3#{C:inactive} 次重新触发)",
                    },
                    {
                        "剩余牌组中的 {C:attention}石头{} 牌",
                        "可以以 {C:money}$#5#{} 的价格",
                        "被 {C:attention}购买{} 和 {C:attention}出售{}",
                    },
                },
            },

            j_asc_sunny_joker_entr = {
                name = "日光 (Iliakos)",
                text = {
                    "{X:gold,C:white}#3##1#{} 升华力量",
                    "每打出 {C:attention}#2#{} 次 {C:gold}飞升{} 牌型后",
                    "增加运算符",
                },
            },

            j_asc_beyond_jimbo = {
                name = "{s:4}万物之上 (The One Above All){}",
                text = {
                    "{X:dark_edition,C:white,s:8}#1#{} {C:mult}倍率{}",
                },
            },
        },
        Other = {
            asc_ascensionable = {
                name = "升华候选",
                text = {
                    "这张小丑牌可以达到",
                    "一种 {C:cry_exotic,E:1}更高形态{}",
                },
            },

            asc_apothable = {
                name = "神化候选",
                text = {
                    "这张小丑牌可以达到",
                    "一种 {C:entr_entropic,E:1}甚至更高的形态{}",
                },
            },

            asc_astronomica_compat = {
                name = "Astronomica 兼容",
                text = {
                    "也会为 {X:purple,C:white}Astronomica{} 的",
                    "{C:attention}分数型{} 小丑牌",
                    "提供 {C:purple}+300{} 分数",
                },
            },

            asc_fixed = {
                name = "固定",
                text = {
                    "{C:attention}列出的{} {C:green,E:1}概率{}",
                    "无法被改变",
                },
            },

            samsara = {
                name = "轮回",
                text = {
                    "每个回合都会在它的 {C:cry_exotic,E:1}飞升(Ascendant){}",
                    "版本、普通版本以及",
                    "被 {C:red}削弱{} 的状态之间轮换",
                },
            },
        },
        Planet = {},
        Sleeve = {
            sleeve_asc_starlight = {
                name = "星光卡套",
                text = {
                    "开局持有一张 {C:cry_exotic,T:c_asc_ascension}升华 {C:attention}牌",
                    "小丑牌具有 {C:dark_edition}负片{} 版本的",
                    "几率增加 {C:attention}20倍{}",
                    "{C:attention}-2{} 小丑牌槽位",
                },
            },

            sleeve_asc_starlight_alt = {
                name = "星光卡套",
                text = {
                    "小丑牌具有 {C:dark_edition}负片{} 版本的",
                    "几率增加 {C:attention}10倍{}",
                    "{C:attention}-1{} 小丑牌槽位",
                },
            },
        },
        Spectral = {
            c_asc_ascension = {
                name = "升华",
                text = {
                    "将符合条件的 {C:attention}小丑牌{} 转化为",
                    "它们的 {C:cry_exotic,E:1}域外{} 对应牌",
                    "摧毁所有其他留在手中的 {C:attention}小丑牌{}",
                },
            },
        },
        Numina = {
            c_asc_samsara = {
                name = "轮回",
                text = {
                    "选择 {C:attention}#1#{} 张 #2#",
                    "变为 {C:cry_exotic,E:1}轮回{}",
                },
            },

            c_asc_rapture = {
                name = "狂喜",
                text = {
                    "我不知道这有什么用",
                    "{E:2}所以别再问了{}",
                },
            },

            c_asc_mandala = {
                name = "曼荼罗",
                text = {
                    "选择一张小丑牌",
                    "变为 {X:dark_edition,C:white,s:2,E:2}Skibidi{}",
                },
            },

            c_asc_punya = {
                name = "福德",
                text = {
                    "{E:2}我不知道这有什么用{}",
                    "{E:2}所以别再问了{}",
                },
            },

            c_asc_prana = {
                name = "普拉纳",
                text = {
                    "{E:2}我不知道这有什么用{}",
                    "{E:2}所以别再问了{}",
                },
            },

            c_asc_karma = {
                name = "业力",
                text = {
                    "{E:2}我不知道这有什么用{}",
                    "{E:2}所以别再问了{}",
                },
            },

            c_asc_samadhi = {
                name = "三摩地",
                text = {
                    "{E:2}我不知道这有什么用{}",
                    "{E:2}所以别再问了{}",
                },
            },

            c_asc_valhalla = {
                name = "英灵殿",
                text = {
                    "{X:dark_edition,C:edition,s:8,E:2}???{}",
                },
            },

            c_asc_punarbhava = {
                name = "再生",
                text = {
                    "{E:2}我不知道这有什么用{}",
                    "{E:2}所以别再问了{}",
                },
            },

            c_asc_nirvana = {
                name = "涅槃",
                text = {
                    "{s:4,E:2}Mon3tr 的坑穴{} :drool:",
                },
            },

            c_asc_syncretisa = {
                name = "融合",
                text = {
                    "{C:red,E:2}抹除 Balatro 中所有的平衡感{}",
                    "{X:dark_edition,C:white}#1#44{} 屏幕上的所有数值",
                },
            },
        },
        Code = {},
        Omen = {
            c_asc_apotheosis = {
                name = "神化",
                text = {
                    "将符合条件的 {C:attention}小丑牌{} 转化为",
                    "它们的 {C:entr_entropic,E:1}熵增{} 对应牌",
                    "摧毁所有其他留在手中的小丑牌",
                },
            },
        },
        Back = {
            b_asc_starlight = {
                name = "星光牌组",
                text = {
                    "开局持有一张 {C:cry_exotic,T:c_asc_ascension}升华 {C:attention}牌",
                    "小丑牌具有 {C:dark_edition}负片{} 版本的",
                    "几率增加 {C:attention}20倍{}",
                    "{C:attention}-2{} 小丑牌槽位",
                    "{C:inactive,s:0.6}星光闪烁，星光明亮，{}",
                    "{C:inactive,s:0.6}今夜我见到的第一颗星；{}",
                    "{C:inactive,s:0.6}但愿我可以，但愿我能够{}",
                    "{C:inactive,s:0.6}实现我今夜的愿望{}",
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
            asc_banana_ex = "香蕉！",
            asc_inactive = "未激活",
            asc_saved_by_bones = "被灵魂囚笼拯救",
            asc_chips = "筹码",
            asc_mult = "倍率",

            asc_seance_msg = "世界不在这里...",

            asc_wish_ex = "我希望！",
            b_sell_stone = "-石头",
            b_buy_stone = "+石头",
            asc_mossaic_stone_cards = "马赛克石头牌",
            asc_special_thanks = "特别鸣谢",
            asc_config_insanity_mode = "疯狂模式！！！",
            asc_config_insanity_explanation = "阻止 星门(Gateway) 和 升华(Ascension) 摧毁小丑牌",

            k_numina = "神明牌",
            b_numina_cards = "神明牌",
        },
        labels = {
            numina = "神明牌",
            samsara = "轮回",
        },
    },
}
