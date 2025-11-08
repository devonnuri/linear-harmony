\version "2.25.25"

\include "layout.ly"

\score {
<<
  \new StaffGroup <<
    \new Staff <<
      \clef treble
      \relative c' {
        f'4 e d c b a g f e1
        \bar "||"
      }
    >>
    \chords { d1:m7 g:7 c:maj7 }
    \new Staff <<
      \clef bass
      \relative c {
        d4 e f fis g g, a b c1
      }
    >>
  >>
>>
\layout {}
\midi {\tempo 4 = 160}
}
