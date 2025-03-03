:- include('database.pl').
amundsen_s_south_pole_expedition(Start,End) :- begin('amundsen_s_south_pole_expedition',_,_,Start), end('amundsen_s_south_pole_expedition',_,_,End), Start=<End.

globally_amundsen_s_south_pole_expedition_during_1_2(Start,End) :- amundsen_s_south_pole_expedition(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_amundsen_s_south_pole_expedition_during_1_2_at_1909(Res) :- setof((Start,End),globally_amundsen_s_south_pole_expedition_during_1_2(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = globally_amundsen_s_south_pole_expedition_during_1_2_at_1909'), (globally_amundsen_s_south_pole_expedition_during_1_2_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).

