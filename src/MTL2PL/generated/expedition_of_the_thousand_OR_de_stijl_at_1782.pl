:- include('database.pl').
expedition_of_the_thousand(Start,End) :- begin('expedition_of_the_thousand',_,_,Start), end('expedition_of_the_thousand',_,_,End), Start=<End.

de_stijl(Start,End) :- begin('de_stijl',_,_,Start), end('de_stijl',_,_,End), Start=<End.

generate_facts_expedition_of_the_thousand_OR_de_stijl([]) :- assert(expedition_of_the_thousand_OR_de_stijl(-1,-1)).

generate_facts_expedition_of_the_thousand_OR_de_stijl([(Start,End) | Tail]) :- assert(expedition_of_the_thousand_OR_de_stijl(Start,End)), generate_facts_expedition_of_the_thousand_OR_de_stijl(Tail).

expedition_of_the_thousand_OR_de_stijl_aux() :- findall((Start,End),expedition_of_the_thousand(Start,End),Interval1), findall((Start,End),de_stijl(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_expedition_of_the_thousand_OR_de_stijl(Interval).

expedition_of_the_thousand_OR_de_stijl_at_1782(Res) :- setof((Start,End),expedition_of_the_thousand_OR_de_stijl(Start,End),AllINtervals), checkvalidity(1782,AllINtervals,Res).

check_query() :- write('Query = expedition_of_the_thousand_OR_de_stijl_at_1782'), (expedition_of_the_thousand_OR_de_stijl_at_1782(true) -> write('\nRes   = true');write('\nRes   = false')).
?- expedition_of_the_thousand_OR_de_stijl_aux().

