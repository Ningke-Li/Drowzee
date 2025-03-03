:- include('database.pl').
sakoku(Start,End) :- begin('sakoku',_,_,Start), end('sakoku',_,_,End), Start=<End.

congress_of_vienna(Start,End) :- begin('congress_of_vienna',_,_,Start), end('congress_of_vienna',_,_,End), Start=<End.

generate_facts_sakoku_AND_congress_of_vienna([]) :- assert(sakoku_AND_congress_of_vienna(-1,-1)).

generate_facts_sakoku_AND_congress_of_vienna([(Start,End) | Tail]) :- assert(sakoku_AND_congress_of_vienna(Start,End)), generate_facts_sakoku_AND_congress_of_vienna(Tail).

sakoku_AND_congress_of_vienna_aux() :- findall((Start,End),sakoku(Start,End),Interval1), findall((Start,End),congress_of_vienna(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_sakoku_AND_congress_of_vienna(Interval).

sakoku_AND_congress_of_vienna_at_1759(Res) :- setof((Start,End),sakoku_AND_congress_of_vienna(Start,End),AllINtervals), checkvalidity(1759,AllINtervals,Res).

check_query() :- write('Query = sakoku_AND_congress_of_vienna_at_1759'), (sakoku_AND_congress_of_vienna_at_1759(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sakoku_AND_congress_of_vienna_aux().

