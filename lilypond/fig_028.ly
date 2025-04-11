\version "2.25.25"

\include "layout.ly"

\paper {
  score-system-spacing.basic-distance = 20
}

<<
  \chords {
    d1:m7 g:7 d1:m7 g:7
  }
  \relative {
    \textMark \markup \column {\line {Outline no.1:} \vspace #0.5 \line {" "}}
    f''4 e d c b2 r
    \bar "||"

    \textMark \markup \column {\line {with added arpeggiated tone:} \vspace #0.5 \line {" "}}
    f'8 a, e' a, d a c a b2 r
    \bar "||"
  }
>>

<<
  \chords {
    d1:m7 g:7 d1:m7 g:7
  }
  \relative {
    \textMark \markup \column {\line {Outline no.2:} \vspace #0.5 \line {" "}}
    d'4 f a c b2 r
    \bar "||"

    \textMark \markup \column {\line {with added arpeggiated tone:} \vspace #0.5 \line {" "}}
    r8 d, a d f a c b~ b2 r
    \bar "||"
  }
>>

<<
  \chords {
    d1:m7 g:7 d1:m7 g:7
  }
  \relative {
    \textMark \markup \column {\line {Outline no.3:} \vspace #0.5 \line {" "}}
    a'4 f d c b2 r
    \bar "||"

    \textMark \markup \column {\line {with added arpeggiated tone:} \vspace #0.5 \line {" "}}
    r4 a'8 f d a c a b2 r
    \bar "||"
  }
>>
