:- include('database.pl').
america_s_next_top_model(Start,End) :- begin('america_s_next_top_model',_,_,Start), end('america_s_next_top_model',_,_,End), Start=<End.

scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

generate_facts_america_s_next_top_model_AND_scooby_doo__mystery_incorporated([]) :- assert(america_s_next_top_model_AND_scooby_doo__mystery_incorporated(-1,-1)).

generate_facts_america_s_next_top_model_AND_scooby_doo__mystery_incorporated([(Start,End) | Tail]) :- assert(america_s_next_top_model_AND_scooby_doo__mystery_incorporated(Start,End)), generate_facts_america_s_next_top_model_AND_scooby_doo__mystery_incorporated(Tail).

america_s_next_top_model_AND_scooby_doo__mystery_incorporated_aux() :- findall((Start,End),america_s_next_top_model(Start,End),Interval1), findall((Start,End),scooby_doo__mystery_incorporated(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_america_s_next_top_model_AND_scooby_doo__mystery_incorporated(Interval).

america_s_next_top_model_AND_scooby_doo__mystery_incorporated_at_2012(Res) :- setof((Start,End),america_s_next_top_model_AND_scooby_doo__mystery_incorporated(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = america_s_next_top_model_AND_scooby_doo__mystery_incorporated_at_2012'), (america_s_next_top_model_AND_scooby_doo__mystery_incorporated_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- america_s_next_top_model_AND_scooby_doo__mystery_incorporated_aux().

