\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    b2 d:7 g bes:7 es1:maj7 a2:m7 d:7
    g bes:7 es fis:7 b1 f2:m7 bes:7
    es1:maj7 a2:m7 d:7 g1:maj7 cis2:m7 fis:7
    b1:maj7 f2:m7 bes:7 es1:maj7 cis2:m7 fis:7
  }
  \new Staff \relative c' {
  \repeat volta 2 { 
  dis4. cis8 d fis a c b4. a8 bes <<d, d'>> <<f, f'>> <<aes, aes'>> <<g,2. g'>> r8 d c4. e,8 d fis a c \break
  b4. a8 bes <<d, d'>> <<f, f'>> <<aes, aes'>> <<g,4. g'>> <<f,8 f'>> <<fis, fis'>> ais, cis e dis2. r4 aes4. c8 bes <<d, d'>> <<f, f'>> <<aes, aes'>> \bar "||" \break
<<g,2. g'>> r4 c,4. <<e,8 e'>> <<d, d'>> fis, a c b2. r4 e4. gis,8 fis ais cis e \break
dis2. r4 aes4. c8 bes <<d, d'>> <<f, f'>> <<aes, aes'>> g2. r8 <<es, es'>> <<e,4. e'>> gis,8 fis <<ais, ais'>> <<cis, cis'>> e,
  }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
