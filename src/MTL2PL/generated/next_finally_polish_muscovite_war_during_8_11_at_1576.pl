:- include('database.pl').
polish_muscovite_war(Start,End) :- begin('polish_muscovite_war',_,_,Start), end('polish_muscovite_war',_,_,End), Start=<End.

finally_polish_muscovite_war_during_8_11(Start,End) :- polish_muscovite_war(Start1,End1), (Start1-11)=<(End1-8), Start is (Start1-11), End is (End1-8), Start=<End.

next_finally_polish_muscovite_war_during_8_11(Start,End) :- finally_polish_muscovite_war_during_8_11(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_polish_muscovite_war_during_8_11_at_1576(Res) :- setof((Start,End),next_finally_polish_muscovite_war_during_8_11(Start,End),AllINtervals), checkvalidity(1576,AllINtervals,Res).

check_query() :- write('Query = next_finally_polish_muscovite_war_during_8_11_at_1576'), (next_finally_polish_muscovite_war_during_8_11_at_1576(true) -> write('\nRes   = true');write('\nRes   = false')).

