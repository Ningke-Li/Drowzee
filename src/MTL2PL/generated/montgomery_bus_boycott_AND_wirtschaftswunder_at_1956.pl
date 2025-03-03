:- include('database.pl').
montgomery_bus_boycott(Start,End) :- begin('montgomery_bus_boycott',_,_,Start), end('montgomery_bus_boycott',_,_,End), Start=<End.

wirtschaftswunder(Start,End) :- begin('wirtschaftswunder',_,_,Start), end('wirtschaftswunder',_,_,End), Start=<End.

generate_facts_montgomery_bus_boycott_AND_wirtschaftswunder([]) :- assert(montgomery_bus_boycott_AND_wirtschaftswunder(-1,-1)).

generate_facts_montgomery_bus_boycott_AND_wirtschaftswunder([(Start,End) | Tail]) :- assert(montgomery_bus_boycott_AND_wirtschaftswunder(Start,End)), generate_facts_montgomery_bus_boycott_AND_wirtschaftswunder(Tail).

montgomery_bus_boycott_AND_wirtschaftswunder_aux() :- findall((Start,End),montgomery_bus_boycott(Start,End),Interval1), findall((Start,End),wirtschaftswunder(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_montgomery_bus_boycott_AND_wirtschaftswunder(Interval).

montgomery_bus_boycott_AND_wirtschaftswunder_at_1956(Res) :- setof((Start,End),montgomery_bus_boycott_AND_wirtschaftswunder(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = montgomery_bus_boycott_AND_wirtschaftswunder_at_1956'), (montgomery_bus_boycott_AND_wirtschaftswunder_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).
?- montgomery_bus_boycott_AND_wirtschaftswunder_aux().

