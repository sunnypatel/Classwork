
Copyright (C) 2010 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Saturday September 25, 2010 at 5:58:04 PM
  Release 9.0.1 || Microcode 15.1 || Runtime 15.7 || SF 4.41 || LIAR/i386 4.118
  Edwin 3.116
;You are in an interaction window of the Edwin editor.
;Type `C-h' for help, or `C-h t' for a tutorial.
;`C-h m' will describe some commands.
;`C-h' means: hold down the Ctrl key and type `h'.
;Package: (user)

(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))