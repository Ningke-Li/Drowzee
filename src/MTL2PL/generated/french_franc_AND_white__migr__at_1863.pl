:- include('database.pl').
french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

white__migr_(Start,End) :- begin('white__migr_',_,_,Start), end('white__migr_',_,_,End), Start=<End.

generate_facts_french_franc_AND_white__migr_([]) :- assert(french_franc_AND_white__migr_(-1,-1)).

generate_facts_french_franc_AND_white__migr_([(Start,End) | Tail]) :- assert(french_franc_AND_white__migr_(Start,End)), generate_facts_french_franc_AND_white__migr_(Tail).

french_franc_AND_white__migr__aux() :- findall((Start,End),french_franc(Start,End),Interval1), findall((Start,End),white__migr_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_french_franc_AND_white__migr_(Interval).

french_franc_AND_white__migr__at_1863(Res) :- setof((Start,End),french_franc_AND_white__migr_(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = french_franc_AND_white__migr__at_1863'), (french_franc_AND_white__migr__at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).
?- french_franc_AND_white__migr__aux().

