:- include('database.pl').
pretty_little_liars(Start,End) :- begin('pretty_little_liars',_,_,Start), end('pretty_little_liars',_,_,End), Start=<End.

next_pretty_little_liars(Start,End) :- pretty_little_liars(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_pretty_little_liars_at_1923(Res) :- setof((Start,End),next_pretty_little_liars(Start,End),AllINtervals), checkvalidity(1923,AllINtervals,Res).

check_query() :- write('Query = next_pretty_little_liars_at_1923'), (next_pretty_little_liars_at_1923(true) -> write('\nRes   = true');write('\nRes   = false')).

