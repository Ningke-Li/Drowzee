:- include('database.pl').
prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

globally_prison_break_during_2_8(Start,End) :- prison_break(Start1,End1), Start is (Start1-2), End is (End1-8), Start=<End.

globally_prison_break_during_2_8_at_2008(Res) :- setof((Start,End),globally_prison_break_during_2_8(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = globally_prison_break_during_2_8_at_2008'), (globally_prison_break_during_2_8_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

