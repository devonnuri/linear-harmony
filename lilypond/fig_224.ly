\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    g1:m7 c:7 f
  }
  \new Staff \relative c' {
    r4 \tuplet 3/2 {g'8\startGroup bes d} f d dis e c cis d\stopGroup c bes\startGroup a g f e g bes des c\stopGroup a r4
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
