AddBotsToGame(Amount)
{
    BotTeams = [];
    BotTeams[0] = #"axis";
    BotTeams[1] = #"allies";

    BotNames = [];
    BotNames[0] = "xXGhostXx";
    BotNames[1] = "V1p3r";
    BotNames[2] = "R0gu3";
    BotNames[3] = "Reap3r_99";
    BotNames[4] = "Sh4d0w";
    BotNames[5] = "H4v0c";
    BotNames[6] = "Str1k3r";
    BotNames[7] = "Bulle7";
    BotNames[8] = "Fr0stBite";
    BotNames[9] = "V3n0mX";
    BotNames[10] = "B1aze";
    BotNames[11] = "Rapt0r_77";
    BotNames[12] = "Hunt3rX";
    BotNames[13] = "C0brA";
    BotNames[14] = "Ph03n1x";
    BotNames[15] = "DrakeXx";
    BotNames[16] = "F4lc0n";
    BotNames[17] = "St0rm99";
    BotNames[18] = "Tit4n_21";
    BotNames[19] = "Mav3rickX";
    BotNames[20] = "Band1t_OG";
    BotNames[21] = "Kn0x";
    BotNames[22] = "N0vaX";
    BotNames[23] = "Ra1der77";
    BotNames[24] = "EchoX";

    BotClans = [];
    BotClans[0] = "xTrM";
    BotClans[1] = "FuRyX";
    BotClans[2] = "sN1P";
    BotClans[3] = "BoTz";
    BotClans[4] = "W0Lf";
    BotClans[5] = "RaG3";
    BotClans[6] = "T4NK";
    BotClans[7] = "eL1T";
    BotClans[8] = "N0Va";
    BotClans[9] = "K1LL";
    BotClans[10] = "HnTz";
    BotClans[11] = "R3Ap";
    BotClans[12] = "STLM";
    BotClans[13] = "V0ID";
    BotClans[14] = "F1RE";
    BotClans[15] = "D4RK";
    BotClans[16] = "L10N";
    BotClans[17] = "VPRx";
    BotClans[18] = "STYX";
    BotClans[19] = "GLXY";
    BotClans[20] = "B4ND";
    BotClans[21] = "KNXT";
    BotClans[22] = "R41D";
    BotClans[23] = "PHNX";
    BotClans[24] = "BR5K";
    
    self.BotsInGame = [];

    for (i = 0; i < int(Amount); i++) {
        team = BotTeams[randomint(BotTeams.size)];
        clan = BotClans[randomint(BotClans.size)];
        name = BotNames[randomint(BotNames.size)];
        
        Bot = bot::add_bot(team, clan, name);
        self.BotsInGame[i] = Bot;
        wait 0.2;
    }
}

/*
RemoveBots(Amount) {
    Amount = min(Amount, self.BotsInGame.size);
    
    for (i = 0; i < int(Amount); i++) {
        if (self.BotsInGame[i] != undefined) {
            self.BotsInGame[i] botdropclient();
            self.BotsInGame[i] = undefined;
            
            for (j = i; j < self.BotsInGame.size - 1; j++) {
                self.BotsInGame[j] = self.BotsInGame[j + 1];
            }
            self.BotsInGame[self.BotsInGame.size - 1] = undefined;
        }
        wait 0.2;
    }
}
*/