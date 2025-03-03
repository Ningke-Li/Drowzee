:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

history_of_the_soviet_union(Start,End) :- begin('history_of_the_soviet_union',_,_,Start), end('history_of_the_soviet_union',_,_,End), Start=<End.

bol_var_last_till_28_34(Start,End) :- bol_var(Start1,End1), (End1-Start1)>=28, Start is (Start1+28), End is (End1+1).

bol_var_until_history_of_the_soviet_union_during_28_34_overlap(Start,End) :- bol_var_last_till_28_34(Start1,End1), history_of_the_soviet_union(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

bol_var_until_history_of_the_soviet_union_during_28_34(Start,End) :- bol_var(W1,_), bol_var_until_history_of_the_soviet_union_during_28_34_overlap(Start1,End1), Start is max((Start1-34),W1), End is (End1-28), Start=<End.

bol_var_until_history_of_the_soviet_union_during_28_34_at_1951(Res) :- setof((Start,End),bol_var_until_history_of_the_soviet_union_during_28_34(Start,End),AllINtervals), checkvalidity(1951,AllINtervals,Res).

check_query() :- write('Query = bol_var_until_history_of_the_soviet_union_during_28_34_at_1951'), (bol_var_until_history_of_the_soviet_union_during_28_34_at_1951(true) -> write('\nRes   = true');write('\nRes   = false')).

