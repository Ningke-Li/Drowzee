:- include('database.pl').
annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

globally_annoying_orange_during_7_10(Start,End) :- annoying_orange(Start1,End1), Start is (Start1-7), End is (End1-10), Start=<End.

globally_annoying_orange_during_7_10_at_1913(Res) :- setof((Start,End),globally_annoying_orange_during_7_10(Start,End),AllINtervals), checkvalidity(1913,AllINtervals,Res).

check_query() :- write('Query = globally_annoying_orange_during_7_10_at_1913'), (globally_annoying_orange_during_7_10_at_1913(true) -> write('\nRes   = true');write('\nRes   = false')).

