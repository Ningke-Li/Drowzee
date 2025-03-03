:- include('database.pl').
eighth_russo_turkish_war(Start,End) :- begin('eighth_russo_turkish_war',_,_,Start), end('eighth_russo_turkish_war',_,_,End), Start=<End.

finally_eighth_russo_turkish_war_during_1_15(Start,End) :- eighth_russo_turkish_war(Start1,End1), (Start1-15)=<(End1-1), Start is (Start1-15), End is (End1-1), Start=<End.

next_finally_eighth_russo_turkish_war_during_1_15(Start,End) :- finally_eighth_russo_turkish_war_during_1_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_eighth_russo_turkish_war_during_1_15_at_1677(Res) :- setof((Start,End),next_finally_eighth_russo_turkish_war_during_1_15(Start,End),AllINtervals), checkvalidity(1677,AllINtervals,Res).

check_query() :- write('Query = next_finally_eighth_russo_turkish_war_during_1_15_at_1677'), (next_finally_eighth_russo_turkish_war_during_1_15_at_1677(true) -> write('\nRes   = true');write('\nRes   = false')).

