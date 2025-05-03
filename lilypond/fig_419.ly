\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e1:m7.5- a:7 c:m7 f:7
    f:m7 bes:7 es:maj7 aes:7
    bes:maj7 e2:m7.5- a:7 d1:m7 bes2:m7 es:7
    f1:maj7 e2:m7.5- a:7 a1:m7.5- d:7
    g:7 r c:m7 r
    aes:7 r bes:maj7 r
    e:m7.5- a:7 d:m7.5- g:7
    c:m7.5- f:7 bes:maj7
  }
  \new Staff \relative c' {
    \key bes \major
    g'2 <<bes, bes'>> <<a,4 a'>> <<cis, cis'>> <<e, e'>> <<g, g'>> <<f,2 f'>> r f,4 a c es \break
    c2 r <<bes,4 bes'>> d, f aes g2 r aes4 <<c, c'>> <<es, es'>> <<ges, ges'>> \bar "||" \break
    <<f,2 f'>> r r a,8 cis e g f2 r des4. f,8 es g bes des \break
    c2 r d des c2. es,4 d fis a c \bar "||" \break
    b1 g4 b d f es1 g, \break
    ges es4 ges bes d c2 a f d \bar "||" \break
    g2. bes4 a cis e g f2. aes,4 g b d f \break
    es2. ges,4 f a c es d1~ d \fine
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
