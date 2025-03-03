:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

the_o_c_(Start,End) :- begin('the_o_c_',_,_,Start), end('the_o_c_',_,_,End), Start=<End.

generate_facts_world_heavyweight_championship_rey_mysterio_AND_the_o_c_([]) :- assert(world_heavyweight_championship_rey_mysterio_AND_the_o_c_(-1,-1)).

generate_facts_world_heavyweight_championship_rey_mysterio_AND_the_o_c_([(Start,End) | Tail]) :- assert(world_heavyweight_championship_rey_mysterio_AND_the_o_c_(Start,End)), generate_facts_world_heavyweight_championship_rey_mysterio_AND_the_o_c_(Tail).

world_heavyweight_championship_rey_mysterio_AND_the_o_c__aux() :- findall((Start,End),world_heavyweight_championship_rey_mysterio(Start,End),Interval1), findall((Start,End),the_o_c_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_world_heavyweight_championship_rey_mysterio_AND_the_o_c_(Interval).

world_heavyweight_championship_rey_mysterio_AND_the_o_c__at_2000(Res) :- setof((Start,End),world_heavyweight_championship_rey_mysterio_AND_the_o_c_(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = world_heavyweight_championship_rey_mysterio_AND_the_o_c__at_2000'), (world_heavyweight_championship_rey_mysterio_AND_the_o_c__at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_heavyweight_championship_rey_mysterio_AND_the_o_c__aux().

