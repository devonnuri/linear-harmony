\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g1:m7 c:7 f
  }
  \new Staff \relative c' {
    d'8 bes g \xNotesOn d \xNotesOff fis \xNotesOn d \xNotesOff f d
  e g bes c \tuplet 3/2 {des es des} c bes a4 r r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
