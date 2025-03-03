:- include('database.pl').
endless_love(Start,End) :- begin('endless_love',_,_,Start), end('endless_love',_,_,End), Start=<End.

star_wars__clone_wars(Start,End) :- begin('star_wars__clone_wars',_,_,Start), end('star_wars__clone_wars',_,_,End), Start=<End.

generate_facts_endless_love_OR_star_wars__clone_wars([]) :- assert(endless_love_OR_star_wars__clone_wars(-1,-1)).

generate_facts_endless_love_OR_star_wars__clone_wars([(Start,End) | Tail]) :- assert(endless_love_OR_star_wars__clone_wars(Start,End)), generate_facts_endless_love_OR_star_wars__clone_wars(Tail).

endless_love_OR_star_wars__clone_wars_aux() :- findall((Start,End),endless_love(Start,End),Interval1), findall((Start,End),star_wars__clone_wars(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_endless_love_OR_star_wars__clone_wars(Interval).

endless_love_OR_star_wars__clone_wars_at_1878(Res) :- setof((Start,End),endless_love_OR_star_wars__clone_wars(Start,End),AllINtervals), checkvalidity(1878,AllINtervals,Res).

check_query() :- write('Query = endless_love_OR_star_wars__clone_wars_at_1878'), (endless_love_OR_star_wars__clone_wars_at_1878(true) -> write('\nRes   = true');write('\nRes   = false')).
?- endless_love_OR_star_wars__clone_wars_aux().

