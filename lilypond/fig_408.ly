\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:7 r g:7 r c:7 r f:7 r bes
  }
  \new Staff \relative c' {
    \key bes \major
    a'2 fis d c b d f a \break
    g e <<c c'>> <<bes, bes'>> <<a, a'>> c <<es, es'>> <<g, g'>>
    \bar "||"
    <<f, f'>> r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
