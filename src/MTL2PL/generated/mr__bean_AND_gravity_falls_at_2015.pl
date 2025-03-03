:- include('database.pl').
mr__bean(Start,End) :- begin('mr__bean',_,_,Start), end('mr__bean',_,_,End), Start=<End.

gravity_falls(Start,End) :- begin('gravity_falls',_,_,Start), end('gravity_falls',_,_,End), Start=<End.

generate_facts_mr__bean_AND_gravity_falls([]) :- assert(mr__bean_AND_gravity_falls(-1,-1)).

generate_facts_mr__bean_AND_gravity_falls([(Start,End) | Tail]) :- assert(mr__bean_AND_gravity_falls(Start,End)), generate_facts_mr__bean_AND_gravity_falls(Tail).

mr__bean_AND_gravity_falls_aux() :- findall((Start,End),mr__bean(Start,End),Interval1), findall((Start,End),gravity_falls(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mr__bean_AND_gravity_falls(Interval).

mr__bean_AND_gravity_falls_at_2015(Res) :- setof((Start,End),mr__bean_AND_gravity_falls(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = mr__bean_AND_gravity_falls_at_2015'), (mr__bean_AND_gravity_falls_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mr__bean_AND_gravity_falls_aux().

