:- include('database.pl').
washington_naval_conference(Start,End) :- begin('washington_naval_conference',_,_,Start), end('washington_naval_conference',_,_,End), Start=<End.

next_washington_naval_conference(Start,End) :- washington_naval_conference(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_washington_naval_conference_at_1921(Res) :- setof((Start,End),next_washington_naval_conference(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = next_washington_naval_conference_at_1921'), (next_washington_naval_conference_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

