:- include('database.pl').
cosmos__a_spacetime_odyssey(Start,End) :- begin('cosmos__a_spacetime_odyssey',_,_,Start), end('cosmos__a_spacetime_odyssey',_,_,End), Start=<End.

cyclone_nargis(Start,End) :- begin('cyclone_nargis',_,_,Start), end('cyclone_nargis',_,_,End), Start=<End.

generate_facts_cosmos__a_spacetime_odyssey_OR_cyclone_nargis([]) :- assert(cosmos__a_spacetime_odyssey_OR_cyclone_nargis(-1,-1)).

generate_facts_cosmos__a_spacetime_odyssey_OR_cyclone_nargis([(Start,End) | Tail]) :- assert(cosmos__a_spacetime_odyssey_OR_cyclone_nargis(Start,End)), generate_facts_cosmos__a_spacetime_odyssey_OR_cyclone_nargis(Tail).

cosmos__a_spacetime_odyssey_OR_cyclone_nargis_aux() :- findall((Start,End),cosmos__a_spacetime_odyssey(Start,End),Interval1), findall((Start,End),cyclone_nargis(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_cosmos__a_spacetime_odyssey_OR_cyclone_nargis(Interval).

cosmos__a_spacetime_odyssey_OR_cyclone_nargis_at_1881(Res) :- setof((Start,End),cosmos__a_spacetime_odyssey_OR_cyclone_nargis(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = cosmos__a_spacetime_odyssey_OR_cyclone_nargis_at_1881'), (cosmos__a_spacetime_odyssey_OR_cyclone_nargis_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cosmos__a_spacetime_odyssey_OR_cyclone_nargis_aux().

