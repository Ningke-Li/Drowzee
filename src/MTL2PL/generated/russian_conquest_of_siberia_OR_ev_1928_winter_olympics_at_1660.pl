:- include('database.pl').
russian_conquest_of_siberia(Start,End) :- begin('russian_conquest_of_siberia',_,_,Start), end('russian_conquest_of_siberia',_,_,End), Start=<End.

ev_1928_winter_olympics(Start,End) :- begin('ev_1928_winter_olympics',_,_,Start), end('ev_1928_winter_olympics',_,_,End), Start=<End.

generate_facts_russian_conquest_of_siberia_OR_ev_1928_winter_olympics([]) :- assert(russian_conquest_of_siberia_OR_ev_1928_winter_olympics(-1,-1)).

generate_facts_russian_conquest_of_siberia_OR_ev_1928_winter_olympics([(Start,End) | Tail]) :- assert(russian_conquest_of_siberia_OR_ev_1928_winter_olympics(Start,End)), generate_facts_russian_conquest_of_siberia_OR_ev_1928_winter_olympics(Tail).

russian_conquest_of_siberia_OR_ev_1928_winter_olympics_aux() :- findall((Start,End),russian_conquest_of_siberia(Start,End),Interval1), findall((Start,End),ev_1928_winter_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_russian_conquest_of_siberia_OR_ev_1928_winter_olympics(Interval).

russian_conquest_of_siberia_OR_ev_1928_winter_olympics_at_1660(Res) :- setof((Start,End),russian_conquest_of_siberia_OR_ev_1928_winter_olympics(Start,End),AllINtervals), checkvalidity(1660,AllINtervals,Res).

check_query() :- write('Query = russian_conquest_of_siberia_OR_ev_1928_winter_olympics_at_1660'), (russian_conquest_of_siberia_OR_ev_1928_winter_olympics_at_1660(true) -> write('\nRes   = true');write('\nRes   = false')).
?- russian_conquest_of_siberia_OR_ev_1928_winter_olympics_aux().

