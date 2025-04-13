\version "2.25.25"

\include "layout.ly"


\layout {
  \context {
    \ChordNames
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 5.5) (minimum-distance . 6))
  }
}

\score {
<<
  \chords {
    g2:m7 c:7 a:m7 d:7 g:m7 a:7 d1:m7
  }
  \new Staff \relative c' {
    <<
    \new Voice {
      g8 bes d f e g bes d
      \once \override HorizontalBracket.direction = #UP
      e\startGroup c a g fis\stopGroup 
      d'\startGroup bes g f dis e\stopGroup g c bes g gis a4 r r2
      \bar "||"
    }
    \new Voice {
      \hideNotes
      \magnifyMusic 0.01 {
        % little hack
        r1\startGroup \normalsize r8\stopGroup s2.. s1 s1
      }
    }
  >>
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
