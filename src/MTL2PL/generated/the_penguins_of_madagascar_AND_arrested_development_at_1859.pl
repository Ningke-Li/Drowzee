:- include('database.pl').
the_penguins_of_madagascar(Start,End) :- begin('the_penguins_of_madagascar',_,_,Start), end('the_penguins_of_madagascar',_,_,End), Start=<End.

arrested_development(Start,End) :- begin('arrested_development',_,_,Start), end('arrested_development',_,_,End), Start=<End.

generate_facts_the_penguins_of_madagascar_AND_arrested_development([]) :- assert(the_penguins_of_madagascar_AND_arrested_development(-1,-1)).

generate_facts_the_penguins_of_madagascar_AND_arrested_development([(Start,End) | Tail]) :- assert(the_penguins_of_madagascar_AND_arrested_development(Start,End)), generate_facts_the_penguins_of_madagascar_AND_arrested_development(Tail).

the_penguins_of_madagascar_AND_arrested_development_aux() :- findall((Start,End),the_penguins_of_madagascar(Start,End),Interval1), findall((Start,End),arrested_development(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_penguins_of_madagascar_AND_arrested_development(Interval).

the_penguins_of_madagascar_AND_arrested_development_at_1859(Res) :- setof((Start,End),the_penguins_of_madagascar_AND_arrested_development(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = the_penguins_of_madagascar_AND_arrested_development_at_1859'), (the_penguins_of_madagascar_AND_arrested_development_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_penguins_of_madagascar_AND_arrested_development_aux().

