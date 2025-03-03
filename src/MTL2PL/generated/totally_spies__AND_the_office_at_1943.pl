:- include('database.pl').
totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

the_office(Start,End) :- begin('the_office',_,_,Start), end('the_office',_,_,End), Start=<End.

generate_facts_totally_spies__AND_the_office([]) :- assert(totally_spies__AND_the_office(-1,-1)).

generate_facts_totally_spies__AND_the_office([(Start,End) | Tail]) :- assert(totally_spies__AND_the_office(Start,End)), generate_facts_totally_spies__AND_the_office(Tail).

totally_spies__AND_the_office_aux() :- findall((Start,End),totally_spies_(Start,End),Interval1), findall((Start,End),the_office(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_totally_spies__AND_the_office(Interval).

totally_spies__AND_the_office_at_1943(Res) :- setof((Start,End),totally_spies__AND_the_office(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = totally_spies__AND_the_office_at_1943'), (totally_spies__AND_the_office_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- totally_spies__AND_the_office_aux().

