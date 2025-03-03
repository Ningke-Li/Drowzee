:- include('database.pl').
ev_2011_england_riots(Start,End) :- begin('ev_2011_england_riots',_,_,Start), end('ev_2011_england_riots',_,_,End), Start=<End.

finally_ev_2011_england_riots_during_4_14(Start,End) :- ev_2011_england_riots(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

finally_ev_2011_england_riots_during_4_14_at_1882(Res) :- setof((Start,End),finally_ev_2011_england_riots_during_4_14(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2011_england_riots_during_4_14_at_1882'), (finally_ev_2011_england_riots_during_4_14_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).

