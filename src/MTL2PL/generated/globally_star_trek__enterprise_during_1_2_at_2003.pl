:- include('database.pl').
star_trek__enterprise(Start,End) :- begin('star_trek__enterprise',_,_,Start), end('star_trek__enterprise',_,_,End), Start=<End.

globally_star_trek__enterprise_during_1_2(Start,End) :- star_trek__enterprise(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_star_trek__enterprise_during_1_2_at_2003(Res) :- setof((Start,End),globally_star_trek__enterprise_during_1_2(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = globally_star_trek__enterprise_during_1_2_at_2003'), (globally_star_trek__enterprise_during_1_2_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

