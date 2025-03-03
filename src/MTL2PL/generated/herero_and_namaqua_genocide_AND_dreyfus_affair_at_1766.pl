:- include('database.pl').
herero_and_namaqua_genocide(Start,End) :- begin('herero_and_namaqua_genocide',_,_,Start), end('herero_and_namaqua_genocide',_,_,End), Start=<End.

dreyfus_affair(Start,End) :- begin('dreyfus_affair',_,_,Start), end('dreyfus_affair',_,_,End), Start=<End.

generate_facts_herero_and_namaqua_genocide_AND_dreyfus_affair([]) :- assert(herero_and_namaqua_genocide_AND_dreyfus_affair(-1,-1)).

generate_facts_herero_and_namaqua_genocide_AND_dreyfus_affair([(Start,End) | Tail]) :- assert(herero_and_namaqua_genocide_AND_dreyfus_affair(Start,End)), generate_facts_herero_and_namaqua_genocide_AND_dreyfus_affair(Tail).

herero_and_namaqua_genocide_AND_dreyfus_affair_aux() :- findall((Start,End),herero_and_namaqua_genocide(Start,End),Interval1), findall((Start,End),dreyfus_affair(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_herero_and_namaqua_genocide_AND_dreyfus_affair(Interval).

herero_and_namaqua_genocide_AND_dreyfus_affair_at_1766(Res) :- setof((Start,End),herero_and_namaqua_genocide_AND_dreyfus_affair(Start,End),AllINtervals), checkvalidity(1766,AllINtervals,Res).

check_query() :- write('Query = herero_and_namaqua_genocide_AND_dreyfus_affair_at_1766'), (herero_and_namaqua_genocide_AND_dreyfus_affair_at_1766(true) -> write('\nRes   = true');write('\nRes   = false')).
?- herero_and_namaqua_genocide_AND_dreyfus_affair_aux().

