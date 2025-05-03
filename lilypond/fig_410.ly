\version "2.25.25"

\include "layout.ly"

\layout {
  \context {
    \ChordNames
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 6) (minimum-distance . 6))
  }
}

\score {
<<
  \chords {
    d1:7 r g:7 r c:7 r f:7 r bes
  }
  \new Staff \relative c' {
    \key bes \major
    % c'4^\markup {"(A" \hspace #-0.5 \sub {"−7"}} b a g fis^\markup {"D" \hspace #-0.5 \sub {"7"} \hspace #-0.5 ")"} e d c b2 d f a \break
    e'4^\markup {"(A" \hspace #-0.5 \sub {"−7"}} c a g fis^\markup {"D" \hspace #-0.5 \sub {"7"} \hspace #-0.5 ")"} a c e d1 b \break
    d4^\markup {"(G" \hspace #-0.5 \sub {"−7"}} bes g f e^\markup {"C" \hspace #-0.5 \sub {"7"} \hspace #-0.5 ")"} g bes d c2 a f es
    \bar "||"
    d2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
