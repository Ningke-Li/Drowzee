:- include('database.pl').
fullmetal_alchemist(Start,End) :- begin('fullmetal_alchemist',_,_,Start), end('fullmetal_alchemist',_,_,End), Start=<End.

camp_lazlo(Start,End) :- begin('camp_lazlo',_,_,Start), end('camp_lazlo',_,_,End), Start=<End.

fullmetal_alchemist_last_till_2_3(Start,End) :- fullmetal_alchemist(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

fullmetal_alchemist_until_camp_lazlo_during_2_3_overlap(Start,End) :- fullmetal_alchemist_last_till_2_3(Start1,End1), camp_lazlo(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

fullmetal_alchemist_until_camp_lazlo_during_2_3(Start,End) :- fullmetal_alchemist(W1,_), fullmetal_alchemist_until_camp_lazlo_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

fullmetal_alchemist_until_camp_lazlo_during_2_3_at_2003(Res) :- setof((Start,End),fullmetal_alchemist_until_camp_lazlo_during_2_3(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = fullmetal_alchemist_until_camp_lazlo_during_2_3_at_2003'), (fullmetal_alchemist_until_camp_lazlo_during_2_3_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

