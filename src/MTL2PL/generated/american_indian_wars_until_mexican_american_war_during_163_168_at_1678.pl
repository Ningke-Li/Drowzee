:- include('database.pl').
american_indian_wars(Start,End) :- begin('american_indian_wars',_,_,Start), end('american_indian_wars',_,_,End), Start=<End.

mexican_american_war(Start,End) :- begin('mexican_american_war',_,_,Start), end('mexican_american_war',_,_,End), Start=<End.

american_indian_wars_last_till_163_168(Start,End) :- american_indian_wars(Start1,End1), (End1-Start1)>=163, Start is (Start1+163), End is (End1+1).

american_indian_wars_until_mexican_american_war_during_163_168_overlap(Start,End) :- american_indian_wars_last_till_163_168(Start1,End1), mexican_american_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

american_indian_wars_until_mexican_american_war_during_163_168(Start,End) :- american_indian_wars(W1,_), american_indian_wars_until_mexican_american_war_during_163_168_overlap(Start1,End1), Start is max((Start1-168),W1), End is (End1-163), Start=<End.

american_indian_wars_until_mexican_american_war_during_163_168_at_1678(Res) :- setof((Start,End),american_indian_wars_until_mexican_american_war_during_163_168(Start,End),AllINtervals), checkvalidity(1678,AllINtervals,Res).

check_query() :- write('Query = american_indian_wars_until_mexican_american_war_during_163_168_at_1678'), (american_indian_wars_until_mexican_american_war_during_163_168_at_1678(true) -> write('\nRes   = true');write('\nRes   = false')).

