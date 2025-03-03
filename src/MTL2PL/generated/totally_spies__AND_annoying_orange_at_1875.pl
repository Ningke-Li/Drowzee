:- include('database.pl').
totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

generate_facts_totally_spies__AND_annoying_orange([]) :- assert(totally_spies__AND_annoying_orange(-1,-1)).

generate_facts_totally_spies__AND_annoying_orange([(Start,End) | Tail]) :- assert(totally_spies__AND_annoying_orange(Start,End)), generate_facts_totally_spies__AND_annoying_orange(Tail).

totally_spies__AND_annoying_orange_aux() :- findall((Start,End),totally_spies_(Start,End),Interval1), findall((Start,End),annoying_orange(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_totally_spies__AND_annoying_orange(Interval).

totally_spies__AND_annoying_orange_at_1875(Res) :- setof((Start,End),totally_spies__AND_annoying_orange(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = totally_spies__AND_annoying_orange_at_1875'), (totally_spies__AND_annoying_orange_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).
?- totally_spies__AND_annoying_orange_aux().

