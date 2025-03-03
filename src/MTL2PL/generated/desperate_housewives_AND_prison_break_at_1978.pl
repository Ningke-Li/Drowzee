:- include('database.pl').
desperate_housewives(Start,End) :- begin('desperate_housewives',_,_,Start), end('desperate_housewives',_,_,End), Start=<End.

prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

generate_facts_desperate_housewives_AND_prison_break([]) :- assert(desperate_housewives_AND_prison_break(-1,-1)).

generate_facts_desperate_housewives_AND_prison_break([(Start,End) | Tail]) :- assert(desperate_housewives_AND_prison_break(Start,End)), generate_facts_desperate_housewives_AND_prison_break(Tail).

desperate_housewives_AND_prison_break_aux() :- findall((Start,End),desperate_housewives(Start,End),Interval1), findall((Start,End),prison_break(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_desperate_housewives_AND_prison_break(Interval).

desperate_housewives_AND_prison_break_at_1978(Res) :- setof((Start,End),desperate_housewives_AND_prison_break(Start,End),AllINtervals), checkvalidity(1978,AllINtervals,Res).

check_query() :- write('Query = desperate_housewives_AND_prison_break_at_1978'), (desperate_housewives_AND_prison_break_at_1978(true) -> write('\nRes   = true');write('\nRes   = false')).
?- desperate_housewives_AND_prison_break_aux().

