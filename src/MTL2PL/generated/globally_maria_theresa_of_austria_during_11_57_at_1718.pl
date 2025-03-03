:- include('database.pl').
maria_theresa_of_austria(Start,End) :- begin('maria_theresa_of_austria',_,_,Start), end('maria_theresa_of_austria',_,_,End), Start=<End.

globally_maria_theresa_of_austria_during_11_57(Start,End) :- maria_theresa_of_austria(Start1,End1), Start is (Start1-11), End is (End1-57), Start=<End.

globally_maria_theresa_of_austria_during_11_57_at_1718(Res) :- setof((Start,End),globally_maria_theresa_of_austria_during_11_57(Start,End),AllINtervals), checkvalidity(1718,AllINtervals,Res).

check_query() :- write('Query = globally_maria_theresa_of_austria_during_11_57_at_1718'), (globally_maria_theresa_of_austria_during_11_57_at_1718(true) -> write('\nRes   = true');write('\nRes   = false')).

