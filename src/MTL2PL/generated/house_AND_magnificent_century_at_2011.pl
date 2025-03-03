:- include('database.pl').
house(Start,End) :- begin('house',_,_,Start), end('house',_,_,End), Start=<End.

magnificent_century(Start,End) :- begin('magnificent_century',_,_,Start), end('magnificent_century',_,_,End), Start=<End.

generate_facts_house_AND_magnificent_century([]) :- assert(house_AND_magnificent_century(-1,-1)).

generate_facts_house_AND_magnificent_century([(Start,End) | Tail]) :- assert(house_AND_magnificent_century(Start,End)), generate_facts_house_AND_magnificent_century(Tail).

house_AND_magnificent_century_aux() :- findall((Start,End),house(Start,End),Interval1), findall((Start,End),magnificent_century(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_house_AND_magnificent_century(Interval).

house_AND_magnificent_century_at_2011(Res) :- setof((Start,End),house_AND_magnificent_century(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = house_AND_magnificent_century_at_2011'), (house_AND_magnificent_century_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- house_AND_magnificent_century_aux().

