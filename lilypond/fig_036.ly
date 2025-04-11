\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    d1:m7 g2..:7 c8
    r1
    d1:m7 g2..:7 c8
  }
  \relative {
    \textMark \markup \column {\line {Outline with alternate octave displaced path:} \vspace #0.5 \line {" "}}
    f'4 <e e'> <d d'> <c c'> <b b'> <a' a'> <g g'> <f f'>8 <e e'>
    \hideNotes
    r1
    \unHideNotes
    \bar "||"

    \textMark \markup \column {\line {Octave displacement filled in with arpeggio:} \vspace #0.5 \line {" "}}
    f8 a c e d4 c
    b8 d f a g4 f8 e
    \bar "||"
  }
>>
