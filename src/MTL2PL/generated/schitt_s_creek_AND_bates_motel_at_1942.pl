:- include('database.pl').
schitt_s_creek(Start,End) :- begin('schitt_s_creek',_,_,Start), end('schitt_s_creek',_,_,End), Start=<End.

bates_motel(Start,End) :- begin('bates_motel',_,_,Start), end('bates_motel',_,_,End), Start=<End.

generate_facts_schitt_s_creek_AND_bates_motel([]) :- assert(schitt_s_creek_AND_bates_motel(-1,-1)).

generate_facts_schitt_s_creek_AND_bates_motel([(Start,End) | Tail]) :- assert(schitt_s_creek_AND_bates_motel(Start,End)), generate_facts_schitt_s_creek_AND_bates_motel(Tail).

schitt_s_creek_AND_bates_motel_aux() :- findall((Start,End),schitt_s_creek(Start,End),Interval1), findall((Start,End),bates_motel(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_schitt_s_creek_AND_bates_motel(Interval).

schitt_s_creek_AND_bates_motel_at_1942(Res) :- setof((Start,End),schitt_s_creek_AND_bates_motel(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = schitt_s_creek_AND_bates_motel_at_1942'), (schitt_s_creek_AND_bates_motel_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).
?- schitt_s_creek_AND_bates_motel_aux().

