\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:7 r g:7 r c:7 r f:7 r bes
  }
  \new Staff \relative c' {
    \key bes \major
    <<fis2 fis'>> <<e, e'>> <<d, d'>> <<c, c'>> <<b, b'>> <<a a'>> <<g, g'>> <<f, f'>> \break
    <<e, e'>> <<d, d'>> <<c, c'>> <<bes, bes'>> <<a, a'>> <<g g'>> <<f, f'>> <<es, es'>>
    \bar "||"
    <<d, d'>> r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
