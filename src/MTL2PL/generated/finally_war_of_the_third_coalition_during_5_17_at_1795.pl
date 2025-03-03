:- include('database.pl').
war_of_the_third_coalition(Start,End) :- begin('war_of_the_third_coalition',_,_,Start), end('war_of_the_third_coalition',_,_,End), Start=<End.

finally_war_of_the_third_coalition_during_5_17(Start,End) :- war_of_the_third_coalition(Start1,End1), (Start1-17)=<(End1-5), Start is (Start1-17), End is (End1-5), Start=<End.

finally_war_of_the_third_coalition_during_5_17_at_1795(Res) :- setof((Start,End),finally_war_of_the_third_coalition_during_5_17(Start,End),AllINtervals), checkvalidity(1795,AllINtervals,Res).

check_query() :- write('Query = finally_war_of_the_third_coalition_during_5_17_at_1795'), (finally_war_of_the_third_coalition_during_5_17_at_1795(true) -> write('\nRes   = true');write('\nRes   = false')).

