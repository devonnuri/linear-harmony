\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    bes2 g:7 c:m7 f:7 bes g:7 c:m7 f:7 f:m7 bes:7 es4. aes8:7 r2 d:m7.5- g:7 c:m7 f:7
  }
  \new Staff \relative c' {
    \key bes \major
    \repeat volta 2 {
      a'8 f d c b d f aes g es c bes a c es g f4. bes8 r4 f8 es~ es2 r4 bes'8 b
      c aes f es d f aes c bes g4 bes8 ges4 bes8 f~ f4. es'8 d b g f es g bes d c a f es
    }
    d4 r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
