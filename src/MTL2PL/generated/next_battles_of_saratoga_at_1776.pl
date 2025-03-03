:- include('database.pl').
battles_of_saratoga(Start,End) :- begin('battles_of_saratoga',_,_,Start), end('battles_of_saratoga',_,_,End), Start=<End.

next_battles_of_saratoga(Start,End) :- battles_of_saratoga(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battles_of_saratoga_at_1776(Res) :- setof((Start,End),next_battles_of_saratoga(Start,End),AllINtervals), checkvalidity(1776,AllINtervals,Res).

check_query() :- write('Query = next_battles_of_saratoga_at_1776'), (next_battles_of_saratoga_at_1776(true) -> write('\nRes   = true');write('\nRes   = false')).

