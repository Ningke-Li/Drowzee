:- include('database.pl').
war_of_the_polish_succession(Start,End) :- begin('war_of_the_polish_succession',_,_,Start), end('war_of_the_polish_succession',_,_,End), Start=<End.

finally_war_of_the_polish_succession_during_2_13(Start,End) :- war_of_the_polish_succession(Start1,End1), (Start1-13)=<(End1-2), Start is (Start1-13), End is (End1-2), Start=<End.

finally_war_of_the_polish_succession_during_2_13_at_1726(Res) :- setof((Start,End),finally_war_of_the_polish_succession_during_2_13(Start,End),AllINtervals), checkvalidity(1726,AllINtervals,Res).

check_query() :- write('Query = finally_war_of_the_polish_succession_during_2_13_at_1726'), (finally_war_of_the_polish_succession_during_2_13_at_1726(true) -> write('\nRes   = true');write('\nRes   = false')).

