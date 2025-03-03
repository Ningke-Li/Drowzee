:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

magnificent_century(Start,End) :- begin('magnificent_century',_,_,Start), end('magnificent_century',_,_,End), Start=<End.

generate_facts_csi__miami_AND_magnificent_century([]) :- assert(csi__miami_AND_magnificent_century(-1,-1)).

generate_facts_csi__miami_AND_magnificent_century([(Start,End) | Tail]) :- assert(csi__miami_AND_magnificent_century(Start,End)), generate_facts_csi__miami_AND_magnificent_century(Tail).

csi__miami_AND_magnificent_century_aux() :- findall((Start,End),csi__miami(Start,End),Interval1), findall((Start,End),magnificent_century(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_csi__miami_AND_magnificent_century(Interval).

csi__miami_AND_magnificent_century_at_2011(Res) :- setof((Start,End),csi__miami_AND_magnificent_century(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = csi__miami_AND_magnificent_century_at_2011'), (csi__miami_AND_magnificent_century_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- csi__miami_AND_magnificent_century_aux().

