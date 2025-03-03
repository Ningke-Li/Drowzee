:- include('database.pl').
geneva_conference(Start,End) :- begin('geneva_conference',_,_,Start), end('geneva_conference',_,_,End), Start=<End.

next_geneva_conference(Start,End) :- geneva_conference(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_geneva_conference_at_1953(Res) :- setof((Start,End),next_geneva_conference(Start,End),AllINtervals), checkvalidity(1953,AllINtervals,Res).

check_query() :- write('Query = next_geneva_conference_at_1953'), (next_geneva_conference_at_1953(true) -> write('\nRes   = true');write('\nRes   = false')).

