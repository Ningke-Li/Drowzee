:- include('database.pl').
schitt_s_creek(Start,End) :- begin('schitt_s_creek',_,_,Start), end('schitt_s_creek',_,_,End), Start=<End.

uefa_euro_2016_group_c(Start,End) :- begin('uefa_euro_2016_group_c',_,_,Start), end('uefa_euro_2016_group_c',_,_,End), Start=<End.

generate_facts_schitt_s_creek_OR_uefa_euro_2016_group_c([]) :- assert(schitt_s_creek_OR_uefa_euro_2016_group_c(-1,-1)).

generate_facts_schitt_s_creek_OR_uefa_euro_2016_group_c([(Start,End) | Tail]) :- assert(schitt_s_creek_OR_uefa_euro_2016_group_c(Start,End)), generate_facts_schitt_s_creek_OR_uefa_euro_2016_group_c(Tail).

schitt_s_creek_OR_uefa_euro_2016_group_c_aux() :- findall((Start,End),schitt_s_creek(Start,End),Interval1), findall((Start,End),uefa_euro_2016_group_c(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_schitt_s_creek_OR_uefa_euro_2016_group_c(Interval).

schitt_s_creek_OR_uefa_euro_2016_group_c_at_1975(Res) :- setof((Start,End),schitt_s_creek_OR_uefa_euro_2016_group_c(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = schitt_s_creek_OR_uefa_euro_2016_group_c_at_1975'), (schitt_s_creek_OR_uefa_euro_2016_group_c_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).
?- schitt_s_creek_OR_uefa_euro_2016_group_c_aux().

