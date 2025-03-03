:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

victorious(Start,End) :- begin('victorious',_,_,Start), end('victorious',_,_,End), Start=<End.

generate_facts_the_good_wife_AND_victorious([]) :- assert(the_good_wife_AND_victorious(-1,-1)).

generate_facts_the_good_wife_AND_victorious([(Start,End) | Tail]) :- assert(the_good_wife_AND_victorious(Start,End)), generate_facts_the_good_wife_AND_victorious(Tail).

the_good_wife_AND_victorious_aux() :- findall((Start,End),the_good_wife(Start,End),Interval1), findall((Start,End),victorious(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_good_wife_AND_victorious(Interval).

the_good_wife_AND_victorious_at_1868(Res) :- setof((Start,End),the_good_wife_AND_victorious(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = the_good_wife_AND_victorious_at_1868'), (the_good_wife_AND_victorious_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_good_wife_AND_victorious_aux().

