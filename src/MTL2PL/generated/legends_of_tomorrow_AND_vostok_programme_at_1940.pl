:- include('database.pl').
legends_of_tomorrow(Start,End) :- begin('legends_of_tomorrow',_,_,Start), end('legends_of_tomorrow',_,_,End), Start=<End.

vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

generate_facts_legends_of_tomorrow_AND_vostok_programme([]) :- assert(legends_of_tomorrow_AND_vostok_programme(-1,-1)).

generate_facts_legends_of_tomorrow_AND_vostok_programme([(Start,End) | Tail]) :- assert(legends_of_tomorrow_AND_vostok_programme(Start,End)), generate_facts_legends_of_tomorrow_AND_vostok_programme(Tail).

legends_of_tomorrow_AND_vostok_programme_aux() :- findall((Start,End),legends_of_tomorrow(Start,End),Interval1), findall((Start,End),vostok_programme(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_legends_of_tomorrow_AND_vostok_programme(Interval).

legends_of_tomorrow_AND_vostok_programme_at_1940(Res) :- setof((Start,End),legends_of_tomorrow_AND_vostok_programme(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = legends_of_tomorrow_AND_vostok_programme_at_1940'), (legends_of_tomorrow_AND_vostok_programme_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).
?- legends_of_tomorrow_AND_vostok_programme_aux().

