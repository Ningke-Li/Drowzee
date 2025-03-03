:- include('database.pl').
war_of_the_third_coalition(Start,End) :- begin('war_of_the_third_coalition',_,_,Start), end('war_of_the_third_coalition',_,_,End), Start=<End.

finally_war_of_the_third_coalition_during_5_12(Start,End) :- war_of_the_third_coalition(Start1,End1), (Start1-12)=<(End1-5), Start is (Start1-12), End is (End1-5), Start=<End.

finally_war_of_the_third_coalition_during_5_12_at_1780(Res) :- setof((Start,End),finally_war_of_the_third_coalition_during_5_12(Start,End),AllINtervals), checkvalidity(1780,AllINtervals,Res).

check_query() :- write('Query = finally_war_of_the_third_coalition_during_5_12_at_1780'), (finally_war_of_the_third_coalition_during_5_12_at_1780(true) -> write('\nRes   = true');write('\nRes   = false')).

