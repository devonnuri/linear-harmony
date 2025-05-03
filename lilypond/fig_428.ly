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
  dis4. cis8 d fis a c b4. a8 bes <<d, d'>> <<f, f'>> <<aes, aes'>> <<g,2. g'>> r8 bes, a c e g fis e d c \break
b4. a8 bes <<d, d'>> <<f, f'>> <<aes, aes'>> <<g,4. g'>> <<f,8 f'>> <<fis, fis'>> ais, cis e dis2. fis,4 f8 aes c es d c bes aes \bar "||" \break
g2. r8 bes a c e g fis e d c b2. r8 d, cis e gis b ais gis fis e \break
dis2. r8 fis f aes c es d c bes aes g2. r8 es cis e gis b ais gis fis e
  }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
