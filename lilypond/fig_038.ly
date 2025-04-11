\version "2.25.25"

\include "layout.ly"

<<
  \chords {
    \set Timing.measureLength = #3/4
    c2.:maj7
  }
  \relative {
    \set Timing.measureLength = #3/4
    e'4
    \override NoteHead.style = #'cross
    \override Stem.stencil = ##f
    \parenthesize
    g
    \revert NoteHead.style
    \revert Stem.stencil
    c
    \bar "||"
  }
>>
