:- include('database.pl').
chowder(Start,End) :- begin('chowder',_,_,Start), end('chowder',_,_,End), Start=<End.

this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

generate_facts_chowder_OR_this_is_us([]) :- assert(chowder_OR_this_is_us(-1,-1)).

generate_facts_chowder_OR_this_is_us([(Start,End) | Tail]) :- assert(chowder_OR_this_is_us(Start,End)), generate_facts_chowder_OR_this_is_us(Tail).

chowder_OR_this_is_us_aux() :- findall((Start,End),chowder(Start,End),Interval1), findall((Start,End),this_is_us(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_chowder_OR_this_is_us(Interval).

chowder_OR_this_is_us_at_2020(Res) :- setof((Start,End),chowder_OR_this_is_us(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = chowder_OR_this_is_us_at_2020'), (chowder_OR_this_is_us_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).
?- chowder_OR_this_is_us_aux().

