:- include('database.pl').
council_of_florence(Start,End) :- begin('council_of_florence',_,_,Start), end('council_of_florence',_,_,End), Start=<End.

next_council_of_florence(Start,End) :- council_of_florence(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_council_of_florence_at_1433(Res) :- setof((Start,End),next_council_of_florence(Start,End),AllINtervals), checkvalidity(1433,AllINtervals,Res).

check_query() :- write('Query = next_council_of_florence_at_1433'), (next_council_of_florence_at_1433(true) -> write('\nRes   = true');write('\nRes   = false')).

