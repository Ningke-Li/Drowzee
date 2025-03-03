:- include('database.pl').
mr__bean(Start,End) :- begin('mr__bean',_,_,Start), end('mr__bean',_,_,End), Start=<End.

lizzie_mcguire(Start,End) :- begin('lizzie_mcguire',_,_,Start), end('lizzie_mcguire',_,_,End), Start=<End.

generate_facts_mr__bean_AND_lizzie_mcguire([]) :- assert(mr__bean_AND_lizzie_mcguire(-1,-1)).

generate_facts_mr__bean_AND_lizzie_mcguire([(Start,End) | Tail]) :- assert(mr__bean_AND_lizzie_mcguire(Start,End)), generate_facts_mr__bean_AND_lizzie_mcguire(Tail).

mr__bean_AND_lizzie_mcguire_aux() :- findall((Start,End),mr__bean(Start,End),Interval1), findall((Start,End),lizzie_mcguire(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mr__bean_AND_lizzie_mcguire(Interval).

mr__bean_AND_lizzie_mcguire_at_2022(Res) :- setof((Start,End),mr__bean_AND_lizzie_mcguire(Start,End),AllINtervals), checkvalidity(2022,AllINtervals,Res).

check_query() :- write('Query = mr__bean_AND_lizzie_mcguire_at_2022'), (mr__bean_AND_lizzie_mcguire_at_2022(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mr__bean_AND_lizzie_mcguire_aux().

