:- include('database.pl').
gotham(Start,End) :- begin('gotham',_,_,Start), end('gotham',_,_,End), Start=<End.

globally_gotham_during_2_4(Start,End) :- gotham(Start1,End1), Start is (Start1-2), End is (End1-4), Start=<End.

next_globally_gotham_during_2_4(Start,End) :- globally_gotham_during_2_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_gotham_during_2_4_at_1871(Res) :- setof((Start,End),next_globally_gotham_during_2_4(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = next_globally_gotham_during_2_4_at_1871'), (next_globally_gotham_during_2_4_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).

