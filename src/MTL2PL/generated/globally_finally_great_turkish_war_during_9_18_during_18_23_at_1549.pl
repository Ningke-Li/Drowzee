:- include('database.pl').
great_turkish_war(Start,End) :- begin('great_turkish_war',_,_,Start), end('great_turkish_war',_,_,End), Start=<End.

finally_great_turkish_war_during_9_18(Start,End) :- great_turkish_war(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

globally_finally_great_turkish_war_during_9_18_during_18_23(Start,End) :- finally_great_turkish_war_during_9_18(Start1,End1), Start is (Start1-18), End is (End1-23), Start=<End.

globally_finally_great_turkish_war_during_9_18_during_18_23_at_1549(Res) :- setof((Start,End),globally_finally_great_turkish_war_during_9_18_during_18_23(Start,End),AllINtervals), checkvalidity(1549,AllINtervals,Res).

check_query() :- write('Query = globally_finally_great_turkish_war_during_9_18_during_18_23_at_1549'), (globally_finally_great_turkish_war_during_9_18_during_18_23_at_1549(true) -> write('\nRes   = true');write('\nRes   = false')).

