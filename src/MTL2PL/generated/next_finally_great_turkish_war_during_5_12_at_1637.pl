:- include('database.pl').
great_turkish_war(Start,End) :- begin('great_turkish_war',_,_,Start), end('great_turkish_war',_,_,End), Start=<End.

finally_great_turkish_war_during_5_12(Start,End) :- great_turkish_war(Start1,End1), (Start1-12)=<(End1-5), Start is (Start1-12), End is (End1-5), Start=<End.

next_finally_great_turkish_war_during_5_12(Start,End) :- finally_great_turkish_war_during_5_12(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_great_turkish_war_during_5_12_at_1637(Res) :- setof((Start,End),next_finally_great_turkish_war_during_5_12(Start,End),AllINtervals), checkvalidity(1637,AllINtervals,Res).

check_query() :- write('Query = next_finally_great_turkish_war_during_5_12_at_1637'), (next_finally_great_turkish_war_during_5_12_at_1637(true) -> write('\nRes   = true');write('\nRes   = false')).

