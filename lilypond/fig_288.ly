\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    c2:m7 f:7 bes:m7 es:7 aes1:maj7
  }
  \new Staff \relative c' {
    <<
    \new Voice {
      es'8 des c bes a ges' es e
      \once \override HorizontalBracket.direction = #UP
      f\startGroup des bes aes g\stopGroup e' des d es4 r r2
      \bar "||"
    }
    \new Voice {
      \hideNotes
      \magnifyMusic 0.01 {
        % little hack
        r1\startGroup \normalsize r8\stopGroup s2.. s1
      }
    }
    >>
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
