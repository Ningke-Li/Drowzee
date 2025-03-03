:- include('database.pl').
spring_offensive(Start,End) :- begin('spring_offensive',_,_,Start), end('spring_offensive',_,_,End), Start=<End.

next_spring_offensive(Start,End) :- spring_offensive(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_spring_offensive_at_1880(Res) :- setof((Start,End),next_spring_offensive(Start,End),AllINtervals), checkvalidity(1880,AllINtervals,Res).

check_query() :- write('Query = next_spring_offensive_at_1880'), (next_spring_offensive_at_1880(true) -> write('\nRes   = true');write('\nRes   = false')).

