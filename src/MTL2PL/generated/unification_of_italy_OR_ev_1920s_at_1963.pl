:- include('database.pl').
unification_of_italy(Start,End) :- begin('unification_of_italy',_,_,Start), end('unification_of_italy',_,_,End), Start=<End.

ev_1920s(Start,End) :- begin('ev_1920s',_,_,Start), end('ev_1920s',_,_,End), Start=<End.

generate_facts_unification_of_italy_OR_ev_1920s([]) :- assert(unification_of_italy_OR_ev_1920s(-1,-1)).

generate_facts_unification_of_italy_OR_ev_1920s([(Start,End) | Tail]) :- assert(unification_of_italy_OR_ev_1920s(Start,End)), generate_facts_unification_of_italy_OR_ev_1920s(Tail).

unification_of_italy_OR_ev_1920s_aux() :- findall((Start,End),unification_of_italy(Start,End),Interval1), findall((Start,End),ev_1920s(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_unification_of_italy_OR_ev_1920s(Interval).

unification_of_italy_OR_ev_1920s_at_1963(Res) :- setof((Start,End),unification_of_italy_OR_ev_1920s(Start,End),AllINtervals), checkvalidity(1963,AllINtervals,Res).

check_query() :- write('Query = unification_of_italy_OR_ev_1920s_at_1963'), (unification_of_italy_OR_ev_1920s_at_1963(true) -> write('\nRes   = true');write('\nRes   = false')).
?- unification_of_italy_OR_ev_1920s_aux().

