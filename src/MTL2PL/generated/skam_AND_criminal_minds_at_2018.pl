:- include('database.pl').
skam(Start,End) :- begin('skam',_,_,Start), end('skam',_,_,End), Start=<End.

criminal_minds(Start,End) :- begin('criminal_minds',_,_,Start), end('criminal_minds',_,_,End), Start=<End.

generate_facts_skam_AND_criminal_minds([]) :- assert(skam_AND_criminal_minds(-1,-1)).

generate_facts_skam_AND_criminal_minds([(Start,End) | Tail]) :- assert(skam_AND_criminal_minds(Start,End)), generate_facts_skam_AND_criminal_minds(Tail).

skam_AND_criminal_minds_aux() :- findall((Start,End),skam(Start,End),Interval1), findall((Start,End),criminal_minds(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_skam_AND_criminal_minds(Interval).

skam_AND_criminal_minds_at_2018(Res) :- setof((Start,End),skam_AND_criminal_minds(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = skam_AND_criminal_minds_at_2018'), (skam_AND_criminal_minds_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- skam_AND_criminal_minds_aux().

