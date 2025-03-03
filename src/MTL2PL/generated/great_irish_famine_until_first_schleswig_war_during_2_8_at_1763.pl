:- include('database.pl').
great_irish_famine(Start,End) :- begin('great_irish_famine',_,_,Start), end('great_irish_famine',_,_,End), Start=<End.

first_schleswig_war(Start,End) :- begin('first_schleswig_war',_,_,Start), end('first_schleswig_war',_,_,End), Start=<End.

great_irish_famine_last_till_2_8(Start,End) :- great_irish_famine(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

great_irish_famine_until_first_schleswig_war_during_2_8_overlap(Start,End) :- great_irish_famine_last_till_2_8(Start1,End1), first_schleswig_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

great_irish_famine_until_first_schleswig_war_during_2_8(Start,End) :- great_irish_famine(W1,_), great_irish_famine_until_first_schleswig_war_during_2_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-2), Start=<End.

great_irish_famine_until_first_schleswig_war_during_2_8_at_1763(Res) :- setof((Start,End),great_irish_famine_until_first_schleswig_war_during_2_8(Start,End),AllINtervals), checkvalidity(1763,AllINtervals,Res).

check_query() :- write('Query = great_irish_famine_until_first_schleswig_war_during_2_8_at_1763'), (great_irish_famine_until_first_schleswig_war_during_2_8_at_1763(true) -> write('\nRes   = true');write('\nRes   = false')).

