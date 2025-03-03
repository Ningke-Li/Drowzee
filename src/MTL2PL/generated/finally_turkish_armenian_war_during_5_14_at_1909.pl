:- include('database.pl').
turkish_armenian_war(Start,End) :- begin('turkish_armenian_war',_,_,Start), end('turkish_armenian_war',_,_,End), Start=<End.

finally_turkish_armenian_war_during_5_14(Start,End) :- turkish_armenian_war(Start1,End1), (Start1-14)=<(End1-5), Start is (Start1-14), End is (End1-5), Start=<End.

finally_turkish_armenian_war_during_5_14_at_1909(Res) :- setof((Start,End),finally_turkish_armenian_war_during_5_14(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = finally_turkish_armenian_war_during_5_14_at_1909'), (finally_turkish_armenian_war_during_5_14_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).

