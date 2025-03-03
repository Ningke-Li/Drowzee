:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

battlestar_galactica(Start,End) :- begin('battlestar_galactica',_,_,Start), end('battlestar_galactica',_,_,End), Start=<End.

generate_facts_supernatural_AND_battlestar_galactica([]) :- assert(supernatural_AND_battlestar_galactica(-1,-1)).

generate_facts_supernatural_AND_battlestar_galactica([(Start,End) | Tail]) :- assert(supernatural_AND_battlestar_galactica(Start,End)), generate_facts_supernatural_AND_battlestar_galactica(Tail).

supernatural_AND_battlestar_galactica_aux() :- findall((Start,End),supernatural(Start,End),Interval1), findall((Start,End),battlestar_galactica(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_supernatural_AND_battlestar_galactica(Interval).

supernatural_AND_battlestar_galactica_at_2008(Res) :- setof((Start,End),supernatural_AND_battlestar_galactica(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = supernatural_AND_battlestar_galactica_at_2008'), (supernatural_AND_battlestar_galactica_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- supernatural_AND_battlestar_galactica_aux().

