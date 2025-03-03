:- include('database.pl').
dirili___ertu_rul(Start,End) :- begin('dirili___ertu_rul',_,_,Start), end('dirili___ertu_rul',_,_,End), Start=<End.

mindhunter(Start,End) :- begin('mindhunter',_,_,Start), end('mindhunter',_,_,End), Start=<End.

generate_facts_dirili___ertu_rul_AND_mindhunter([]) :- assert(dirili___ertu_rul_AND_mindhunter(-1,-1)).

generate_facts_dirili___ertu_rul_AND_mindhunter([(Start,End) | Tail]) :- assert(dirili___ertu_rul_AND_mindhunter(Start,End)), generate_facts_dirili___ertu_rul_AND_mindhunter(Tail).

dirili___ertu_rul_AND_mindhunter_aux() :- findall((Start,End),dirili___ertu_rul(Start,End),Interval1), findall((Start,End),mindhunter(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dirili___ertu_rul_AND_mindhunter(Interval).

dirili___ertu_rul_AND_mindhunter_at_2017(Res) :- setof((Start,End),dirili___ertu_rul_AND_mindhunter(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = dirili___ertu_rul_AND_mindhunter_at_2017'), (dirili___ertu_rul_AND_mindhunter_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dirili___ertu_rul_AND_mindhunter_aux().

