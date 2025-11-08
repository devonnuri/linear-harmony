\version "2.25.25"

\include "layout.ly"

\layout {
  \context {
    \Score
    \override SpacingSpanner.common-shortest-duration =
      #(ly:make-moment 1/16)
  }
}

\score {
<<
  \new Staff \relative c' {
\override Score.BarLine.stencil = ##f
\override Stem.transparent = ##t
<c e g b>2
<d f a c>
<e g b d>
<f a c e>
<g b d f>
<a c e g>
<b d f a>
\revert Score.BarLine.stencil
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
