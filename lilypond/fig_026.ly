\version "2.25.25"

\include "layout.ly"

<<
  \relative {
    \time 5/4
    \once \override Staff.TimeSignature.stencil = ##f
    c'2 des8 b! c2
    e2 f8 dis e2
    g2 aes8 fis g2
    \bar "||"
  }
>>
