#!/usr/bin/env escript

-module(millipede).
-mode(compile).


-define(Milli_offset, [2, 1, 0, 1, 2, 3, 4, 4, 3]).

print_padding_dec(0) ->
  ok;
print_padding_dec(Size) ->
  print_padding_dec(Size - 1),
  io:put_chars(" ").

print_body(Size) ->
  [Count] = lists:sublist(?Milli_offset, Size + 1, 1),
  print_padding_dec(Count),
  io:put_chars("╚═(███)═╝"),
  io:nl().

millipede(Size) ->
  io:put_chars("    ╚⊙ ⊙╝"),
  io:nl(),
  [ print_body(Idx rem length(?Milli_offset)) || Idx <- lists:seq(0, (Size-1)) ].

main([]) ->
  io:setopts([{encoding, unicode}]),
  millipede(20);
main([Argv]) ->
  io:setopts([{encoding, unicode}]),
  {Size, _} = string:to_integer(Argv),
  millipede(Size).
