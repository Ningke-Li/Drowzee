:- include('database.pl').
war_of_the_spanish_succession(Start,End) :- begin('war_of_the_spanish_succession',_,_,Start), end('war_of_the_spanish_succession',_,_,End), Start=<End.

next_war_of_the_spanish_succession(Start,End) :- war_of_the_spanish_succession(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_war_of_the_spanish_succession_at_1706(Res) :- setof((Start,End),next_war_of_the_spanish_succession(Start,End),AllINtervals), checkvalidity(1706,AllINtervals,Res).

check_query() :- write('Query = next_war_of_the_spanish_succession_at_1706'), (next_war_of_the_spanish_succession_at_1706(true) -> write('\nRes   = true');write('\nRes   = false')).

