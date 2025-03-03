:- include('database.pl').
mr__bean(Start,End) :- begin('mr__bean',_,_,Start), end('mr__bean',_,_,End), Start=<End.

a_n_t__farm(Start,End) :- begin('a_n_t__farm',_,_,Start), end('a_n_t__farm',_,_,End), Start=<End.

mr__bean_last_till_8_10(Start,End) :- mr__bean(Start1,End1), (End1-Start1)>=8, Start is (Start1+8), End is (End1+1).

mr__bean_until_a_n_t__farm_during_8_10_overlap(Start,End) :- mr__bean_last_till_8_10(Start1,End1), a_n_t__farm(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mr__bean_until_a_n_t__farm_during_8_10(Start,End) :- mr__bean(W1,_), mr__bean_until_a_n_t__farm_during_8_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-8), Start=<End.

mr__bean_until_a_n_t__farm_during_8_10_at_2009(Res) :- setof((Start,End),mr__bean_until_a_n_t__farm_during_8_10(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = mr__bean_until_a_n_t__farm_during_8_10_at_2009'), (mr__bean_until_a_n_t__farm_during_8_10_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

