:- include('database.pl').
war_of_the_spanish_succession(Start,End) :- begin('war_of_the_spanish_succession',_,_,Start), end('war_of_the_spanish_succession',_,_,End), Start=<End.

finally_war_of_the_spanish_succession_during_10_12(Start,End) :- war_of_the_spanish_succession(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

next_finally_war_of_the_spanish_succession_during_10_12(Start,End) :- finally_war_of_the_spanish_succession_during_10_12(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_war_of_the_spanish_succession_during_10_12_at_1660(Res) :- setof((Start,End),next_finally_war_of_the_spanish_succession_during_10_12(Start,End),AllINtervals), checkvalidity(1660,AllINtervals,Res).

check_query() :- write('Query = next_finally_war_of_the_spanish_succession_during_10_12_at_1660'), (next_finally_war_of_the_spanish_succession_during_10_12_at_1660(true) -> write('\nRes   = true');write('\nRes   = false')).

