#import "@preview/orange-book:0.4.0": book, part, chapter, my-bibliography, appendices, make-index, index, theorem, definition, notation,remark,corollary,proposition,example,exercise, problem, vocabulary, scr, update-heading-image, thmbox

//#set text(font: "Linux Libertine")
//#set text(font: "TeX Gyre Pagella")
//#set text(font: "Lato")
//#show math.equation: set text(font: "Fira Math")
//#show math.equation: set text(font: "Lato Math")
//#show raw: set text(font: "Fira Code")

#let main-color = rgb("#999999")

#let outlinebox(title: [], width: 100%, body) = block(
  fill: none, stroke: 0.5pt + main-color, radius: 0pt, width: width, body, inset: 10pt)

#let exercisebox(body) = outlinebox[
  #align(center)[*Suggested Exercises*]
  
  #body
]

#let padbox(body) = block(inset: (x: 20pt, y: 20pt), body)

#let note(notestr) = {
  let pat = regex("([A-Ga-g]|[IViv]+)(#|b|nat)?")
  let match = notestr.match(pat)
  assert(match != none, message: "Invalid note string")

  let (root, root_fs) = match.captures

  root_fs = if root_fs == "#" { $sharp$ } else if root_fs == "b" { $flat$ } else if root_fs == "nat" { $natural$ } else { $$ }

  $upright(#root)^#root_fs$
}



#let chord(chordstr) = {
  let pat = regex("((?:[A-G]|[IViv]+)(?:#|b)?)(M|m|dim|aug|halfdim|sus2|sus4|sus)?((?:[#b]?\d+)*)?(?:\/((?:[A-G]|[IViv]+)(?:#|b)?))?(?:\|(.+))?")
  let match = chordstr.match(pat)
  assert(match != none, message: "Invalid chord string")

  let (root, quality, extalt_str, slash, denom) = match.captures

  root = note(root)
  
  quality = if quality == "M" { $triangle.small$ } else if quality == "m" { $-$ } else if quality == "dim" { $degree$ } else if quality == "aug" { $+$ } else if quality == "halfdim" { $ø$ } else if quality == "sus2" { $upright(sus2)$ } else if quality == "sus4" { $upright(sus4)$ } else if quality == "sus" { $upright(sus)$ } else { none }

  quality = if quality != none { $#h(-0.05em)#quality$ } else { $$ }
  
  let extalt = extalt_str.matches(regex("([#b])?(\d+)")).map(x => (x.captures.at(0), x.captures.at(1))).map(x => (if x.at(0) == "#" { $sharp$ } else if x.at(0) == "b" { $flat$ } else { $$ }, x.at(1))).map(x => $#x.at(0) #x.at(1)$).join("")
  
  slash = if slash != none { $\/ #note(slash)$ } else { $$ }
  
  let denom_chord = if denom != none { chord(denom) } else { $$ }

  let num_chord = $#root quality #h(-0.05em)#extalt #slash$

  if denom != none {
    $#num_chord / #denom_chord$
  } else {
    $#num_chord$
  }
}

#show: book.with(
  title: "Connecting Chords with Linear Harmony",
  author: "Bert Ligon",
  main-color: main-color,
  paper-size: "a4",
  lang: "en",
  // list-of-figure-title: "List of Figures",
  // list-of-table-title: "List of Tables",
  supplement-chapter: "Chapter",
  supplement-part: "Part",
  part-style: 0,
  copyright: [
    © 1996 Houston Publishing, Inc.

    224 South Lebanon Street, Lebanon, IN, 46052, USA

    All Rights Reserved International Copyright Secured Printed In The USA
  ],
  lowercase-references: false
)

#chapter("Introduction", l: "chap1")

One of the goals of teaching jazz improvisation is having the students play
rhythmically coherent and harmonically specific lines. Most improvisation
students come to class with the ability to play lines that are harmonically
and rhythmically vague. With many great jazz solos, the rhythm section
could be removed and the time, form and harmony would still be heard in
the improvised lines. Too often beginning improvisers depend on the
rhythm section to provide the harmony and rhythm, while they skate over
the top. Many jazz texts and classes deal with jazz theory material related to
individual chords. Sonny Rollins talked of how Dizzy Gillespie could really
connect the chords. This book examines the linear connection of which
Rollins spoke, the connections between these chords in great jazz solos.
This text is meant to augment other books by exploring in detail the linear-
horizontal connections of jazz materials in the improvised jazz melody line
based on solos excerpts from outstanding jazz artists.

== Approaches to Improvisation

There are basically three approaches to improvising on jazz standards:
melodic paraphrasing, improvising with the harmony, and motivic
development which may overlap the previous two. This book deals with the
second area, improvising with the harmony. Techniques in elaborating the
harmonic outlines discussed here may be applied to paraphrasing.

== Approaches to Improvising on the Harmony

There are many ways of approaching the melodic and harmonic material in
the jazz literature. After transcribing and examining hundreds of jazz solos,
I find great jazz musicians approach the harmonic implications in three
ways: harmonic specificity, harmonic generalization, or ignoring harmonic
implications.

- *Harmonic Specificity*: Careful attention to the implications of harmony. Reliance on proper thirds, sevenths resolving appropriately. Adhering to alterations called for by the chord symbols or the melodic implications of the composition.

- *Harmonic Generalization*: Rather than deal with the specifics of the implied harmony, reliance on blues ideas and scales. In the instance of a ii - V, it is often generalized as a I chord. For example: with the progression

  #align(center)[#image("figures/fig_004.jpg", width: 34%)]

  the C major triad or C major Blues scale is used for the entire phrase.

  #align(center)[#image("figures/fig_005.jpg", width: 50%)]

- *Ignoring the implications*: This can be the result of the improvised line following the direction of motivic based improvisation; the improviser choosing to impose alternate harmony over the pre-existing harmony; the improviser choosing to create tension by deliberately playing notes foreign to the implied harmony.

Experienced jazz improvisers move in and out of the above areas. They are
always able to play harmonically specific, and often after being general or
vague they will return to the specifics. When an experienced jazz
improviser plays deliberately vague, he does so knowing the harmonic
implications, and therefore knowing just what tones to avoid.

The beginning improviser usually progresses backwards to specificity;
playing mostly wrong notes in the beginning; discovering blues licks and
harmonic generalization inserting throughout a tune; and after playing
experience, practice and study, learning how to be more specific with the
chord implications; finally integrating, blending and keeping a balance
between harmonic clarity and ambiguity.

This book will help the beginning and experienced jazz improvisation
student to achieve harmonic clarity in their improvised lines. I have taken
hundreds of melodic examples from the solos of several great jazz artists. I
have examined them and determined the framework, their underlying
skeleton, and divided them into three basic outlines. These outlines are like
public domain melodies that are used by almost every composer and
improviser in a harmonic framework from Bach to Brecker, Adderley to
Zawinul. For each outline, I discuss the devices several jazz artists have
used to make the outlines musically interesting.

I do not suggest that these outlines are all that exist or can be done with
harmonically specific jazz improvisation. These outlines are found in such
abundance, from a wide variety of sources, from a long span of jazz history,
that they provide a solid introduction to clear, no-nonsense improvisation.
These outlines are not meant to be restrictive or stultify creativity. The wide
spectrum of jazz improvisers included here apparently found numerous
ways to individualize the essence of the harmony without masking their
own personality or individual creativity.

Rather than propose these outlines, and invent examples to illustrate them, I
have chosen to go to the source: the jazz artists, extract the principles, and
let the actual excerpts act as the illustrations. In this sense, this concept is
descriptive rather than prescriptive. There is no way to know what these
improvisers were thinking when they conceived their lines, but we can
carefully examine and analyze the results. The jazz inventors and their
music are the final authority.

== Basic Theory

=== Diatonic Chords and Roman Numerals

Throughout this book, chords will be referred to by their relationship to the tonic or tonal center. Roman numerals are used to show this relationship. When dealing with harmony in a major key, the chords are assumed to be derived from the major scale. When dealing with harmony in a minor key, the chords are assumed to be derived from the _harmonic_ minor scale. There are other minor scales, but this discussion of harmony deals only with harmonic minor. Harmonic minor has a lowered third and sixth degree, but retains the raised leading tone so that the chord built on the fifth degree of the scale is a dominant chord. The seventh scale tone also effects the chords built on the third and seventh scale degrees.

In both the major and minor scales there are seven tones, so each chord built on that tone will be assigned a Roman numeral one through seven. Uppercase Roman numerals are assigned to major chords, lowercase numerals to minor and diminished chords. Numerals for diminished chords are followed by the symbol "$degree$". Half-diminished chords will _not_ be referred to as minor seven flat five chords; this suggests an alteration has been made (the flat five) where none has (the chord is found naturally in both major and harmonic minor scales). Lowercase numerals for half-diminished chords are followed by the symbol "ø".

For every major key area, just as the intervalic relationships are the same (W W 1/2 W W W 1/2), so are the diatonic chords and their qualities. The tonic chord will always be major, the supertonic minor and so on. If a supertonic chord appears to be major, then it is not a supertonic chord. The chord is functioning to point out a different tonic; it may be borrowed from another key (parallel minor, etc.) or modulating or tonicizing another chord with its dominant.

The following are the diatonic chords in the key of C major and their Roman numerals:

#align(center)[#image("figures/fig_006.jpg", width: 50%)]

The following are the diatonic chords in the key of C minor (harmonic) and their Roman numerals:

#align(center)[#image("figures/fig_007.jpg", width: 50%)]

=== Modulations and Secondary Dominants

In much of the harmonic music from Baroque to present pop and jazz styles, modulations rarely move farther than one accidental up or down. If a tune is in the key of C it is likely to modulate to 1 sharp (G major/ E minor) and to 1 flat (F major/ D minor) and to its relative minor. Dominant chords are used to tonicize the new key. These are called secondary dominants, as they point to the secondary keys. To improvise over these dominants, the notes of the new key have to be taken in to consideration. In the key of C major we may see the following secondary dominants listed below with the key to which they point and the necessary accidentals. To fully understand, make a list of the secondary dominants for all keys.

Secondary dominant chords, or borrowed chords will be shown in their relationship to their function. If an A7, the dominant of D minor, occurs in a progression in the key of C major, it will appear as V7/ii. It will never be shown as a VI chord in the key of C; the vi chord in C is a minor chord. Since A7 is the dominant of D minor, and D minor is the ii chord in the given key of C, then A7 is the dominant of the ii chord: V7/ii.

Typical modulations or tonicization from home key of C major shown with secondary dominants, Roman numerals and necessary accidentals:

#align(center)[#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  stroke: 0.5pt,
  table.header(
    [*New key area to be tonicized*], [*Secondary Dominant*], [*Necessary Accidentals*],
  ),
  [#chord("ii") $=$ #chord("Dm")], [#chord("A7") (#chord("V7/ii"))], [#note("Bb") and #note("C#")],
  [#chord("iii") $=$ #chord("Em")], [#chord("B7") (#chord("V7/iii"))], [#note("F#") and #note("D#")],
  [#chord("IV") $=$ #chord("FM")], [#chord("C7") (#chord("V7/IV"))], [#note("Bb")],
  [#chord("V") $=$ #chord("GM")], [#chord("D7") (#chord("V7/V"))], [#note("F#")],
  [#chord("vi") $=$ #chord("Am")], [#chord("E7") (#chord("V7/vi"))], [#note("G#")],
)]

=== Consonance and Dissonance

The terms consonance and dissonance will refer to their stability or instability in the harmonic framework. The terms have nothing to do with being esthetically pleasing or displeasing. Consonant intervals will sound at rest; dissonant intervals want to resolve to a consonant note. Ironically, the dissonant notes are often more attractive to a jazz musician because of their tendency of motion.

=== Harmonic Rhythm and the Jazz Performance

Harmonic rhythm is the rhythm of the harmonic changes. If chords change every two beats, the harmonic rhythm is half-notes. If chords change every four beats, the harmonic rhythm is whole notes. There is a variety of harmonic rhythm in jazz performances and not all of it corresponds to the meter or to where it is written on the page. If there is one chord per measure in 4/4, we expect the bass to play the root of the chord on beat one, corresponding to where the chord symbol is notated on the page. The pianist or guitarist may anticipate each chord symbol playing the changes on the upbeat of four. This is part of the polyrhythmic energy of a jazz rhythm section. The melody or improvised solo may play with the bass, with the accompaniment instruments, anticipate the changes even more, or delay the resolution into the next measure. It is important to remember this when analyzing written solos. We confine the written notes of a line to measures, but the harmonic implications are not always confined to those measures. The vertical alignment of notes may often seem senseless, but when viewed in the larger harmonic scheme the soloists may have anticipated or suspended the melodic material of one chord over another chord. This is not unique to jazz; church hymnals are full of suspensions. Jazz suspensions may involve many notes. Do not fall into the trap of labeling everything by its vertical arrangement. Music is heard and conceived in a linear manner and should be studied in the same way.

#exercisebox[
  + On staff paper write out the diatonic chords for 13 major keys (use #note("F#") and #note("Gb")). Identify the chords with their Roman numerals using the proper case and suffix.
  + On staff paper write out the diatonic chords for 13 minor keys (use #note("D#") and #note("Eb")): Make sure that harmonic minor is used. Check the accidentals. The raised seventh effects the #chord("iM7"), #chord("IIIM7#5"), #chord("viidim") and #chord("V7") chords. Identify the chords with their roman numerals using the proper case and suffix.
  + Make a chart like the one show above for all major key areas. Show new key area to be tonicized, the secondary dominant, and the necessary accidentals.
  + Practice singing the accidentals. Make up melodies that modulate from C to the closely related keys. Use the necessary accidentals to get to the next key. Sing melodies that bring it back to the key of #note("C").
  + Using common jazz and pop tunes, analyze the progressions using Roman numerals to help determine the key area.
]

#chapter("Linear Harmony", l: "chap2")

Students often conceive of harmony as strictly verticał; as chords spelled up or down. Chords are vertical., but harmony and melodies are linear and occur over time. Applying principles of harmony to melodic development helps us think of harmony and melody as one unified concept.

Jazz improvisation often means creating counterpoint from a given harmonic progression; inventing a counter melody to the bass line. Choosing the best notes is crucial for counterpoint. The experienced jazz improviser does not depend on a piano playing chords for his lines to make sense. The lines make sense because of well chosen and well placed notes in relation to the bass line.

*NARROWING THE NOTE CHOICES FROM THE TWELVE CHROMATIC PITCHES AVAILABLE:*

The bass player's role is to create a line based on the root progression. If the improviser is to create a counter line to the bass line, the roots of the chords would not be the best choice for emphasis in the melody: if the roots are sounding in the bass and the melody there is no counter point, just parallel octaves. Eliminating the root leaves eleven other notes to choose from; all of which are used by jazz artists. Each of the eleven remaining notes have relative degrees of harmonic clarity.

Determining the key center will further help narrow the field. In a key center there are seven pitches. We have already ruled out the root (the bass has it), and that leaves six. In most instances any of these six pitches will sound fine, but may not always be harmonically specific. The note F is the key of C major, but would not be the first choice to emphasize for harmonic clarity over a C chord.

A chord symbol usually suggest three to four pitches. For example: Dm7 suggests D-F-A-C. These tones are obviously harmonically specific, and should be considered for the counterline. The D is covered by the bass. The A tells us nothing of the quality of the chord. The C is dissonant in the sense it is restless; it wants to pull down to B natural. F reveals the minor quality of the chord and is the best choice for harmonically specific counterpoint over the D in the bass. Playing just the F over the D in the bass sounds like a complete minor chord even though only two notes are being played.

In the case of a ii - V7 - I progression in C major (Dm7 - G7 - C) the bass improvises a line starting on D and leads to G. F, the third of the chord, is a good choice for beginning a counter line. With the F sounding over the D, the minor chord is heard. For the same reasons, the B is the clearest choice for the G chord, the E for the C chord. After determining the best choices for target notes, the challenge is to connect them in an interesting way.

#align(center)[#image("figures/fig_009.jpg", width: 44%)]

Our ears tell us that the sevenths are restless and want to resolve downward. From the study of traditional harmony, we find the 7th of chords in these progressions resolve downward to the third of the following chord. The seventh is the pointer. The seventh of D minor 7, C, resolves stepwise to the B of the G chord. The seventh of G is F resolving stepwise down to the E of the C chord. The framework of the line is smoother and less angular than before.

#align(center)[#image("figures/fig_010.jpg", width: 44%)]

The seventh creates tension and the desire to hear the resolution to the third of the following chord. For this reason, it is often the last note played before moving to the next chord. Sometimes it is delayed into the next measure, creating a suspension.

*Linear harmony* is melodic lines that connect the chords smoothly using the significant tones with careful rhythmic placement. Good voice leading is observed; sevenths resolve to thirds, ninths to fifths. Thirds are more consonant and usually occur earlier in a melody line before the more dissonant sevenths. Sevenths typically resolve over the barline to the third of the next chord beginning the cycle again. Consonance/dissonance/resolution.

How many ways are there to connect these consonances and dissonances, thirds to sevenths to thirds? For an improvisation class, students were to bring in short examples from jazz solos. As a class, we would extract basic principles of music from the examples. We noticed after a very short time, that all of the examples seem to fit into three categories. They were based on the same three basic skeletal frameworks. All of them followed the principles of linear harmony: consonant notes (usually thirds) in rhythmically significant places leading to dissonances (sevenths) which resolved to consonant notes again, usually over the barline.

The three frameworks, or outlines, are found at the heart of much music based on a harmonic system. Knowing the outlines should not in any way stifle creativity. On the contrary, knowing them should inspire creativity. The outlines are skeletons. Our bodies all have similar skeletons yet we all look unique. All houses have similar framework and yet are recognizable different. Many sentences share the same structure of parts of speech, and yet can express many diverse ideas. Hundreds of musical examples can have the same basic outlines and still retain their individual musical identity.

== Creating the Basic Outlines

=== Outline No.1

#padbox[
  Placing the third on beat one and waiting for beat four to play the seventh, leaves only two beats to fill to create a “walking” quarter note melody line to counter the walking bass line. By moving down the scale, a stepwise line is created from the third of the ii chord through the V7 chord and down to the third of the I chord.

  #align(center)[#image("figures/fig_011.jpg", width: 47%)]
]

This is the basis for Outline No.1. It works well with any clear bass line, as shown. It is found more often than the other outlines. This could be due to its harmonic clarity, and its pleasing descending stepwise progression.

There are some variations of outline No.1.

#padbox[
  The first variation is octave displacement, usually after the target note:

  #align(center)[#image("figures/fig_012.jpg", width: 47%)]

  Another variation is using an ascending arpeggio (3-5-7-9) on the V7 chord resolving to the fifth of the tonic chord:

  #align(center)[#image("figures/fig_013.jpg", width: 47%)]

  Any of the variations apply in a minor key as well. Keep in mind the key signature, and raise the leading tone to create a V7 chord. The ii7 becomes iiø7 and the V7 chord has a flatted 9:

  #align(center)[#image("figures/fig_014.jpg", width: 47%)]

  Any of the variations work when the harmonic rhythm is diminished (changed from whole notes to half-notes):
]

#align(center)[#image("figures/fig_015.jpg", width: 38%)]

=== Outline No.2

I call outline no.2 the "'Round Midnight" outline. It occurs two times in the A section of _'Round Midnight_. Outline no.2 is an ascending arpeggio of the ii chord (1-3-5) with the added restless tone (7) above the chord, which resolves to the third of the V7 chord. The outline may continue down the scale arriving at the target third of the tonic:

#align(center)[#image("figures/fig_016.jpg", width: 47%)]

or continue down the scale, but with octave displacement:

#align(center)[#image("figures/fig_017.jpg", width: 47%)]

or, after reaching the third of the V7 chord, may arpeggiate the V7 chord (3-5-7-9)

#align(center)[#image("figures/fig_018.jpg", width: 47%)]

All versions of outline no.2 work in minor keys.

#align(center)[#image("figures/fig_019.jpg", width: 47%)]

#align(center)[#image("figures/fig_020.jpg", width: 47%)]

=== OUTLINE No.3

While outline no.2 begins with an ascending arpeggio of the ii chord (1-3-5), outline no.3 begins with the _descending_ arpeggio of the ii chord (5-3-1), adds the restless tone (7) below the chord, which resolves to the third of the V7 chord. The seventh usually occurs on the upbeat; the target third on the strong downbeat. After reaching the dominant chord, the line most often changes direction and arpeggiates up from the third (3-5-7-9) to finally resolve on the fifth of the tonic chord.

#align(center)[#image("figures/fig_021.jpg", width: 47%)]

One variation is for the line to continue down the scale landing on the third of the tonic chord:

#align(center)[#image("figures/fig_022.jpg", width: 47%)]

Another variation is for the scale direction to be changed with octave displacement:

#align(center)[#image("figures/fig_023.jpg", width: 47%)]

All versions of outline no.3 work in minor keys.

#align(center)[#image("figures/fig_024.jpg", width: 47%)]

#exercisebox[
  + The basic outlines are shown over a ii - V7 - I progression in C major (Dm7 - G7 - C ), the most. common progression in the key of C major. On staff paper write outline no.1 in all major keys. Identify the chords above by their name (i.e. Dm7 - G7 - C).
  + On staff paper write outline no.2 in all major keys. Identify the chords above by their name (i.e. Dm7 - G7 - C).
  + On staff paper write outline no.3 in all major keys. Identify the chords above by their name (i.e. Dm7 - G7 - C).
  + Practice singing the all three outlines. Use the outlines to sing modulations to closely related keys and back again making sure to sing the necessary accidentals.
]

#chapter("Embellishing Devices", l: "chap3")


Before we get to the musical examples in this book, it would be helpful to define the different types of embellishing devices used by jazz artists. The musical examples are divided into the three types of outlines, and then by the types of devices used to elaborate those basic outlines. Some outlines are often found without any elaboration or decoration of any kind. Sometimes the only device used to make them interesting is their rhythmic placement. They also can be found seemingly buried in chromaticism and embellishment. The following is a discussion of the embellishment devices, terms and clarifying examples. These devices will become more familiar as you progress through the book.

== Simple

Often the outlines occur with little or no elaboration. This would include simple rhythmic displacement without any added or extra notes.

== Passing Tones

Passing tones are the chromatic and diatonic steps between the essential tones. In a chord, the diatonic notes between the chord members: C major = C (d) E (f) G (a b) C. In a scale, the chromatic tones between the adjacent scale steps: C (#note("C#")) D (#note("d#")) etc. A chromatic passing tone can be placed between any adjacent diatonic tones a whole step apart. Any diatonic tone can have a chromatic leading tone. C sharp is the chromatic leading tone to D, and the chromatic passing tone between C natural and D. D flat is the chromatic passing tone between D natural and C natural. The difference in C sharp and D flat is the direction implied by the accidental. Chromatically altered tones tend to continue in the direction in which they have been altered. Flatted notes are lowered and therefore have downward tendencies, sharped notes are raised and have upward tendencies.

Since the _'Round Midnight_ outline is an arpeggiated outline, it lends itself to passing tones between the chord tones. However, there is rarely a passing tone between the 5th and 7th of the ii chord. The tone between the 5th and 7th of the ii chord is the essential tone of the V7 chord. This tone is usually saved for the V7 chord. It is the punch line, the denouement of the story, the conclusion not given away by using it ahead of time as a passing tone.

== Neighbor Tones

The tones above and below the essential tone. The common practice (from Mozart to Charlie Parker) is to use the diatonic (from the key) upper neighbor tone (UNT) and the chromatic lower neighbor tone (LNT).

In the case of a C triad in the key of F _major :_ C, E and G are the essential tones. #note("Dnat") is the UNT to C, #note("Bnat") the LNT. F natural is the UNT to E, #note("D#") the LNT. A natural is the UNT to G, #note("F#") the LNT:

#align(center)[#image("figures/fig_025.jpg", width: 47%)]

In the case of a C triad in the key F _minor :_ C, E and G are the essential tones. #note("Db") is the UNT to C, #note("Bnat") the LNT. F natural is the UNT to E, #note("D#") the LNT. #note("Ab") is the UNT to G, #note("F#") the LNT:
#align(center)[#image("figures/fig_026.jpg", width: 47%)]

== Arpeggiated Tones

Elaboration of the simple line by leaping to other notes from the chord often giving the line more angularity and interest.
#align(center)[#image("figures/fig_027.jpg", width: 71%)]

#align(center)[A common arpeggiation tone is the fifth of the ii chord played in a lower octave.]

#align(center)[#image("figures/fig_028.jpg", width: 65%)]

== Extensions

On outline no.2 the arpeggio is frequently extended the to 9th and sometimes to the 11th before descending to the 3rd of the V7 chord.


The _'Round Midnight_ outline typically begins on the root of the ii chord. Bill Evans, Clifford Brown and others sometimes use the same idea, but begin on the 3rd of the ii chord.

== Chromatic Approaches

Chromatic approaches usually involve a diatonic note and a chromatically altered note leading to an essential tone. It may begin with the diatonic tone followed by the chromatic tone as a passing tone into the essential tone, or it may begin with the chromatic tone then a diatonic neighbor tone leading to the essential tone. The chromaticism adds color to the lines and rhythmic interest with the additional pitches. The target notes often occur on strong beats in the measure. Target notes may be encircled by chromatic approaches from above and below. (see Encirling tones)


#padbox[
  The third of the ii chord may be approached chromatically from a whole step above:

  #align(center)[#image("figures/fig_029.jpg", width: 22%)]

  or from below:

  #align(center)[#image("figures/fig_030.jpg", width: 22%)]

  or from both:

  #align(center)[#image("figures/fig_031.jpg", width: 22%)]

  The 3rd of the V chord is often approached from below with a diatonic tone followed by the chromatic passing tone and then the 3rd:

  #align(center)[#image("figures/fig_032.jpg", width: 22%)]

  The third of the V chord is often approached chromatically from above and below. (see discussion of C.E.S.H. below)

  #align(center)[#image("figures/fig_033.jpg", width: 35%)]

  The third of the I chord is often approached with a chromatic passing tone:

  #align(center)[#image("figures/fig_034.jpg", width: 35%)]
]

== Octave Displacement

One or more tones placed in another octave. This often makes the line more interesting by introducing a leap. Octave displacement is often necessary due to the ranges of the instruments, dramatic interest becoming a serendipitous result. Leaps most often occur after the main guide-tone, leap from down beat to upbeat; never over the barline and rarely from a weak beat to a strong beat. Leaps may involve arpeggiated tones in unexpected moves. Arpeggiated leaps occur when a moving from a chord tone to another chord tone skipping over a chord tone. Moving from the third of a chord up to its fifth is a movement larger than a step, but does not involve skipping over another chord tone. Moving from the third of a chord _down_ to its fifth involves a leap of a sixth, skipping over the root of the chord.

#align(center)[#image("figures/fig_035.jpg", width: 35%)]

There are several instances of octave displacement included in the musical examples. The three most common occurrences leap after the arriving on the third of the chord.

#padbox[
  3rd up to the 9th or flat 9th: A simple descending scale step (3—2) becomes dramatic when a descending second is replaced with a leap of a seventh. The fifth and seventh are skipped over. After the leap up, the scale usually continues to descend.. Sometimes when leaping from the third to the ninth the chord tones are not skipped. The simple line is octave displaced by using an 3-5-7-9 arpeggio.

  #align(center)[#image("figures/fig_036.jpg", width: 77%)]
  
  3rd down to the 5th: Rather than an ascending arpeggio, 3 $arrow.tr.filled$ 5 $arrow.tr.filled$ 7 $arrow.tr.filled$ 9, the line will leap down a 6th, from the 3rd of the chord to the 5th of the chord skipping over the root, and then continue ascending the arpeggio: 3 $arrow.br.filled$ 5 $arrow.tr.filled$ 7 $arrow.tr.filled$ 9.
  #align(center)[#image("figures/fig_037.jpg", width: 35%)]
  
  3rd up to the root: Replace the descending leap from the 3rd of the chord to the root with a leap from the third up to the root, skipping over the fifth. This often ends the line; motion tends to stop after hearing the root of the tonic chord.
  #align(center)[#image("figures/fig_038.jpg", width: 23%)]

]

== Encircling Tones

The use of both neighbor tones before the essential tone. In some cases the essential tone is approached by several chromatic approach steps above and below. (See examples under chromatic approaches)

== C.E.S.H.

Jerry Coker's acronym for Chromatic Elaboration of Static Harmony. The most common example in a ii - V progression is the descending movement from the root of the ii chord to the third of the V7 chord. In the key of C (D minor - G7), the movement of D-#note("C#")-C-B. Other notes (the static harmony) are played in between the chromatic descending tones, sometimes implying compound melodies#footnote[A single melody line that implies two or more independent lines within is a compound melody.]. There are excellent examples of compound melodies throughout the literature, especially Bach solo cello sonatas. (See later examples in this book: Parker: ex.113)

#align(center)[#image("figures/fig_039.jpg", width: 35%)]

== Anticipation

Arriving at the next chord ahead of time, often creating a small dissonance resolved when the harmony catches up with the melody.

== Delayed Resolution

Suspending the resolution of one chord into the next chord. Arriving at the target chord late creating dissonance resolved when the melody catches up with the harmony.

== Sawtooth

A consistent up and down movement like the teeth on a saw. Often involves a pivot note or arpeggiated note: G-D-F-D-E.
#align(center)[#image("figures/fig_040.jpg", width: 69%)]

== Iteration

Repeated notes can create eighth note motion where the outline may only imply quarter notes. Composers have used this device for centuries. (Listen to the Brandenburg concerto in D, by Bach.)
#align(center)[#image("figures/fig_041.jpg", width: 68%)]

== Rhythmic Devices

Includes displacement, augmentation, diminution, anticipation, complex combinations of subdivision to add interest to the basic outlines.

== Adding Notes

Notes can be added before, within, and after the outline or any motive. Pick up notes begin with one or two notes before the outline begins. The notes can be diatonic or chromatic above or below, or arpeggiated tones.

== Use of Two or More Outlines within Example

Sometimes the melody includes two or more outlines. The same outline can be used twice sequentially, or one outline can lead into another.

== Borrowed Chords and Notes

(See the discussion on Diatonic chords and Roman numerals.) Some diatonic chords may be altered with tones “borrowed” from another key signature. When the harmony is altered, the lines are altered in the same way. Chords are often borrowed from the parallel minor key. iiø7 for a ii7, iv for IV, etc. Notes from the parallel minor key are often imposed on the dominant, creating more tension that diatonic tones, and therefore creating more release when arriving at the tonic major. Over G7, the dominant of C major, jazz musicians often use A-flat (flat 9) , B-flat (sharp 9) and E-flat (flat 13) from the parallel key of C minor. These borrowed tones, lowered diatonic pitches, have a greater downward pull than their diatonic counterparts. When modulating, chords are borrowed from the destination key. When moving from C major chord to a D minor chord, progressions pointing to the key of D minor often precede the D minor chord: V7 = A7, iiø7 - V7 = Eø7 - A7, or vii°7 = #chord("C#dim7"). The necessary notes to make the key change usually occur in the melodies over these changes: B flat and the leading tone C sharp.

== Change of Direction

Outline no.2 typically ascends (1-3-5) the ii chord before playing the seventh. Sometimes a dramatic change is to play the arpeggio descending, 7-5-3-1, before continuing its typical resolution to the 3rd of the V7 chord. The resolution of the seventh of ii to the third of V7 usually occurs in the same octave above the arpeggio. The arpeggio, rather than either ascending or descending, can be “broken”, i.e. played in a different order.

#padbox[
Outline no.2 typically ascends (1-3-5) before playing the seventh of the ii chord. There are times when the arpeggio descends. The resolution of the seventh of ii to the third of V7 occurs in the same octave above the arpeggio.

#align(center)[#image("figures/fig_042.jpg", width: 68%)]

Outline no.3 typically descends (5-3-1) before playing the seventh of the ii chord. There are times when the arpeggio ascends. The resolution of the seventh of ii to the third of V7 occurs in the same octave below the arpeggio.

#align(center)[#image("figures/fig_043.jpg", width: 68%)]
]

#chapter("Outline No.1", l: "chap4")


== Outline No.1 in Simple Form


Here is the pattern in one of its simplest forms: beginning on the 3rd of the ii chord (G minor) down to the 3rd of the V7 chord (C7) and continuing up the arpeggio. The line comes to rest on the 3rd of the tonic chord.

1. Charlie Parker:

#align(center)[#image("figures/fig_044.jpg", width: 41%)]

The triplet gives rhythmic interest to this similar pattern.

2. Charlie Parker:

#align(center)[#image("figures/fig_045.jpg", width: 41%)]

Tom Harrell uses the pattern on a iii - V7/ii progression in the key of F. This Am7 chord is not the ii chord of the key of G major, rather the iii of the key of F major. Because of the key signature of one flat, the second note is B flat. The D7 chord is the secondary dominant to G minor the ii chord of F major. To get to G minor he needed to add one flat (E Flat) and add the leading tone to G minor (F sharp). In doing so he spelled out a D7 with a flat nine. Both chromatic tones pointing to the new key are included in the line.

3. Tom Harrell:

#align(center)[#image("figures/fig_046.jpg", width: 29%)]

The basic outline with rhythmic anticipation.

4. Tom Harrell:

#align(center)[#image("figures/fig_047.jpg", width: 47%)]

The next five examples use rhythmic devices to create interest.

Parker uses diminution of part of the outline. The key is F. The progression is iii - V7/ii in the key of F (see the discussion above).

5. Charlie Parker:

#align(center)[#image("figures/fig_048.jpg", width: 32%)]

Hubbard's line has a stop and go feeling with the mixture of quarter and eighth notes.

6.  Freddie Hubbard:
#align(center)[#image("figures/fig_049.jpg", width: 41%)]

Stitt elongates the beginning and compresses the end of his line.

7. Sonny Stitt:

#align(center)[#image("figures/fig_050.jpg", width: 41%)]

Harrell anticipates the Gm7 and’ flats the ninth of the dominant, borrowed from the parallel minor key.

8. Tom Harrell:

#align(center)[#image("figures/fig_051.jpg", width: 41%)]

Evans’ line has his signature eighth note on the up beat of one followed by a triplet, but the outline remains simple.

9. Bill Evans:

#align(center)[#image("figures/fig_052.jpg", width: 32%)]

Clifford Brown begins on the third of the ii, octave jumps and compresses the rest of the outline to get to the third of the V.

10. Clifford Brown:

#align(center)[#image("figures/fig_053.jpg", width: 41%)]

These two outlines are almost completely unembellished. Dexter Gordon reverses the first two notes. Hubbard plays around the third of the ii chord before coming down the scale. The third of the V7 is delayed until beat three; the resolution to the I chord is right on beat one. Note the use of D flat, the flat nine of the C7 chord. This note is “borrowed” from the parallel key of F minor (four flats).

11. Dexter Gordon:

#align(center)[#image("figures/fig_054.jpg", width: 41%)]

12. Freddie Hubbard:

#align(center)[#image("figures/fig_055.jpg", width: 50%)]

Sonny Stitt begins with an ascending scale on the ii chord before playing the bare outline over just the V7 chord.

13. Sonny Stitt:

#align(center)[#image("figures/fig_056.jpg", width: 50%)]

Blue Mitchell starts on the third ascends and returns to the third, continues down to the third of the D7. Mitchell adds the fifth of A minor below ( an arpeggiated tone) which allows the third of D7 to land on beat one and gives the line a more angular shape.

14. Blue Mitchell:

#align(center)[#image("figures/fig_057.jpg", width: 44%)]

With the outline in quarter note values, an easy way to get eighth note motion is to repeat notes, sometimes called iteration. Another way to get motion is repeating part of the line. In ex.15, Ashley Alexander uses repeated notes; in ex.16, he plays two notes of the outline, then three, then five. Note the leap of the third to the root of the F7 chord.

15. Ashley Alexander:
#align(center)[#image("figures/fig_058.jpg", width: 69%)]

16. Ashley Alexander:
#align(center)[#image("figures/fig_059.jpg", width: 56%)]

The simple outline is interrupted by some interesting side maneuvers. The outline begins with eighth note values (B flat down to the E). On beat three of the first measure the values change to half notes (for the E and D). The C is on beat three of the second measure; the B flat on beat four (quarter note values). On beat one the line arrives on the third of the tonic.

17. Cannonball Adderley:
#align(center)[#image("figures/fig_060.jpg", width: 62%)]

Parker does two things to add interest to this simple outline. Anticipating the beat by an eighth note gives it momentum. The F is encircled with upper and lower neighbor tones before continuing down. The resolution to the third of B flat is delayed; not arriving on beat one, but on the up beat of two.

18. Charlie Parker:
#align(center)[#image("figures/fig_061.jpg", width: 56%)]

These next three examples begin with many pick up notes. Material has been added before the outline begins. Harrell uses ascending scale material from the root of the ii chord then arpeggiates out to the eleventh before the simple descending scale outline leading to the third of the tonic. Hubbard, in a very similar manner, uses the upper part of the same material Harrell used and descends in the same manner. In ex.21 Harrell begins on the third of the ii chord, but ascends to the seventh rather than descends. He appears to land on the V7 chord on beat three with the D. The simple pattern begins in the second measure with the A flat. The outline is extended by encircling the B flat with its chromatic neighbors A and B natural, and the turn before finally landing on the G, the third of tonic chord.

19. Tom Harrell:
#align(center)[#image("figures/fig_062.jpg", width: 63%)]

20. Freddie Hubbard:
#align(center)[#image("figures/fig_063.jpg", width: 63%)]

21. Tom Harrell:
#align(center)[#image("figures/fig_064.jpg", width: 63%)]

One note is added to the next two examples. The third of the ii chord is on the upbeat of four, a chromatic lower neighbor tone is played on beat one, followed by the uninterrupted continuation of the outline to the third of the tonic chord.

22. Booker Little:
#align(center)[#image("figures/fig_065.jpg", width: 56%)]
23. Tom Harrell:
#align(center)[#image("figures/fig_066.jpg", width: 56%)]

This Harrell example is similar to Ex.23. In place of the chromatic tone is a rest. The ninth is lowered, borrowed from the parallel key of F minor (four flats).

24. Tom Harrell:
#align(center)[#image("figures/fig_067.jpg", width: 56%)]

This Harrell example is also similar to ex.23. In place of the chromatic tone is an arpeggiated leap to a chord tone (the fifth of G minor: D) below. This one device made a descending scale idea into an angular line.

25. Tom Harrell:
#align(center)[#image("figures/fig_068.jpg", width: 56%)]

J. J. Johnson uses a similar leap to a chord tone in ex.26. In this progression, the Am7 (iii) is substituting for the F (I). The D7 is the V7 of ii. The necessary accidentals (F sharp and E flat) needed to tonicize G minor are in the 3-5-7-9 arpeggio of the D7 chord:

26. J. J. Johnson:
#align(center)[#image("figures/fig_069.jpg", width: 44%)]

The following are simple outlines made more interesting with some simple chromaticism.

Fats Navarro compresses the first part of the outline and continues adding only the chromatic upper and lower neighbor tones to the E flat in the second measure. Compare this with similar chromatic encircling tones in ex.21.

27. Fats Navarro;
#align(center)[#image("figures/fig_070.jpg", width: 44%)]

Parker uses two pick up notes, the root of the ii chord and its chromatic leading tone, one extra lower chord tone, the D, to enhance the bare outline. Note the dramatic leap of the third to the root of the C7 chord.

28. Charlie Parker:
#align(center)[#image("figures/fig_071.jpg", width: 44%)]

Hubbard begins with a turn, skips to the chromatic leading tone before continuing the outline. Hubbard uses a downward leap at the end.

29. Freddie Hubbard:
#align(center)[#image("figures/fig_072.jpg", width: 44%)]

Clark Terry uses two chromatic tones: the chromatic passing tone (g flat) and the chromatic leading tone to E (D sharp). If Terry had not added these two notes, the outline would have been simple, and the E natural would have occurred on beat one. By adding these tones, it not only gave the line chromatic interest, but delayed the resolution to the C7 chord. We expect to hear the E on beat one. Instead we hear the “wrong” note F, and then another “wrong” note D sharp before the resolution to E on beat two.

30. Clark Terry:
#align(center)[#image("figures/fig_073.jpg", width: 44%)]

Parker adds a triplet and a turn on two borrowed tones (the altered ninths to the G7) to the essential outline.

31. Charlie Parker:
#align(center)[#image("figures/fig_074.jpg", width: 47%)]

== Outline No.1 in a Minor Progression


In the key of F, the Aø7 - D7 tonicizes the ii chord (G minor). While not actually in the key of G minor, this excerpt modulates briefly to G minor, and provides an introduction to Outline No. 1 in a minor iiø7 - V7 progression. The outline is unadorned in the first example. In the second, the outline is simple, but resolves to G minor two beats early, returns to the dominant chord for three notes (A - C - A) then to the third of the G minor chord delayed until the second beat of the third measure. The A - C - A can be viewed either as part of the D7 chord (the dominant of G minor) or as the upper and lower neighbor tones to the B flat (the third of G minor).

32. Charlie Parker:
#align(center)[#image("figures/fig_075.jpg", width: 32%)]

33. Charlie Parker:
#align(center)[#image("figures/fig_076.jpg", width: 56%)]

In this line from near the end of a familiar bop tune#footnote[Most credit Parker with composing this bop tune in A flat. In his autobiography, Miles Davis claims authorship, and I've heard that Gil Evans credited Miles.]: in the key of A Flat, the progression shown is iii - V7 /ii - ii. The outline is in its simplest form.

34. Charlie Parker
#align(center)[#image("figures/fig_077.jpg", width: 44%)]

Many of the previous examples showed the descending scale/ascending arpeggio form of Outline No.1. Here is the skeletal descending scale form. The line begins on the third, descends to the seventh; the seventh resolves to the next third, continues to the seventh, and resolves to the third of the tonic. The thirds occur on all strong beats; the sevenths occur on the last upbeat and resolve in the expected manner.

35. Charlie Parker:
#align(center)[#image("figures/fig_078.jpg", width: 53%)]

Here is a Jackie McLean excerpt in A minor. The third of the iiø7 chord occurs on beat four. An inverted 3-5-7-9 arpeggio breaks up the downward motion of the line which resolves soundly with the third of Fm on the downbeat.

36. Jackie McClean:
#align(center)[#image("figures/fig_079.jpg", width: 57%)]

This Bill Evans excerpt, like many others, has the outline intact, but occurs with pick-up notes, and occurs over just the V7 chord.

37. Bill Evans:
#align(center)[#image("figures/fig_080.jpg", width: 60%)]

Compare the three examples of Chet Baker’s over the same progression. Ex.38 is simple with some slight rhythmic diminution and displacement. Ex.39 begins with two pick-up notes from the scale, arrives at the C7 a beat soon, and uses a chromatic passing tone between the seventh and root of C7, encircling the C. Ex.40 begins with pick-up notes, including a chromatic passing tone (A natural), then continues down the scale to the third of F minor two beats early. The line ends with an often heard jazz quote from “Gone, But Not Forgotten.” Notice the low note in the line and the highest note in the last measure are both the target note A flat, the third of F minor. The notes between the two A flats are a way of filling out the octave.

38. Chet Baker:
#align(center)[#image("figures/fig_081.jpg", width: 41%)]

39. Chet Baker:
#align(center)[#image("figures/fig_082.jpg", width: 44%)]

40. Chet Baker:
#align(center)[#image("figures/fig_083.jpg", width: 62%)]

These two are straight forward examples from Tom Harrell. The first is quite simple. The second anticipates the iiø7 and the V7 chord and has the chromatic passing tone between B flat and C, like Ex.39.

41. Tom Harrell:
#align(center)[#image("figures/fig_084.jpg", width: 41%)]

42. Tom Harrell:
#align(center)[#image("figures/fig_085.jpg", width: 53%)]

Zawinul begins the outline expectedly on the third of the iiø7 chord, descends to the third of the V7 chord, then changes direction on beat four using an arpeggiated tone. The last two notes are the upper and lower neighbor tones to the G natural. The upper neighbor tone, while being a chromatic tone, is a diatonic note in C minor. The lower neighbor tone is a chromatic leading tone to G.

43. Josef Zawinul:
#align(center)[#image("figures/fig_086.jpg", width: 44%)]

Harrell often adds notes in between the descending scale tones which break up the predictability and straight-line feeling. After sounding the seventh of the C7 chord (B flat which wants to resolve to A flat) in ex.44, he plays three other notes (C, G, B flat), all chord tones of the dominant, and delays the resolution to F minor. In ex.45. Harrell begins above the third of the iiø chord and works his way down to the third of the V7 chord. Instead of continuing to the G flat, or ascending up the arpeggio (3-5-7-9) he octave displaces the fifth of the V7 chord then comes back to the G flat on beat three. Harrell extends the F7 into the last measure using two notes from the dominant before resolving to the D flat. (See the discussion for Ex.32.)

44. Tom Harrell:
#align(center)[#image("figures/fig_087.jpg", width: 53%)]

45. Tom Harrell:
#align(center)[#image("figures/fig_088.jpg", width: 53%)]

== Outline No.1 in Other Progressions

=== TYPICAL PROGRESSIONS

*Root movement down a fifth (or up a fourth):* The most typical root progression is downward in fifths or upwards in fourths. D minor wants to resolve to G7; G7 wants to resolve to C major. The most frequent progression to lead to a major tonic: ii - V - I; for minor: iiø - V - i. Most of the examples in this book are from a ii - V - I or iiø - V - i progression because of their prevalence in jazz and harmonic music.

*Root movement down a third:* The second most common root movement. (C major to A minor.) Many improvisers will use an outline and treat the C major chord like an E minor, substituting the iii chord for the I chord.

#align(center)[#image("figures/fig_089.jpg", width: 80%)]

*Root movement in steps:* The least common root movement. (F major to G major.) many improvisers will use an outline and treat the F major chord like a D minor chord and progress to G, substituting the ii chord for the IV chord.

#align(center)[#image("figures/fig_090.jpg", width: 80%)]

These outlines will work with many other progressions. Anytime the root movement is down in fifths any of theses outlines will work, regardless of the quality of the chord. The above examples include ii - V7 - I, iiø - V7 - i, iii - V7/ii - ii. Here is list of some progressions from traditional harmony where these outlines can function.

In Major Keys:

ii — V7, V7 — I, I — IV, [IV — viiø], [viiø — iii] , iii — vi, vi — ii.

In Minor Keys:

iiø — V, V7 — i, i — iv, VI — iiø,

Here are two extended examples of Outline No. 1. The first example is over the progression ii — V7 — I — IV — $(upright("ii")ø - upright(V)7 - upright(i)) / upright("vi")$

This progression can be found throughout traditional literature. Some occurrences in jazz repertoire include: _Autumn Leaves, Spain, Alice in Wonderland,_ and _A Day in the Life of a Fool._ It is a key center cycle because it cycles through all the chords in sequence in a given key center: the ii - V7 - I cadence in major, the IV chord, which is also the VI chord in the relative minor, and then the iiø - V7 - i cadence in the relative minor. Bach interrupts the descending scale with an upper neighbor tone after the first note. The scale continues to descend, but changes to the bass voice. The soprano leaps from the third to the fifth of the second chord before continuing the sequence. The second example is constructed on a series of dominant chords from a turn-around on slow blues. Starting with the B natural over the G7 chord, every note descends stepwise, interrupted consistently with octave displacement. There are several examples of this from many players, but rarely this extended.

46. J. S. Bach: Prelude, English Suite in G Minor
#align(center)[#image("figures/fig_092.jpg", width: 80%)]

47. Mike Stern:
#align(center)[#image("figures/fig_093.jpg", width: 80%)]
#align(center)[#image("figures/fig_094.jpg", width: 53%)]

== Outline No.1 with Octave Displacements


Often to add interest, the improviser will place a pitch in another register than the listener expects. This may be the result of invention or necessity if the player is in the extreme ranges of the horn. Refer to the earlier discussion of octave displacement and leaps.

The best example of Outline No.1 with octave displacement is from Bach. It is many student’s favorite example, and they are surprised to discover the source of such a jazzy sounding musical example. The descending line is broken by a leap after the downbeats, (third to nine leaps). Leaps rarely occur over the barline. Leaps usually occur after the downbeat like Ex.47.

48. J. S. Bach: Three Part Sinfonia in D major
#align(center)[#image("figures/fig_095.jpg", width: 41%)]

This begins with the third of the ii chord and after a rest leaps to begins the rest of the descent.

49. Dexter Gordon:
#align(center)[#image("figures/fig_096.jpg", width: 41%)]

Through the use of passing tones and arpeggio tones, the octave displacement is somewhat disguised in this example. Still, with all the elaboration, the third of each chord occurs squarely on the downbeat every time.

50. Blue Mitchell:
#align(center)[#image("figures/fig_097.jpg", width: 56%)]

There are some chromatic notes leading to the third of the ii chord. The G flat reaches up to the F natural, like ex.50 and then descends down the diatonic scale with one chromatic passing tone between the root and seventh of the V7 chord. The leap from G flat to F in the second measure echoes the filled in octave displacement from the previous measure.

51. Clifford Brown:
#align(center)[#image("figures/fig_098.jpg", width: 59%)]

There are two leaps in this example. The first breaks up the descending scale with an arpeggio (3-5-7-9) on the F7 chord. The arpeggio exhibits octave displacement by leaping down to the third before continuing up to the seventh and flatted ninth. The G flat descends to the third of B flat minor. The line leaps an octave before continuing the descent to the third of the E flat 7. The progression is in the key of A flat: V7/ii - ii - V7.

52. Clifford Brown:
#align(center)[#image("figures/fig_099.jpg", width: 53%)]

Tom Harrell uses a similar arpeggio with octave displacement this time on the ii chord.

53. Tom Harrell:
#align(center)[#image("figures/fig_100.jpg", width: 56%)]

The 3-5 downward leap is evident in the following example. Parker pivots again on the low F before arpeggiating the E flat 7 chord. The thirds are on the beat, except in the first measure which begins with an accented upper nieghbor tone. The sevenths occur within the last beat. The altered ninths on the dominant are borrowed from the parallel key of A flat minor (seven flats) or G sharp minor (Five sharps).

54. Charlie Parker:
#align(center)[#image("figures/fig_101.jpg", width: 56%)]

The following use a similar arpeggio but include a lower neighbor tone to the fifth of the chord. The leap is even more dramatic jumping to a non-harmonic tone which resolves upwards continuing the arpeggio. In both examples, the thirds occur on the downbeats balancing the leaps and chromatic non-harmonic tones in the rest of the line.

55. Freddie Hubbard:
#align(center)[#image("figures/fig_102.jpg", width: 57%)]

56. Clifford Brown:
#align(center)[#image("figures/fig_103.jpg", width: 45%)]

These two begin on the third of the ii chord, add a lower note before the next note in the outline, ascend up scale passages and arpeggios before the delayed resolution to the third of the V7 chord in the upper octave. Notice that the ascending scale breaks to avoid the upcoming target note. In ex.57, the scale that starts on beat three from C, goes to G, skips the A natural because it is the target note for the F7 chord. In ex.58, the F sharp is skipped because it is the target note for the D7 chord.

57. Clifford Brown:
#align(center)[#image("figures/fig_104.jpg", width: 47%)]

58. Clifford Brown:
#align(center)[#image("figures/fig_105.jpg", width: 55%)]

Rollins in this example uses many lower chord tones with their chromatic leading tones. The top of the line clearly follows the outline, the lower part provides angularity, rhythmic interest, and a kind of counterpoint compound melody line.

59. Sonny Rollins:
#align(center)[#image("figures/fig_106.jpg", width: 55%)]

The use of the chromatic lower neighbor tone to A natural and the last two measures resemble ex.59.

60. Sonny Stitt:
#align(center)[#image("figures/fig_107.jpg", width: 55%)]

Clifford resolves to the third of the V chord late and an octave higher than he first started.

61. Clifford Brown:
#align(center)[#image("figures/fig_108.jpg", width: 32%)]

== Outline No.1 with Arpeggiated Tones


Several of the previous examples were enhanced with the use of arpeggiated tones. In the following examples the target note is approached or followed by chord tones before moving through the outline.

Dizzy uses several chromatic notes which hold off the resolution to the third of the V7 chord. Two neighbor tones precede the third of D7. Once the F sharp is sounded there is the leap to the root.

62. Dizzy Gillespie:
#align(center)[#image("figures/fig_109.jpg", width: 44%)]

Parker begins with the same arpeggio form as the previous example; interrupts the outline with only one extra note (the G) and continues arpeggiating the F7 flat 9 chord.

63. Charlie Parker:
#align(center)[#image("figures/fig_110.jpg", width: 53%)]

The following Brown example has more chromatic embellishment than the preceding examples. The target tone is followed by a skip to a arpeggiated tone. The G natural is a chromatic passing tone. The target notes for B7 and E major are approached chromatically from below. In both cases, the line jumps from a chord tone to a chord tone before the chromatic tone leads to the target note. The ii and the V have their target notes on beat one. The I chord arrives on beat two. The seventh of B7 is the last note of the second measure and you would expect the G sharp on beat one. By adding the chromatic approach tones Brown created a delayed resolution.

64. Clifford Brown:
#align(center)[#image("figures/fig_111.jpg", width: 60%)]

== Outline No.1 with Chromatic Approach Tones


Several examples were found that have a basic descending scale outline, but were preceded with chromatic pick-up notes beginning a whole step above the target note. Starting a whole step above the target note means the chromatic note will be the major third over the ii chord. It is never heard as a major third; it is heard as a passing tone between two diatonic scale tones. Here are three simple examples: the first in major; the second in minor; the third, in diminution, tonicizing the ii chord in F major.

65. Booker Little:
#align(center)[#image("figures/fig_112.jpg", width: 60%)]

66. Freddie Hubbard:
#align(center)[#image("figures/fig_113.jpg", width: 59%)]

67. Charlie Parker:
#align(center)[#image("figures/fig_114.jpg", width: 32%)]

Hubbard plays the descending outline to the B flat, He then inserts three notes (an arpeggio with a passing tone) making the register shift and continues the descent with A and G.

68. Freddie Hubbard:
#align(center)[#image("figures/fig_115.jpg", width: 56%)]

Byrd uses two outlines over an extended progression in A flat: iii - V7/ii - ii - V. He begins with the chromatic approach tones and plays the simple outline over the iii - V7/ii. The second outline begins immediately with a octave displacement before continuing.

69. Donald Byrd:
#align(center)[#image("figures/fig_116.jpg", width: 68%)]

Brown uses an arpeggiated tone to extend the outline on the third and fourth beats making the target note arrive on time and the line have more sawtooth angularity.

70. Clifford Brown:
#align(center)[#image("figures/fig_117.jpg", width: 50%)]

Stitt and Harrell approach the first target note from above, the second target from below.

71. Sonny Stitt:
#align(center)[#image("figures/fig_118.jpg", width: 50%)]

72. Tom Harrell:
#align(center)[#image("figures/fig_119.jpg", width: 56%)]

Brown begins with chromatic approach notes, circles the G with neighbor tones, uses sawtooth shapes similarly to ex.70 to delay the target note for C7.

73. Clifford Brown:
#align(center)[#image("figures/fig_120.jpg", width: 56%)]

The next two involve different rhythmic approaches and several chromatic tones; borrowed tones, and chromatic neighbor tones.

74. Donald Byrd:
#align(center)[#image("figures/fig_121.jpg", width: 57%)]

75. Lee Morgan:
#align(center)[#image("figures/fig_122.jpg", width: 57%)]

Cannonball seems to get to the C7 on beat three and the F on the up beat of four, then returns to continue the descent to A. The last A anticipates the F chord by two beats.

76. Cannonball Adderley:
#align(center)[#image("figures/fig_123.jpg", width: 56%)]

These two are straight forward. Clark Terry manages to get in two outlines in different registers.

77. Tom Harrell:
#align(center)[#image("figures/fig_124.jpg", width: 44%)]

78. Clark Terry:
#align(center)[#image("figures/fig_125.jpg", width: 60%)]

There are so many chromatic approaches it may be difficult to see and hear the simple outline at the core of these examples from Clifford Brown and Kenny Barron. In Brown’s first complete, measure, all of the downbeats suggest a stepwise line. The line continues on beat one of the second measure, is interrupted by two eighth notes and continues to the B natural. Since Barron is playing in sixteenth subdivisions the diatonic outline notes fall on the eighth note downbeats.

79. Clifford Brown:
#align(center)[#image("figures/fig_126.jpg", width: 59%)]
80. Kenny Barron:
#align(center)[#image("figures/fig_127.jpg", width: 41%)]

Here are two more examples from Brown.

81. Clifford Brown:
#align(center)[#image("figures/fig_128.jpg", width: 44%)]

82. Clifford Brown:
#align(center)[#image("figures/fig_129.jpg", width: 68%)]

Leaps make these next two interesting. Evans leaps from the third to the flat nine of the V7 chord; Cannonball from the third to the ninth of the ii chord.

83. Bill Evans:
#align(center)[#image("figures/fig_130.jpg", width: 68%)]

84. Cannonball Adderley:
#align(center)[#image("figures/fig_131.jpg", width: 44%)]

Harrell precedes the chromatic approaches with an arpeggio (5-7-9-11) of the ii chord. These extended arpeggiated notes could be viewed as a superimposed vi chord preceding the ii chord; or the 9th and 11th could be described as upper and lower neighbor tones to the third of the ii chord.

85. Tom Harrell:
#align(center)[#image("figures/fig_132.jpg", width: 44%)]

Harrell uses leaps for a dramatic effect. In the first, an octave leap; in the second a leap down from the third to the fifth of the E7 chord. In the second example, the target tones appear on beat three of the first measure, beat one of the second and third measure. In the last measure the target note is the first and last note, but in different registers.

86. Tom Harrell:
#align(center)[#image("figures/fig_133.jpg", width: 80%)]

87. Tom Harrell:
#align(center)[#image("figures/fig_134.jpg", width: 68%)]

== Outline No.1 with Double Chromatic Approach Tones


At first glance, it may seem inexplicable that a C sharp and an E natural would sound good over a C minor 7. Viewing harmony as strictly vertical, these notes would not sound good; but when viewing them in a linear context we see and hear how these notes point to the target notes and make the line more interesting by creating and releasing tension. These next three examples exhibit chromatic approach tones a whole step above and below the target note for the ii chord. Over the C minor 7, the C sharp leads through D to the E flat, the F natural descends through the E natural to E flat. Note that Brown's arpeggiating the Cm7 chord (3-5-7-9) after arriving at the target note E flat breaks the descending scale idea and delays the F7 until beat two of the second measure.

88. Clifford Brown:
#align(center)[#image("figures/fig_135.jpg", width: 56%)]

89. Sonny Rollins:
#align(center)[#image("figures/fig_136.jpg", width: 56%)]

90. Tom Harrell:
#align(center)[#image("figures/fig_137.jpg", width: 56%)]

== Outline No.1: C.E.S.H.


The following examples all share similar chromatic elaboration. With only diatonic notes, outline no.1 moves downward from the third of the ii chord to the seventh of the ii chord and on to the third of the V chord. These examples (and some previously shown) have one added chromatic tone: the leading tone to the ii chord. In a ii - V progression in the key of C, the chromatic movement would be: D - #note("C#") - C - B.

#align(center)[#image("figures/fig_138.jpg", width: 35%)]

The chromatic altered tone stops the descent of the line; since it is a leading tone to the ii chord it pulls upwards. Often this momentarily changes the direction of the line, encircling the root of the ii chord before descending through the diatonic tones and finally resolving to the third of the V chord. Jerry Coker and others refer to this type of line as a _chromatic elaboration of static harmony,_ or C.E.S.H. This type of chromatic elaboration is found with all three outlines.

This example shows how the introduction of the chromatic leading tone to the B minor chord changes the direction of the line, encircles the B (with its diatonic upper neighbor and chromatic lower neighbor) before moving down through the tones to the G sharp.

91. Booker Little:
#align(center)[#image("figures/fig_139.jpg", width: 44%)]

Byrd plays the target thirds right on the downbeats. The note preceding the F is the seventh of A flat minor. After the C flat, he using the G natural and encircles the A flat like in ex.91.

92. Donald Byrd:
#align(center)[#image("figures/fig_140.jpg", width: 44%)]

Here are two related examples from Booker Little. In ex.93, he leads up to the first target note with diatonic scale steps. He then pivots off the chromatic seventh (B natural). The diatonic seventh (B flat) comes in where you would expect the A natural, creating a suspension delaying the resolution. The B flat is the diatonic upper neighbor, the G sharp the chromatic lower neighbor to A. The line descends to the target note for the tonic chord. Ex.94 begins on the target note and descends to the target note in almost the same way; the rhythm is changed so that the D natural occurs on beat one.

93. Booker Little:
#align(center)[#image("figures/fig_141.jpg", width: 57%)]

94. Booker Little:
#align(center)[#image("figures/fig_142.jpg", width: 57%)]

The target notes in ex.95 all occur on beat one with the sevenths preceding them. Farmer uses the B natural to change the direction briefly encircling the C. He uses a similar device with the G flat (borrowed from B flat minor) and E natural (LNT) encircling the F before continuing down to the target note D.

95. Art Farmer:
#align(center)[#image("figures/fig_143.jpg", width: 57%)]

Harrell begins ex.96 with pick up notes like those in ex.93. The last note of the first measure is the diatonic seventh leading to the target A on beat one. Notice that the A occurs twice in the F7 measure; on the strong beats one and three. Again the seventh (E flat) precedes the third (D) landing on beat one. The notes on each downbeat in the first measure of ex.97 form the bare diatonic outline. Note how Harrell uses the F sharp to point to the G, and uses the D natural as a pivot in the first measure of ex.97. Ex.98 resembles ex.97, however this time the resolution to C7 is delayed.

96. Tom Harrell:
#align(center)[#image("figures/fig_144.jpg", width: 69%)]

97. Tom Harrell:
#align(center)[#image("figures/fig_145.jpg", width: 69%)]

98. Tom Harrell:
#align(center)[#image("figures/fig_146.jpg", width: 56%)]

The ii chord is anticipated in this Harrell example. On the D flat 7 chord, tones are borrowed from the parallel key of F sharp minor (the A, E and D naturals from 3 sharps).

99. Tom Harrell:
#align(center)[#image("figures/fig_147.jpg", width: 56%)]

At first glance ex.100 looks complicated, but it is based on outline no.1. It begins on the target note, ascends and plays the target note again up the octave. The top notes of the rest of the line follow the outline. The lower notes play around the chromatic leading tone to D and the seventh which finally resolves to the B natural, the target note of the V7 chord.

100. Randy Brecker:
#align(center)[#image("figures/fig_148.jpg", width: 53%)]

In ex.101 the broken thirds seem to be a string of neighbor tones. The first notes probably belong to the preceding G major chord. The last two notes in the first measure are the clearest; the third and seventh of C minor (ii). The seventh (B flat) resolves unexpectedly, made more so by the length it is held, to the B natural, before encircling C and continuing down the scale. Beats one and two are non-harmonic tones of the F7, but the next three down beats clearly spell a descending F triad.

101. Clifford Brown:
#align(center)[#image("figures/fig_149.jpg", width: 54%)]

Hubbard anticipates the ii chord, uses the B natural to change the direction of the line, plays the B flat and continues to descend to the third of the I chord. The target note for F7 occurs on beat three, the target note for B flat occurs on beat one. The G flat is borrowed from the parallel key of B flat minor, with the recognizable augmented second sound. Lowering the G provides the line with more downward thrust; G flat pulls strongly into the F. There is an interesting balance with the two chromatic tones in this line. The raised tone (B natural) made the line move up, the lowered tone helped it move down.

102. Freddie Hubbard:
#align(center)[#image("figures/fig_150.jpg", width: 66%)]

== Outline No.1: Chromatic and Rhythm Complexity


Several of the next group of examples have more chromaticism than previous examples. The types of chromaticism fall into the traditional categories discussed before. Some are just more complicated rhythmically.

First, notice that this example begins by pointing to the target note, the seventh is the last note and it resolves on the next downbeat, as we expect, to the third of the V7 chord, the next target note. The two altered tones are descending (notated as flatted notes) chromatic passing tones between diatonic tones a whole step apart.

103. Dizzy Gillespie:
#align(center)[#image("figures/fig_151.jpg", width: 44%)]

Barron begins with the upper and lower neighbor tones to the target note. The flatted notes over the F7 anticipate the B flat minor. The A flat and G flat give the line more downward momentum. The target notes are still on or near the strong downbeats.

104. Kenny Barron:
#align(center)[#image("figures/fig_152.jpg", width: 57%)]

Jackson begins these two similar examples on the target note and fills in with arpeggiated tones. Ex.105 encircles the second target note (B) and chromatically approaches the last target note (E); all target notes occur on the downbeats. Ex.106 includes a little more chromaticism, delays the target note B, and descends to the last note from the seventh. In both examples, Jackson altered the ninths on the dominant chord.

105. Milt Jackson:
#align(center)[#image("figures/fig_153.jpg", width: 57%)]

106. Milt Jackson:
#align(center)[#image("figures/fig_154.jpg", width: 57%)]

Within the first measure of ex.107 is a sequence. The line begins on the target note (B flat), descends one step, chromatic approaches from below to the next note and does the same thing to get to the target note E on the downbeat of the second measure. The next measure is a chromatic scale, but is still harmonically clear: the notes on every down beat spell out the arpeggio of the dominant ninth chord from the third: E - G - B flat - D flat (3-5-7-flat 9). All twelve chromatic pitches are used in this example, yet it remains harmonically clear; it is not random chromaticism. Target notes occur in rhythmically significant spots, non-harmonic chromatic notes resolve when and where we expect them.

107. Donald Byrd:
#align(center)[#image("figures/fig_155.jpg", width: 56%)]

The first note is the target note of ex.108. Harrell restates it an octave higher, adds only one chromatic note (#note("C#")) before moving down through the seventh to the third of the dominant. Take away every other note in the second measure, and the line still sounds good; all the eighth note values are chord tones.

108. Tom Harrell:
#align(center)[#image("figures/fig_156.jpg", width: 68%)]

Ex.109 is a similar line from the same tune as ex.108. The progression is similar but resolves to C major this time. Starting on beat four of the first measure is the outline without alteration (except for the E flat establishing C minor). The outline recurs beginning on the upbeat of two in the second measure. The last note is the target note for C major, and is approached from above through the seventh of G7.

109. Tom Harrell:
#align(center)[#image("figures/fig_157.jpg", width: 69%)]

Harrell approaches the target note encircling it with its upper and lower neighbor tones. The next note of the outline is octave shifted and occurs on the downbeat of the second measure. The first target note on a strong beat occurs in the second measure on beat three. In the last measure the outline appears unmodified, perhaps to balance the ambiguous previous statement.

110. Tom Harrell:
#align(center)[#image("figures/fig_158.jpg", width: 75%)]

Evans uses the outline on the progression V7/V - V7 in the key of F major. He starts on the target third and arrives at the 3-5-7-9 arpeggio of the C7 early. Cannonball arrives at the target notes late on the C7 and F7.

111. Bill Evans:
#align(center)[#image("figures/fig_159.jpg", width: 41%)]

112. Cannonball Adderley:
#align(center)[#image("figures/fig_160.jpg", width: 69%)]

The addition of chromatic notes add color and make lines richer rhythmically. They help delay and anticipate target notes, which set up interesting accents, accents indigenous to the jazz style. The next two examples illustrate how adding chromatic embellishment can enliven a simple outline. At the heart of these examples is the simple diatonic descending outline. Play the bare outline with quarter note values and then either of the two examples and you can clearly hear their relationship.

Parker starts and restarts the outline, creating an accent the up beat of two. He plays a C.E.S.H. on the ii chord; the B natural delaying the resolution to the B flat and to the A. On the downbeat of the second measure he avoids the target note but plays two notes that point to the target note. The target note is sounded after its upper and lower neighbor tones, creating an accent on beat two, measure two. Beat four, measure two is accented by the root of the dominant approached chromatically from below. Three notes point to the final target note D, which does not occur until beat three of the third measure. E flat is the upper neighbor tone; C and C sharp approach from below. The top notes of the line spell the simple diatonic outline (indicated by the arrows above the staff). There is a counterline (indicated by the arrows below the staff) implied by some of the lower tones making this a compound melody. G, the last pitch of measure one, ascends to #note("G#") and then to the target note A in measure two. A, the last pitch of measure two ascends to B flat - C - C sharp and the target note D. There is a symmetry in the lower counter line beginning on the upbeat of four and leading up to the target thirds as the rest of the line leads down.

113. Charlie Parker:
#align(center)[#image("figures/fig_161.jpg", width: 62%)]

Garland aims for the third of each chord: ii - V7 - I - V7/ii - ii in this extended and chromatic line. All twelve pitches are used; yet the line is harmonically specific. The line begins and ends on the same target note. Six times diatonic notes are approached from whole step below with a chromatic passing tone. The target notes for F7 (A), B flat (D) and G7 (B natural) are approached in the same way: the preceding seventh leaps down to an arpeggiated note and then chromatically ascends to the target note. Three dramatic leaps occur after the target tone: the third of C minor leaps down to the fifth; the third of F7 leaps down to the fifth and then up the arpeggio (3-5-7-9); and the third of G7 leaps up to the flat nine, octave displacing the descending scale step B - A.

114. Red Garland:
#align(center)[#image("figures/fig_162.jpg", width: 72%)]

Playing just the notes of the simple outline, with their new rhythmic placement in ex.113. and ex 114 is interesting even without the chromatic additions. Up to now, we have seen how with additions the simple outline becomes more interesting. The opposite is true: taking away the insertions, ornaments, and embellishments also reveals interesting lines by the realignment of the original notes of the outline. Garland’s lines, with chromaticism removed, sound rhythmically more at home in a funk idiom.

#align(center)[#image("figures/fig_163.jpg", width: 71%)]

== Outline No.1 in Combinations of More Than One Outline


The outlines are so common in jazz improvisation it is not unusual to see combinations of several outlines. On ex.115, Parker plays the same outline in two registers. The target notes do not occur on the strong beats; however, the highest and lowest notes in the line are the primary target notes.

115. Charlie Parker:
#align(center)[#image("figures/fig_164.jpg", width: 60%)]

From the bridge of a tune written for four tenors is an example of the outlines as a sequence. The progression is: ii - V7 - iii - V7/ii - ii. The first measure has no additional notes or embellishments. It is the outline variation that arpeggiates the V7 chord (3-5-7-9). The second measure is the descending scale variation with octave displacement. One note (E), and arpeggiated tone, is added displacing rhythmically the resolution to the last target note F.

116. Jimmy Giuffre:
#align(center)[#image("figures/fig_165.jpg", width: 59%)]

This is a classic sequence from Parker. The example can be found in many other Parker solos. Measure one is the descending scale variation with octave displacement (a third up to flat nine leap). Measure two arpeggiates the C minor from the third (with a third down to five leap), then descends to the target note A, and arpeggiates the F7 chord. The rhythm is compressed on the fourth beat to compensate for the extra inserted notes B flat and G. The progression is:

iii (substituting for I) - V7/ii - ii - V7 - I.

In order to modulate and tonicize the ii chord (Cm7), the G7, a secondary dominant, was used. To modulate from B flat (2 flats) to C minor (3 flats) two chromatic alterations are needed: A to A flat, B flat to B natural (the leading tone in C minor.) These two chromatic tones are the first pitches Parker plays on the G7 chord.

117. Charlie Parker:
#align(center)[#image("figures/fig_166.jpg", width: 60%)]

There is a sequence in ex.118 of outline no.1 with two different harmonic rhythms. The first measure is the fundamental outline embellished with two simple turns. The second measure begins with a leap from the target note to the note an octave higher. The chromatic turn using the G sharp help elongate the outline to account for the longer harmonic rhythm. Every chord has its third on a downbeat. Each third is preceded by the previous seventh on an upbeat.

118. Clifford Brown:
#align(center)[#image("figures/fig_167.jpg", width: 80%)]

When there are two chords per measure in a jazz waltz, there is a question as to where to play the second chord. It can occur on beat three; but in jazz, often occurs on the upbeat of two. The second chord landing on the upbeat of two divides the measure in half. This kind of subdivision suggests two beats per measure rather than three. The implied time signature is 6/8, compound duple, superimposed over the 3/4 simple triple. Evans divides the first measure in half; the C7 lands on the upbeat of beat two. In the second measure, the B flat chord arrives on beat three.

119. Bill Evans:
#align(center)[#image("figures/fig_168.jpg", width: 80%)]

The next examples feature two outlines of different types.

Navarro uses outline no.1, followed by outline no.2 (with passing tones) over two chromatic ii - V7 progressions.

120. Fats Navarro:
#align(center)[#image("figures/fig_169.jpg", width: 74%)]

Over the same ii -V7 progression, Parker begins with outline no.2 (with a chromatic pick up note) and then plays outline no.1.

121. Charlie Parker:
#align(center)[#image("figures/fig_170.jpg", width: 75%)]

Brown displaces the first simple outline (no.1) beginning with the upper and lower neighbor tones to the first target note. Chromatic pickups to the G (which begins outline no.3) in the second measure gets the line back on time so the seventh of C minor and the target note A on the F7 chord arrive where we expect them. More chromatic pick up notes fill out the measure so that the E flat arrives on the upbeat of four placing the D on the downbeat. The rhythmic displacement is one element that makes this line interesting. Did the addition of extra notes create the rhythmic interest, or did the rhythmic displacement require the addition of extra notes?

122. Clifford Brown:
#align(center)[#image("figures/fig_171.jpg", width: 75%)]

This final combination is from Parker’s solo on a well-known bop tune in A flat major. The progression is iii7 - V7/ii - ii7 - V7 - I in A flat major. The first is outline no.1, the second outline no.3. The dominant chords have the same pattern: a leap from the third to the flat nine and the chromatic approach to the fifth of the next chord.

123. Charlie Parker:
#align(center)[#image("figures/fig_172.jpg", width: 69%)]

#exercisebox[
  + Create your own lines using similar devices from the above examples.
  + Learn some of the above examples in all keys.
  + Write out solos on standard jazz progressions and incorporate some of the above examples. Practice the solos like any etude.
  + Try improvising over standard progressions and use some of the above examples in your solos.
  + Alter some of the above examples either by adding more notes, rhythmic displacing, fragmenting, etc. to come up with lines of you own.
  + Practice outline no.1 with iteration anticipating the thirds over the barline in all major and minor keys.

    #align(center)[#image("figures/fig_173.jpg", width: 56%)]
]

#chapter("Outline No.2", l: "chap5")

== Outline No.2 in Simple Form


Here is an occurrence of outline no.2 from a well known jazz composition, followed by and example of a Wes Montgomery embellishment from his recording of the same tune. Montgomery uses a chord tone for a pick up note, triplets, and a chromatic approach to the target note C.

124. Thelonious Monk:
#align(center)[#image("figures/fig_174.jpg", width: 32%)]

125. Wes Montgomery:
#align(center)[#image("figures/fig_175.jpg", width: 32%)]

Here are several artists and the bare outline no.2.

126. Clifford Brown:
#align(center)[#image("figures/fig_176.jpg", width: 41%)]

127. Clifford Brown:
#align(center)[#image("figures/fig_177.jpg", width: 28%)]

128. Paul Chambers:
#align(center)[#image("figures/fig_178.jpg", width: 41%)]

129. Sonny Stitt:
#align(center)[#image("figures/fig_179.jpg", width: 41%)]

130. John Coltrane:
#align(center)[#image("figures/fig_180.jpg", width: 41%)]

131. Tom Harrell:
#align(center)[#image("figures/fig_181.jpg", width: 32%)]

These two descend to the seventh of the V7 chord through a chromatic passing tone.

132. Charlie Parker:
#align(center)[#image("figures/fig_182.jpg", width: 44%)]

133. Tom Harrell:
#align(center)[#image("figures/fig_183.jpg", width: 44%)]

The following are more examples of outline no.2 in a simple form.

134. Clifford Brown:
#align(center)[#image("figures/fig_184.jpg", width: 47%)]

135. Bill Evans:
#align(center)[#image("figures/fig_185.jpg", width: 44%)]

136. Cannonball Adderley:
#align(center)[#image("figures/fig_186.jpg", width: 44%)]

137. Tom Harrell:
#align(center)[#image("figures/fig_187.jpg", width: 56%)]

Like Tom Harrell in ex.137, Adderley anticipates the ii chord.

138. Cannonball Adderley:
#align(center)[#image("figures/fig_188.jpg", width: 56%)]

Parker extends the arpeggio past the seventh to the ninth before aiming for the target note B occurring on beat three of the second measure.

139. Charlie Parker:
#align(center)[#image("figures/fig_189.jpg", width: 57%)]

== Outline No.2 in Minor


All the outlines work as well for iiø - V7 in minor as they do in major. As shown before, they work for any progression with root movement downward in fifths. Ex.140 points to C minor, but resolves to C major. Heath arrives on the major third of C and arpeggiates the chord (3-5-7-9), but leaps down to the fifth before ascending.

140. Jimmy Heath:
#align(center)[#image("figures/fig_190.jpg", width: 44%)]

141. Art Farmer:
#align(center)[#image("figures/fig_191.jpg", width: 44%)]

== Outline No.2 With Notes Added


Any musical motive can be embellished by adding notes. Notes can be added before, within, and after the motive.

These three from Tom Harrell all include notes added within the outline. The added notes are the upper and lower neighbor tones to the third of the ii chord. This adds rhythmic and melodic energy to the line. He chooses to encircle the target note, creating a slight tension and ambiguity. In ex.144, the arpeggio occurs first in a descending form, and then, beginning on beat four of the first-measure, begins the ascending form with additional notes: the C and A encircle the B flat; the C a passing tone between B flat and D. The rest of the outline is unaltered.

142. Tom Harrell:
#align(center)[#image("figures/fig_192.jpg", width: 35%)]

143. Tom Harrell:
#align(center)[#image("figures/fig_193.jpg", width: 56%)]

144. Tom Harrell:
#align(center)[#image("figures/fig_194.jpg", width: 57%)]

The next examples begin with pick up notes added before the outline. Adderley and Stitt begin with a chromatic leading tone. Rollins begins with arpeggiated notes and chromatic approach tones to the third of F7. Brown uses an interesting color tone for the B minor; the #note("G#") almost suggests the entire line relates more to E7 than to Bm.

145. Cannonball Adderley:
#align(center)[#image("figures/fig_195.jpg", width: 59%)]

146. Sonny Stitt:
#align(center)[#image("figures/fig_196.jpg", width: 32%)]

147. Clifford Brown:
#align(center)[#image("figures/fig_197.jpg", width: 44%)]

148. Sonny Rollins:
#align(center)[#image("figures/fig_198.jpg", width: 56%)]

Stitt starts with a chromatic leading tone. The outline notes in the second measure are chromatically approached from a whole step below.

149. Sonny Stitt:
#align(center)[#image("figures/fig_199.jpg", width: 56%)]

Gillespie begins with several chromatic pick up notes exhibiting nothing harmonically specific, then plays the ii chord arpeggio twice before finally resolving it to the target note of the V7 chord (B).

150. Dizzy Gillespie:
#align(center)[#image("figures/fig_200.jpg", width: 56%)]

== Outline No.2 With Passing Tones

=== SIMPLE PASSING TONES


Passing tones: Since outline no.2 is an arpeggiated outline, it lends itself to diatonic passing tones between the chord tones. However, there is rarely a passing tone between the 5th and 7th of the ii chord. The tone between the 5th and 7th of the ii chord is the target note of the V7 chord. This tone is usually saved for the V7 chord. It is the punch line, the denouement of the story, that is not given away by using it ahead of time as a passing tone. Notice the similarity of these examples and the differences determined by when in the measure they begin.

151. Clifford Brown:
#align(center)[#image("figures/fig_201.jpg", width: 44%)]

152. Clifford Brown:
#align(center)[#image("figures/fig_202.jpg", width: 53%)]

153. Lee Morgan:
#align(center)[#image("figures/fig_203.jpg", width: 59%)]

154. Sonny Stitt:
#align(center)[#image("figures/fig_204.jpg", width: 53%)]

155. Fats Navarro:
#align(center)[#image("figures/fig_205.jpg", width: 44%)]

156. Tom Harrell:
#align(center)[#image("figures/fig_206.jpg", width: 56%)]

157. Tom Harrell:
#align(center)[#image("figures/fig_207.jpg", width: 44%)]

158. Tom Harrell:
#align(center)[#image("figures/fig_208.jpg", width: 32%)]

Harrell uses the same outline as Coltrane from Ex.130, but with passing tones.

159. Tom Harrell:
#align(center)[#image("figures/fig_209.jpg", width: 44%)]
=== PASSING TONES WITH PICK UP NOTES


The following outlines all include passing tones and all begin with added pick up notes. They range from one added diatonic note:

160. Cannonball Adderley:
#align(center)[#image("figures/fig_210.jpg", width: 69%)]

two added diatonic notes:

161. Clifford Brown:
#align(center)[#image("figures/fig_211.jpg", width: 56%)]

lower neighbor tones:

162. Clifford Brown:
#align(center)[#image("figures/fig_212.jpg", width: 57%)]

163. Tom Harrell:
#align(center)[#image("figures/fig_213.jpg", width: 57%)]

an escape tone:

164. Bill Evans:
#align(center)[#image("figures/fig_214.jpg", width: 60%)]

and encircling upper and lower neighbor tones:

165. Cannonball Adderley:
#align(center)[#image("figures/fig_215.jpg", width: 44%)]

166. Tom Harrell:
#align(center)[#image("figures/fig_216.jpg", width: 47%)]

Brown begins this one with chord tones, suggests the dominant of C minor (G7: implied by the tritone F and B natural), then outline no.2 with passing tones. The target note for F7 is delayed until the third beat. Notice how effective the E natural is when the B flat chord is expected, and that the “wrong” note is immediately followed by the triad

167. Clifford Brown:
#align(center)[#image("figures/fig_217.jpg", width: 56%)]
=== PASSING TONES WITH OUTLINE NO.2 ARPEGGIO EXTENSION


These next two are similar Clifford Brown examples. They both begin with pick up notes. The tones on the first two beats are diatonic scale tones interrupted by arpeggiated tones in ex.168 and an arpeggiated and chromatic leading tone in ex.169. Ex.168 extends the arpeggio out to the ninth of the ii chord.

168. Clifford Brown:
#align(center)[#image("figures/fig_218.jpg", width: 44%)]

169. Clifford Brown:
#align(center)[#image("figures/fig_219.jpg", width: 57%)]

These three examples from the same Tom Harrell solo show how similar material can recur in different ways. The first two begin on the root of the ii chord, move through the outline with passing tones, extend through the leading tone of the ii chord (G sharp) to the ninth and back down to the third of D7. The third example breaks the “rule” of playing the target note early: The F sharp appears as a passing tone before the D7 chord, but the negative effect is diminished by the extension of the line to the ninth of the ii chord.

170. Tom Harrell:
#align(center)[#image("figures/fig_220.jpg", width: 44%)]

171. Tom Harrell:
#align(center)[#image("figures/fig_221.jpg", width: 63%)]

172. Tom Harrell:
#align(center)[#image("figures/fig_222.jpg", width: 44%)]

On this example, Harrell plays up the scale from the root to the ninth of the ii chord, using the F7 target note (A natural). The ninth (D) becomes the upper neighbor tone to the root (C) which is encircled before the outline is played in the higher register. The outline uses all the diatonic passing tones in the higher register except for the A natural, which is saved for last.

173. Tom Harrell: Amazon
#align(center)[#image("figures/fig_223.jpg", width: 50%)]

== Outline No.2 in Combinations of More Than One Outline


Parker begins with outline no.2 and ends with outline no.1. There are many occurrences of this line in different guises throughout Parker solos. They can be found in solos of disciples of Parker, like Sonny Stitt (ex.149). With the addition of chromatic approach tones, the top diatonic step progression has implied accents every dotted quarter note. The additional notes cause the second outline (no.1) to spill over into the F measure; Parker is not through with the C7 until beat three.

174. Charlie Parker:
#align(center)[#image("figures/fig_224.jpg", width: 59%)]

Clifford Brown and Josef Zawinul use outline no.2 in these sequential examples. The progression for all three is: iii - V7/ii - ii - V7 - I. Zawinul lands on thirds on strong beats preceded by the seventh of the previous chord every time but one.

175. Clifford Brown:
#align(center)[#image("figures/fig_225.jpg", width: 60%)]

176. Josef Zawinul:
#align(center)[#image("figures/fig_226.jpg", width: 69%)]

177. Clifford Brown:
#align(center)[#image("figures/fig_227.jpg", width: 80%)]

Zawinul plays outline no.2 on the ii - V, followed by outline no.1 on the iii - V7/ii.

178. Josef Zawinul:
#align(center)[#image("figures/fig_228.jpg", width: 69%)]

Brown uses outline no.2 on iii - V7/ii, outline no.3 on ii - V7 in the key of B flat. The leap from B natural up to the A flat (third to flat nine) is much more dramatic (especially on the trumpet) than stepping down. Notice the third of each dominant seventh is encircled with upper and lower neighbor tones. The F7 chord has a delayed resolution.

179. Clifford Brown:
#align(center)[#image("figures/fig_229.jpg", width: 57%)]

Outline no.2 begins ex.180. The 3-5-7-9 arpeggio of A7 begins on beat four, but skips down from the third to the fifth before continuing up. Outline no.1 is implied over the ii - V7, even though the target note for D minor is missing. The V7 arrives two beats early. Outline no.1 occurs in the last two measure over V7 - I starting on the B natural, stepping down to the E and extending out the 3-5-7-9 arpeggio of C major. There are four arpeggios in this example: E minor, 3-5-7-9 of A7 and C, and an inversion of G7. Three of the arpeggios occur early: the A7, G7, and C major.

180. Clifford Brown:
#align(center)[#image("figures/fig_230.jpg", width: 80%)]

Evans uses three outlines over this passage with rapid harmonic rhythm. Outline no.2 over the ii - V7; outline no.3 over the iii - V7/ii; and anticipating the G minor by three eighth notes, outline no.3 over ii - V7 /vi - vi.

181. Bill Evans:
#align(center)[#image("figures/fig_231.jpg", width: 69%)]

Outline no.2 usually begins on the root of the ii chord and spells the arpeggio to the seventh: 1-3-5-7. These two examples demonstrate the “’Round Midnight” outline starting on the third, instead of the root, and arpeggiating 3-5-7-9.

182. Clifford Brown:
#align(center)[#image("figures/fig_232.jpg", width: 44%)]

183. Bill Evans:
#align(center)[#image("figures/fig_233.jpg", width: 44%)]

== Outline No.2 with a Change of Direction


There are several occurrences of the “’Round Midnight” outline with the direction changed. Instead of ascending the arpeggio of the ii chord, the arpeggio is turned upside down and descends in some way.

Rollins changes the direction, adds a C.E.S.H. and delays the resolution of the V7 chord in this example from the melody to an often played blues head.

184. Sonny Rollins:
#align(center)[#image("figures/fig_234.jpg", width: 44%)]

The following examples feature a change in the direction of the outline, but the seventh resolves to the third in the same octave.

185. Tom Harrell:
#align(center)[#image("figures/fig_235.jpg", width: 44%)]

186. Bill Evans:
#align(center)[#image("figures/fig_236.jpg", width: 44%)]

187. Freddie Hubbard:
#align(center)[#image("figures/fig_237.jpg", width: 56%)]

Hamilton uses the upside down outline in a sequence. The progression normally would have been: iii - V7 /ii - ii - V7 - I. The #chord("C#m7") chord itself is a chromatic passing chord used in place of the G7.

188. Scott Hamilton:
#align(center)[#image("figures/fig_238.jpg", width: 56%)]

The upside down outline occurs after chromatic pick ups. Chambers played the usual version of this outline elsewhere in this solo. (see Ex.128)

189. Paul Chambers:
#align(center)[#image("figures/fig_239.jpg", width: 44%)]

These two examples go both directions. Beginning on the seventh of the ii chord, they descend before ascending the arpeggio. Mitchell uses the altered ninths over the F7, borrowed from the key signature of the parallel minor (B flat minor). Hubbard plays the outline in a strict form over the D flat 7 chord.

190. Blue Mitchell:
#align(center)[#image("figures/fig_240.jpg", width: 57%)]

191. Freddie Hubbard:
#align(center)[#image("figures/fig_241.jpg", width: 56%)]

The “’Round Midnight” outline is at the heart of this extended C.E.S.H. It occurs in a simple form in the second measure after several ascending and descending statements (with both major [E sharp] and minor [E natural] sevenths) of the ii chord arpeggio.

192. Wes Montgomery:
#align(center)[#image("figures/fig_242.jpg", width: 69%)]

== Outline No.2 Fragments


There are a few notes missing in these next examples to be complete outlines, but enough remains of the shape and character to include in this discussion.

The first note is omitted in these next three examples. The root of the ii chord is left off. Harrell plays another note which is heard probably heard as the leading tone to the F. Evans and Rollins leave of the first note and begin on the third. These omissions take none of the clarity away from the lines. They all emphasize the target note (third of ii) even more, and the root of the chord is covered by the bass. The sevenths occur on weak beats followed by the thirds on strong beats.

193. Tom Harrell:
#align(center)[#image("figures/fig_243.jpg", width: 38%)]

194. Bill Evans:
#align(center)[#image("figures/fig_244.jpg", width: 32%)]

195. Sonny Rollins:
#align(center)[#image("figures/fig_245.jpg", width: 50%)]

The next three do not have the first two notes of the outline. Harrell begins with a fragment of outline no.2 and ends with a statement of outline no.1.

196. Tom Harrell:
#align(center)[#image("figures/fig_246.jpg", width: 50%)]

Brown plays this fragment in two ways. The first time with a stop and go feeling created by the quarter and two eighths; the second time with the chromatic lower neighbor tones.

197. Clifford Brown:
#align(center)[#image("figures/fig_247.jpg", width: 41%)]

198. Clifford Brown:
#align(center)[#image("figures/fig_248.jpg", width: 41%)]


#exercisebox[
  + Create your own lines using similar devices from the above examples.
  + Learn some of the above examples in all keys.
  + Write out solos on standard jazz progressions and incorporate some of the above examples. Practice the solos like any etude.
  + Try improvising over standard progressions and use some of the above examples in your solos.
  + Alter some of the above examples either by adding more notes; rhythmic displacing, fragmenting, etc. to come up with lines of you own.
  + Practice outline no.2 anticipating the thirds over the barline in all major and minor keys.
    #align(center)[#image("figures/fig_249.jpg", width: 56%)]
]

#chapter("Outline No.3", l: "chap6")

== Outline No.3 in Simple Form


These two identical (except for the key) examples of outline no.3 in its simplest form. Harrell uses the flatted ninth over the dominant chord (borrowed from the parallel minor key of F minor).

199. Jimmy Giuffre:
#align(center)[#image("figures/fig_250.jpg", width: 41%)]

200. Tom Harrell:
#align(center)[#image("figures/fig_251.jpg", width: 41%)]

Many jazz compositions include chords like in the following example. The ii chord is played over the root of the V7 creating a dominant suspension sound. Here is a partial list of chord symbols found to describe this sound (shown for the dominant of C = G): G7 sus, G9 sus, Dm7/G, Dm9/G, F/G. Since this sound is essentially the ii and V7 chord together, any of the outlines will work for this harmony.

201. Tom Harrell:
#align(center)[#image("figures/fig_252.jpg", width: 32%)]

So many of the examples have added passing tones, chromatic approaches, neighbor tones, and rapid sixteenth subdivisions. In this example, Rollins demonstrates how simple rhythms and placement can make the outline interesting.

202. Sonny Rollins:
#align(center)[#image("figures/fig_253.jpg", width: 44%)]

Bill Evans and Tom Harrell illustrate the outline variation where the line continues down the scale. The flatted ninth over the dominant occurs in all three.

203. Bill Evans:
#align(center)[#image("figures/fig_254.jpg", width: 44%)]

204. Bill Evans:
#align(center)[#image("figures/fig_255.jpg", width: 44%)]

205. Tom Harrell:
#align(center)[#image("figures/fig_256.jpg", width: 44%)]

The second variation of outline no.3 that continues down the scale with octave displacement is very common. It can be found in many jazz solos in every major and minor key. The credit listed below is from Coltrane, but any number of artists could have been used. The leap from the third to the flat nine on the dominant is one of its attractive elements; giving it characteristics of a compound melody. The first and last four notes sound like the primary melody; the remaining (second through the fifth notes) sound like a secondary answer, or counter melody.

206. John Coltrane:
#align(center)[#image("figures/fig_257.jpg", width: 44%)]

Parker adds some rhythmic variation and a chromatic approach to F in this example.

207. Charlie Parker:
#align(center)[#image("figures/fig_258.jpg", width: 62%)]

Outline no.3 in simple form within longer lines. Both Mitchell and Brown’s second measures resemble outline no.2.

208. Clifford Brown:
#align(center)[#image("figures/fig_259.jpg", width: 53%)]

209. Blue Mitchell:
#align(center)[#image("figures/fig_260.jpg", width: 54%)]

Morgan adds chromatic passing tones and elongates the rhythm to account for the longer harmonic rhythm. All the sevenths and their target thirds occur where we expect them. Morgan avoids playing any type of B natural before the third measure, making the surprise resolution to G major more effective.

210. Lee Morgan:
#align(center)[#image("figures/fig_261.jpg", width: 60%)]

The ii chord is anticipated in these three examples. Harrell anticipates the ii and holds on to the V7 chord into the last measure. McLean anticipates the Gm7 chord, delays the resolution to C7 until beat four, the triplet 3-5-7 9 arpeggio hurries the line to the F chord, but its resolution is still delayed until beat three.

211. Bill Evans:
#align(center)[#image("figures/fig_262.jpg", width: 44%)]

212. Tom Harrell:
#align(center)[#image("figures/fig_263.jpg", width: 50%)]

213. Jackie McLean:
#align(center)[#image("figures/fig_264.jpg", width: 56%)]

Stitt begins with an ascending arpeggio, moves down with a C.E.S.H., and then plays the simple outline no.3 in the second measure. The change of direction, chromaticism, and resulting accents make this example stimulating.

214. Sonny Stitt:
#align(center)[#image("figures/fig_265.jpg", width: 59%)]

== Outline No.3: C.E.S.H.


Outline no.3 seems to lend itself to the C.E.S.H. more than the other outlines, the chromatic motion often suggesting a compound melody. The following are several examples of the C.E.S.H. based on outline no.3. Some use the C.E.S.H. to delay the resolution of the V7 chord; some manage to use the C.E.S.H. and arrive at the V7 on time. Several (ex.215, 216, 217, 218, 219, 221) use the fifth of the ii chord below as a pivot note to give the line more of a sawtooth shape. The range of rhythmic variety in these passages illustrate how much rhythm has to do with personalizing the basic outlines or any musical idea.

215. Cannonball Adderley:
#align(center)[#image("figures/fig_266.jpg", width: 50%)]

216. Tom Harrell:
#align(center)[#image("figures/fig_267.jpg", width: 44%)]

217. Clifford Brown:
#align(center)[#image("figures/fig_268.jpg", width: 56%)]

218. Clifford Brown:
#align(center)[#image("figures/fig_269.jpg", width: 44%)]

219. Lee Morgan:
#align(center)[#image("figures/fig_270.jpg", width: 53%)]

220. Charlie Parker:
#align(center)[#image("figures/fig_271.jpg", width: 53%)]

221. Freddie Hubbard:
#align(center)[#image("figures/fig_272.jpg", width: 59%)]

These two examples involve a change of direction. Even though they both begin with an _ascending_ arpeggio, like outline no.2, they are included with outline no.3 because the seventh resolves to the third below the arpeggio. The chromatic line (G-#note("F#")-F-E and F-E-Eb-D) in these passages are rhythmically almost identical and are interesting when played by themselves.

222. Dexter Gordon:
#align(center)[#image("figures/fig_273.jpg", width: 44%)]

223. Typical Latin Piano Ostinato:
#align(center)[#image("figures/fig_274.jpg", width: 45%)]

Notes are often added to the beginning of the outline as pick up notes.

Tom Harrell and Kenny Barron begin their lines on the third and move up the scale to the fifth of the ii chord.

224. Tom Harrell:
#align(center)[#image("figures/fig_275.jpg", width: 44%)]

225. Kenny Barron:
#align(center)[#image("figures/fig_276.jpg", width: 57%)]

Hubbard moves down chromatically from the third, ascends the arpeggio before the outline begins. Compare this C.E.S.H. to ex.220.

226. Freddie Hubbard:
#align(center)[#image("figures/fig_277.jpg", width: 57%)]

Parker begins with a wind up around the root of the ii chord and up the scale before the outline begins.

227. Charlie Parker:
#align(center)[#image("figures/fig_278.jpg", width: 69%)]

Harrell begins ex.228 with the seventh of ii as a pick up. After the C.E.S.H. over the ii - V7, another C.E.S.H. is implied over the I chord. The F natural from the second measure usually moves to the E on beat one. The F sharp changes the direction and delays the resolution to the E until beat three.

228. Tom Harrell:
#align(center)[#image("figures/fig_279.jpg", width: 60%)]

229. Tom Harrell:
#align(center)[#image("figures/fig_280.jpg", width: 65%)]

== Outline No.3 Using a Lower Pivot Note (Arpeggiated Tone Below)


One note added below adds angularity and rhythmic interest to this outline. It was seen in several of the C.E.S.H. examples (ex.215, 216, 217, 218, 219, 221, 225, 226, 227, 228, 229). Here are several more using the fifth of the ii chord, as a pivot in a lower octave than the first note of the outline.

230. Charlie Parker:
#align(center)[#image("figures/fig_281.jpg", width: 56%)]

231. Charlie Parker:
#align(center)[#image("figures/fig_282.jpg", width: 44%)]

232. Clifford Brown:
#align(center)[#image("figures/fig_283.jpg", width: 44%)]

233. Cannonball Adderley:
#align(center)[#image("figures/fig_284.jpg", width: 44%)]

This line has symmetry with the third to root leap on both of the dominant seventh chords. Outline no.3 begins before the Fm7, but resolves to the Bb7 on time.

234. Clifford Brown:
#align(center)[#image("figures/fig_285.jpg", width: 44%)]

Cannonball uses the same line in the same solo in two key areas.

235. Cannonball Adderley:
#align(center)[#image("figures/fig_286.jpg", width: 32%)]

236. Cannonball Adderley:
#align(center)[#image("figures/fig_287.jpg", width: 45%)]

== Outline No.3 in Combinations of More Than One Outline


This combination is from Parker’s solo on a well-known bop tune in A flat. The first is outline no.1, the second outline no.3. The dominant chords have the same pattern: a leap from the third to the flat nine and the chromatic approach to the fifth of the next chord. (This example was also shown as ex.123.)

237. Charlie Parker:
#align(center)[#image("figures/fig_288.jpg", width: 69%)]

Brown displaces the first simple outline (no.1) beginning with the upper and lower neighbor tones to the first target note. Chromatic pickups to the G (which begins outline no.3) in the second measure gets the line back on time so the seventh of C minor and the target note A on the F7 chord arrive where we expect them. More chromatic pick up notes fill out the measure so that the E flat arrives on the upbeat of four placing the D on the downbeat. The rhythmic displacement is one element that makes this line interesting. Did the addition of extra notes create the rhythmic interest, or did the rhythmic displacement require the addition of extra notes? (This example was also shown as ex.122.)

238. Clifford Brown:
#align(center)[#image("figures/fig_289.jpg", width: 68%)]

Morgan begins stating the third and seventh of the ii chord before outline no.3. In the last two measures he uses outline no.1 with some interesting added chromatic tones. The #note("C#") — D point up to and the F — D point down to the E flat, the fifth of A flat 7.

239. Lee Morgan:
#align(center)[#image("figures/fig_290.jpg", width: 68%)]

Evans uses three outlines over this passage with rapid harmonic rhythm. Outline no.2 over the ii - V7; outline no.3 over the iii - V7/ii; and anticipating the G minor by three eighth notes outline no.3 over ii - V7 /vi - vi. (This example was also shown as ex.181.)

240. Bill Evans:
#align(center)[#image("figures/fig_291.jpg", width: 68%)]

== Outline No.3 with Passing Tones


The arpeggiated form of this outline lends itself to diatonic passing tones between the chord tones. Adding passing tones blurs the distinction between outline no.3 and outline no.1. Into which category these next examples fall is anybody’s call as they have elements of both no.1 and no.3. The central point is their harmonic clarity; thirds and seventh delineate the harmony.

241. Clifford Brown:
#align(center)[#image("figures/fig_292.jpg", width: 44%)]

These chromatic passing tones do not blur the distinct harmonic clarity as the diatonic notes fall on strong beats..

242. Clifford Brown:
#align(center)[#image("figures/fig_293.jpg", width: 44%)]

The resolution to the dominant chord is delayed until beat three by the sawtooth shape. The leap at the end of the line mirrors the leap at the beginning of the line.

243. Clifford Brown:
#align(center)[#image("figures/fig_294.jpg", width: 44%)]

Tom Harrell in E flat minor.

244. Tom Harrell:
#align(center)[#image("figures/fig_295.jpg", width: 44%)]

This passage has a wide range and rhythmic contrasts..

245. Tom Harrell:
#align(center)[#image("figures/fig_296.jpg", width: 35%)]

The chord tones always occur on the strong beats in these two examples from Harrell.

246. Tom Harrell:
#align(center)[#image("figures/fig_297.jpg", width: 44%)]

247. Tom Harrell:
#align(center)[#image("figures/fig_298.jpg", width: 44%)]

Hubbard delays the resolution to the B flat for an entire measure. Compare this to Ex.174 of Parker.

248. Freddie Hubbard:
#align(center)[#image("figures/fig_299.jpg", width: 56%)]

#exercisebox[
+ Create your own lines using similar devices from the above examples.
+ Learn some of the above examples in all keys.
+ Write out solos on standard jazz progressions and incorporate some of the above examples. Practice the solos like any etude.
+ Try improvising over standard progressions and use some of the above examples in your solos.
+ Alter some of the above examples either by adding more notes, rhythmic displacing, fragmenting, etc. to come up with lines of you own.
+ Practice outline no.3 anticipating the thirds over the barline in all major and minor keys.
  #align(center)[#image("figures/fig_300.jpg", width: 56%)]
]

#chapter("Outline Fragments", l: "chap7")

In the discussion of harmonic clarity, the target notes were the third of ii moving to the seventh of ii, resolving to the third of V7 moving to the seventh of V7, resolving to the third of I. Fragments of outlines have been previously shown where harmonic clarity was still present with some of the elements missing.

Parker’s sequence in ex.249 relies on the seventh of ii resolving to the third of V7 for clarity. The turn, the leap from third to the root, and the rhythmic displacement give life to this example.

249. Charlie Parker:
#align(center)[#image("figures/fig_301.jpg", width: 80%)]

Brown uses similar motion in this sequence. The shape is echoed later, but with an arpeggio on the V7 chord.

250. Clifford Brown:
#align(center)[#image("figures/fig_302.jpg", width: 44%)]

251. Clifford Brown:
#align(center)[#image("figures/fig_303.jpg", width: 44%)]

The only note missing from Morgan’s excerpt is the third of the iiø chord. The V7 chord is anticipated and arpeggiated. The line follows outline no.1 one down to the third of C minor.

252. Lee Morgan:
#align(center)[#image("figures/fig_304.jpg", width: 45%)]

Harrell begins with an accented upper neighbor tone followed by the third. The leap is an arpeggiated tone to the fifth, The seventh on the upbeat is followed by the next target note on the downbeat.

253. Tom Harrell:
#align(center)[#image("figures/fig_305.jpg", width: 29%)]
</body>
</html>

#chapter("Outlines In Modal Tunes", l: "chap8")
Most of the music and examples discussed in this book refer to music with harmonic progressions. Many jazz compositions and improvisations are based on modal structures. There are many things to discuss regarding modal music, which will be the topic of another book.

Some jazz improvisers bring some of the be-bop vocabulary with them when playing on modal pieces. Here are two examples of outline no.1 used over G dorian from Randy Brecker. In the ex.254, the third of the G minor chord is approached by its leading tone. The #note("F#") and A encircle the root. E natural implies C7 and is approached from above and below. In the next example, outline no.1 can be clearly heard on the downbeats; leading tones have been added giving the line more of a sawtooth shape.

254. Randy Brecker: _Passenger_
#align(center)[#image("figures/fig_306.jpg", width: 44%)]

255. Randy Brecker: _Passenger_
#align(center)[#image("figures/fig_307.jpg", width: 56%)]

Here are two examples from a classic modal recording. Cannonball Adderley uses this C.E.S.H. version of outline no.3 several times in the solo to contrast with his modal, motivic, and down and dirty blues playing on this modal blues tune. The outline is played over G mixolydian.

256. Cannonball Adderley:
#align(center)[#image("figures/fig_308.jpg", width: 44%)]

257. Cannonball Adderley:
#align(center)[#image("figures/fig_309.jpg", width: 44%)]
</body>
</html>


#chapter("Get It In Your Playing", l: "chap9")

*How to Practice the Outlines:*

Learn the outlines in their bare form in _all_ major and minor keys. To play them in minor, use harmonic minor (the key signature for the minor key and raise the leading tone). It is difficult or impossible to elaborate on anything until you know it well.
+ Practice the outlines with the proper jazz articulations and feel. Swing the eighth notes; accent the up beats. Begin by playing them with quarter note values to get them locked in. When you speed up the quarter notes they will feel like eighth notes.
+ Take standards tunes and progressions and plug in the bare outlines. For example, on Blues:
  // TODO: should be smaller text
  - Play several choruses of a blues progression and every time you get to a ii - V7 make yourself play Outline #1.
  - After several choruses switch to Outline #2, and then #3.
  - Besides the typical ii - V7 in measures 9-10 and 12, try a ii - V7 to the IV chord in measure 4, a iio - V7 to the ii chord in measure 8.
  - All of the outlines work for the first two measures.

  In the key of F:
  
    #align(center)[#image("figures/fig_310.jpg", width: 60%)]
+ Practice some favorites from this anthology or your own collection in all keys. Try to make every note swing, accent the tops of lines and changes of direction. Do not practice sloppy or you will play sloppy.
+ Manipulate and personalize some of your favorites:
  - Change a note or two
  - Change some of the rhythms
  - Add some turns and ornaments where there weren’t any
  - Take some ornaments away
  - Try it in a minor key with the appropriate accidentals, etc.
  - Play in all keys!
+ Make up your own. Take each outline and invent several examples. Start with an outline and one device (neighbor tones, passing tones, arpeggiation tones, etc.) and invent. Again, practice in all keys.
+ Take examples of your own and others and plug into tunes and standards progressions. Prepare ahead of time to make them work.
+ Use your knowledge of these outlines to help you hear harmony. Sing the outlines over progressions. Listen to them to help you hear unfamiliar progressions. Most standard tunes never modulate more than one accidental up or down. The keys most frequently modulated to from the key of C (no sharps or flats) are: A minor (no sharps or flats), F and D minor (one flat), G and E minor (one sharp). These other keys correspond to the diatonic triads of the key of C: Dm = ii, Em = iii, F = IV, G = V, Am = vi. Practice singing modulations from the key of I to the key of ii, iii, IV, V, vi, and back again to I.
+ LISTEN! These pages just contain pitches and timing approximations. The accents, actual placement, inflections, articulations, timbre: the elements that make these lines swing, are learned by listening and imitating the great jazz artists. There is no substitute.</ol>
</body>
</html>


#chapter("Outline Exercises", l: "chap10")

For all practice use the metronome. Music is to be played in time. Put the clicks on 2 &amp; 4, as you would snap your fingers. Practice slowly at first. Set goals to increase the tempos, but strive for accuracy at any tempo. Practice playing the exercises with good rhythmic feel using jazz articulations. Practice in every key. You would have to be able to play in all 12 keys if you only played these three standard jazz tunes: _All the Things You Are, Cherokee, and Body and Soul._


== LEARN THE BASIC OUTLINES:

#set enum(numbering: n => [1.#n.])

+ Play through this 16 measure exercise in each major key. Repeat in each key until comfortable. Your goal should be to start in any key, play non-stop without error or hesitation through this exercise modulating through all twelve major keys.

  Whole-note harmonic rhythm:

  #align(center)[#image("figures/fig_311.jpg", width: 80%)]

+ Play through this 8 measure exercise in each major key. Repeat in each key until comfortable. Your goal should be to start in any key, play non-stop without error or hesitation through this exercise modulating through all twelve major keys.

  Half-note harmonic rhythm:

  #align(center)[#image("figures/fig_312.jpg", width: 80%)]
+ Play through exercise no. 1.1 one time as shown. The second time, improvise using the exercise as a guide. Your goal should be to start in any key, play non-stop without error or hesitation through this exercise modulating through all twelve major keys.

+ Here is an exercise using some variations on the outlines.
  #align(center)[#image("figures/fig_313.jpg", width: 80%)]

+ Take exercises 1.1—1.3 and apply to minor keys. As shown, use harmonic minor with a raised leading tone.

  Whole-note harmonic rhythm:

  #align(center)[#image("figures/fig_314.jpg", width: 80%)]

  Half-note harmonic rhythm:

  #align(center)[#image("figures/fig_315.jpg", width: 80%)]

== aOUTLINES AND EAR TRAINING:

#set enum(numbering: n => [2.#n.])

+ Sing through the first set of exercises.

+ Vocally improvise lines using exercises 1.1 and 1.2 as your guide.

+ Write down and learn some of your vocal improvisations.

+ Start in a major key and modulate to the closely related keys. (If you choose C major, modulate to D minor, E minor, F major, G major, and A minor.) Use ii7 - V7 or iiø7 - V7 of the new key to get there. Practice singing modulations to closely related keys using all three outlines as shown on the following pages.

=== USING OUTLINE No.1 TO MODULATE TO THE CLOSELY RELATED KEYS OF C MAJOR:

#padbox[Give yourself a starting pitch and sing the exercises. At the end check yourself for accuracy. After mastering these, try modulating to more remote keys: C to E flat, C to A flat, C to E, C to A, C to B flat, C to D, C to Gm, C to Fm, etc.]

Modulate from C major (I) to the key of D minor (ii):

#align(center)[#image("figures/fig_316.jpg", width: 80%)]

Modulate from C major (I) to the key of E minor (iii):

#align(center)[#image("figures/fig_317.jpg", width: 80%)]

Modulate from C major (I) to the key of F major (IV):

#align(center)[#image("figures/fig_318.jpg", width: 80%)]

Modulate from C major (I) to the key of G major (V):

#align(center)[#image("figures/fig_319.jpg", width: 80%)]

Modulate from C major (I) to the key of A minor (vi):

#align(center)[#image("figures/fig_320.jpg", width: 80%)]

=== USING OUTLINE NO.2 TO MODULATE TO THE CLOSELY RELATED KEYS OF C MAJOR:

#padbox[>Give yourself a starting pitch and sing the exercises. At the end check yourself for accuracy. After mastering these, try modulating to more remote keys: C to E flat, C to A flat, C to E, C to A, C to B flat, C to D, C to Gm, C to Fm, etc.]

Modulate from C major (I) to the key of D minor (ii):

#align(center)[#image("figures/fig_321.jpg", width: 80%)]

Modulate from C major (I) to the key of E minor (iii):

#align(center)[#image("figures/fig_322.jpg", width: 80%)]

Modulate from C major (I) to the key of F major (IV):

#align(center)[#image("figures/fig_323.jpg", width: 80%)]

Modulate from C major (I) to the key of G major (V):

#align(center)[#image("figures/fig_324.jpg", width: 80%)]

Modulate from C major (I) to the key of A minor (vi):

#align(center)[#image("figures/fig_325.jpg", width: 80%)]
=== USING OUTLINE NO.3 TO MODULATE TO THE CLOSELY RELATED KEYS OF C MAJOR:

#padbox[Give yourself a starting pitch and sing the exercises. At the end check yourself for accuracy. After mastering these, try modulating to more remote keys: C to E flat, C to A flat, C to E, C to A, C to B flat, C to D, C to Gm, C to Fm, etc.]

Modulate from C major (I) to the key of D minor (ii):

#align(center)[#image("figures/fig_326.jpg", width: 80%)]

Modulate from C major (I) to the key of E minor (iii):

#align(center)[#image("figures/fig_327.jpg", width: 80%)]

Modulate from C major (I) to the key of F major (IV):

#align(center)[#image("figures/fig_328.jpg", width: 80%)]

Modulate from C major (I) to the key of G major (V):

#align(center)[#image("figures/fig_329.jpg", width: 80%)]

Modulate from C major (I) to the key of A minor (vi):

#align(center)[#image("figures/fig_330.jpg", width: 80%)]

== APPLYING SPECIFIC DEVICES TO OUTLINE NO.1:


Take the simple outline and apply one or more devices to create a more interesting, more musical line. Practice them in all major keys. Try doing the same lines in the minor keys. Here are a few examples. Invent and practice several of your own.

#set enum(numbering: n => [3.#n.])

1. Scale motion used to fill out the measure:
#align(center)[#image("figures/fig_331.jpg", width: 69%)]
2. Using arpeggiated tones:
#align(center)[#image("figures/fig_332.jpg", width: 69%)]
3. Upper neighbor tones (UNT) used to create a sequence:
#align(center)[#image("figures/fig_333.jpg", width: 68%)]
4. Similar to the previous exercise, but with upper arpeggiated tones instead of upper neighbors. This line is reminiscent of Baroque music.
#align(center)[#image("figures/fig_334.jpg", width: 69%)]
5. Combination of simple devices. Encircling and arpeggiated tones.
#align(center)[#image("figures/fig_335.jpg", width: 69%)]
6. Upper and lower neighbor tones (LNT). The target notes for G7 and C major are rhythmically anticipated.
#align(center)[#image("figures/fig_336.jpg", width: 68%)]
7. Third to flat-nine leap in the second measure:
#align(center)[#image("figures/fig_337.jpg", width: 68%)]
8. Simple outline with pick up notes:
#align(center)[#image("figures/fig_338.jpg", width: 68%)]
9. Arpeggio used for octave displacement, chromatic approaches, displaced arpeggio on the G7 chord:
#align(center)[#image("figures/fig_339.jpg", width: 68%)]
10. Encircling, UNT, anticipated last target note:
#align(center)[#image("figures/fig_340.jpg", width: 68%)]
11. Encircling, UNT, chromatic approach to last target note:
#align(center)[#image("figures/fig_341.jpg", width: 68%)]
12. Encircling:
#align(center)[#image("figures/fig_342.jpg", width: 69%)]
13. Encircling using many more chromatic passing tones (PT), borrowed tones, and LNT:
#align(center)[#image("figures/fig_343.jpg", width: 69%)]
14. Chromatic approach from below and above:
#align(center)[#image("figures/fig_344.jpg", width: 69%)]
15. Encircling. (The arpeggio in the second measure suggests outline no.2 in the middle of outline no.1):
#align(center)[#image("figures/fig_345.jpg", width: 69%)]
16. Chromatic passing tones, C.E.S.H.:
#align(center)[#image("figures/fig_346.jpg", width: 69%)]
17. Chromatic passing tones, arpeggiated tones, C.E.S.H., and encircling:
#align(center)[#image("figures/fig_347.jpg", width: 69%)]
18. Octave displacement, chromatic approaches, delayed resolution to tonic:
#align(center)[#image("figures/fig_348.jpg", width: 68%)]

Here is how a simple outline can be transformed into a more complex line.

19. The simple outline is first shown with some added rhythmic interest:
#align(center)[#image("figures/fig_349.jpg", width: 44%)]
20. The F is octave displaced:
#align(center)[#image("figures/fig_350.jpg", width: 44%)]
21. An arpeggio is used to fill in the octave:
#align(center)[#image("figures/fig_351.jpg", width: 44%)]
22. The F is displaced again, giving the line a more angular shape:
#align(center)[#image("figures/fig_352.jpg", width: 44%)]
23. Chromatic pick-ups are added from above to the F, from below to the B.
#align(center)[#image("figures/fig_353.jpg", width: 69%)]

== APPLYING SPECIFIC DEVICES TO OUTLINE NO.2:


Take the simple outline and apply one or more devices to create a more interesting, more musical line. Practice them in all major keys. Try doing the same lines in the minor keys. Here are a few examples. Invent and practice several of your own.

#set enum(numbering: n => [4.#n.])

1. Begins with two scale steps, PT:
#align(center)[#image("figures/fig_354.jpg", width: 69%)]
2. Scalar passages:
#align(center)[#image("figures/fig_355.jpg", width: 80%)]
3. LNT sequence:
#align(center)[#image("figures/fig_356.jpg", width: 69%)]
4. LNT, encircling, octave displacement:
#align(center)[#image("figures/fig_357.jpg", width: 69%)]
5. PT, arpeggiated tone:
#align(center)[#image("figures/fig_358.jpg", width: 69%)]
6. Four-note cycle returns to the first note.
#align(center)[#image("figures/fig_359.jpg", width: 69%)]
7. Pick up notes from the scale:
#align(center)[#image("figures/fig_360.jpg", width: 69%)]
8. Pickup notes from the fifth:
#align(center)[#image("figures/fig_361.jpg", width: 69%)]
9. LNT with extended arpeggio, chromatic encircling:
#align(center)[#image("figures/fig_362.jpg", width: 69%)]
10. Unexpected chromatic resolution (The C — #note("C#") pulls up to the D, the E — E flat pull down), chromatic encircling:
#align(center)[#image("figures/fig_363.jpg", width: 80%)]
11. Series of encircled notes:
#align(center)[#image("figures/fig_364.jpg", width: 80%)]
12. Root of the ii chord preceded and encircled by its dominant, extended arpeggio, encircled B:
#align(center)[#image("figures/fig_365.jpg", width: 68%)]
13. Arpeggio begins from below, displaced arpeggios. The second measure is two arpeggios: G7 from the third (3-5-7-9) and from the root (1-3-5-7). The displacement creates a jagged line and at the same time emphasizes the step progression C — B — A — G — F — E.
#align(center)[#image("figures/fig_366.jpg", width: 69%)]

== APPLYING SPECIFIC DEVICES TO OUTLINE NO.3:

Take the simple outline and apply one or more devices to create a more interesting, more musical line. Practice them in all major keys. Try doing the same lines in the minor keys. Here are a few examples. Invent and practice several of your own.

#set enum(numbering: n => [5.#n.])

1. Begins with scalar passages (inversion of 4.2) sequenced:
#align(center)[#image("figures/fig_367.jpg", width: 80%)]
2. LNT, stop and go rhythmic feel:
#align(center)[#image("figures/fig_368.jpg", width: 80%)]
3. LNT, PT, C.E.S.H., octave displacement, encircling:
#align(center)[#image("figures/fig_369.jpg", width: 80%)]
4. Pick up notes, outline delayed until the second measure:
#align(center)[#image("figures/fig_370.jpg", width: 80%)]
5. Chromatic pick up notes, encircling tones:
#align(center)[#image("figures/fig_371.jpg", width: 80%)]
6. Chromatic encircling tones:
#align(center)[#image("figures/fig_372.jpg", width: 80%)]
7. Encirling, arpeggiated tone, chromatic approaches. The leap from D down to F in m.1 is mirrored in the last measure:
#align(center)[#image("figures/fig_373.jpg", width: 69%)]
8. LNTs. The rhythmic accents sometimes suggest a dotted quarter rhythm:
#align(center)[#image("figures/fig_374.jpg", width: 68%)]

== SHORT EXERCISES OVER TYPICAL PROGRESSIONS:


Invent short exercises over typical progressions and follow the outlines. This example uses all three outlines. The first two measures (ii - V7) use outline no.3 with many chromatic approaches and encircling tones. A fairly simple outline no.1 is in the second two measures (iii - V7/ii). In mm.5—6 (ii - V7) is outline no.2 with some pick up notes.

#align(center)[#image("figures/fig_375.jpg", width: 80%)]

== USING OUTLINES TO CONNECT OTHER CHORDS

Practice this progression with all of the outlines for practice connecting all chord types. The progression is:

#align(center)[#image("figures/fig_376.jpg", width: 23%)]

Practice these exercises slowly until comfortable, then speed them up. Practice goal should be to play them in all twelve major keys without hesitation or error at any tempo you begin.

#set enum(numbering: n => [7.#n.])

1. Using outline no.1 to connect the target notes:
#align(center)[#image("figures/fig_377.jpg", width: 80%)]
2. Using outline no.2. The outline starts on the odd measures in the first half, and the even measures on the last half of this exercise:
#align(center)[#image("figures/fig_378.jpg", width: 80%)]
3. Using outline no.3. The outline starts on the odd measures in the first half, and is inverted on the last half of this exercise:
#align(center)[#image("figures/fig_379.jpg", width: 80%)]
4. This exercise is based on outline no.1. The third of each chord occurs on the downbeat of every measure followed by an arpeggio, before continuing down the scale. The arpeggio is octave displaced in every other measure.
#align(center)[#image("figures/fig_380.jpg", width: 80%)]

== USING OUTLINES TO CONNECT OTHER CHORDS


The progression from exercise 7 is shown here with some elaboration. Can you determine what devices are used?

+ 8.1 Outline no.1:
#align(center)[#image("figures/fig_381.jpg", width: 80%)]
+ 8.2 Outline no.2:
#align(center)[#image("figures/fig_382.jpg", width: 80%)]
+ 8.3 Outline no.3:
#align(center)[#image("figures/fig_383.jpg", width: 80%)]

== USING OUTLINES OVER TURNAROUND PROGRESSIONS


Practice the outlines over turnaround progressions.. Turnaround progressions occur as the last two measures of the blues and countless jazz and pop standard tunes, and as the basis for tunes like _I Got Rhythm_ and _Heart and Soul._ Practice these exercises in all twelve keys.

#set enum(numbering: n => [9.#n.])

1.  Typical turnaround progression (I - V/ii - ii - V etc., in the key of F major):
#align(center)[#image("figures/fig_384.jpg", width: 80%)]
2.  Turnaround progression with more secondary dominants (I - V7/ii - V7/V - V7 - V/vi etc., in the key of F major):
#align(center)[#image("figures/fig_385.jpg", width: 80%)]
3.  Outline no.1 in a cycle (iii - V/ii - ii - V - I - [tritone substitute dominant of iii] in the key of C major):
#align(center)[#image("figures/fig_386.jpg", width: 80%)]
4.  Outline no.2 in a cycle (iii - V/ii - ii - V - I - [tritone substitute dominant of iii] in the key of C major):
#align(center)[#image("figures/fig_387.jpg", width: 80%)]
5.  Outline no.3 in a cycle (iii - V/ii - ii - V - I - [tritone substitute dominant of iii] in the key of C major):
#align(center)[#image("figures/fig_388.jpg", width: 80%)]
6.  The longer harmonic rhythm makes it possible to embellish this cycle with chromatic leading tones. The progression is iii - V/ii - ii - V in the key of C major:
#align(center)[#image("figures/fig_389.jpg", width: 80%)]

== OUTLINES IN KEY CENTER CYCLES

Practice the key center cycle with a faster harmonic rhythm. In exercise 7, the chords changed every measure; here they change every two beats.

#set enum(numbering: n => [10.#n.])

1. Outline No.1 through key center cycle:
#align(center)[#image("figures/fig_390.jpg", width: 80%)]
2. Outline No.1 variation through cycle:
#align(center)[#image("figures/fig_391.jpg", width: 80%)]
3. Outline No.2 through cycle:
#align(center)[#image("figures/fig_392.jpg", width: 80%)]
4. Outline No.2 variation through cycle:
#align(center)[#image("figures/fig_393.jpg", width: 80%)]
5. Outline No.3 through cycle:
#align(center)[#image("figures/fig_394.jpg", width: 80%)]
6. Outline No.3 variation through cycle:
#align(center)[#image("figures/fig_395.jpg", width: 80%)]

=== APPLYING OUTLINES TO STANDARD JAZZ PROGRESSIONS


One of the most important things you can do to integrate these outlines into your playing is applying them to standard tunes and progressions. In the previous exercises, we began using them only in one key at a time. Standard tunes may modulate to close and remote keys and harmonic rhythms vary. The next exercises apply the outlines to the blues, “Rhythm Changes,” and progressions from standard jazz tunes. Begin by playing just the simple outline for the entire form of the piece. Try singing the outline and hearing the changes away from your instrument. If you can hear the changes and sing the actual pitches, you will be better prepared to hear and improvise good melodies over the progression. When you have mastered the simple outlines, try improvising over the form. For practice, limit yourself to one outline at a time. Play the form several times for each outline embellishing the basic line. After mastering all three, try various combinations of outlines.

== STANDARD PROGRESSION I: BLUES IN B FLAT

#set enum(numbering: n => [11.#n.])

=== A SECTION

1. Outline no.1:
#align(center)[#image("figures/fig_396.jpg", width: 80%)]
2. Outline no.2:
#align(center)[#image("figures/fig_397.jpg", width: 80%)]
3. Outline no.3:
#align(center)[#image("figures/fig_398.jpg", width: 80%)]

== STANDARD PROGRESSION II: “RHYTHM CHANGES”

#set enum(numbering: n => [12.#n.])

=== A SECTION

1. Outline no.1:
#align(center)[#image("figures/fig_399.jpg", width: 80%)]
2. Outline no.2:
#align(center)[#image("figures/fig_400.jpg", width: 80%)]
3. Outline no.3:
#align(center)[#image("figures/fig_401.jpg", width: 80%)]
=== “RHYTHM CHANGES” B SECTION

12.4 Outline no.1 with half note values:
#align(center)[#image("figures/fig_402.jpg", width: 80%)]
5. Outline no.1 implying a ii - V in mm.1—2, and mm.5—6:
#align(center)[#image("figures/fig_403.jpg", width: 80%)]
6. Outline no.1 implying a ii - V in mm.3—4, and mm.7—8:
#align(center)[#image("figures/fig_404.jpg", width: 80%)]
7. Outline no.2 with half notes values:
#align(center)[#image("figures/fig_405.jpg", width: 80%)]
8. Outline no.2 implying a ii - V in mm.1—2, and mm.5—6:
#align(center)[#image("figures/fig_406.jpg", width: 80%)]
9. Outline no.2 implying a ii - V in mm.3—4, and mm.7—8:
#align(center)[#image("figures/fig_407.jpg", width: 80%)]
10. Outline no.3 with half note values:
#align(center)[#image("figures/fig_408.jpg", width: 80%)]
11. Outline no.3 with half note values:
#align(center)[#image("figures/fig_409.jpg", width: 80%)]
12. Outline no.3 implying a ii - V in mm.1—2, and mm.5—6:
#align(center)[#image("figures/fig_410.jpg", width: 80%)]
13. Outline no.3 implying a ii - V in mm.3—4, and mm.7—8:
#align(center)[#image("figures/fig_411.jpg", width: 80%)]

== STANDARD JAZZ PROGRESSION III: ARE YOU ALL THE OUTLINES

#set enum(numbering: n => [13.#n.])

1. Outline no.1:
#align(center)[#image("figures/fig_412.jpg", width: 80%)]

Applying Outlines to Standard Jazz Progression III. _Are You All the Outlines_

2. Outline no.2 beginning in m.1:
#align(center)[#image("figures/fig_413.jpg", width: 80%)]

Applying Outlines to Standard jazz progression III. _Are You All the Outlines_

3. Outline no.2 beginning in m.2:
#align(center)[#image("figures/fig_414.jpg", width: 80%)]

Applying Outlines to Standard jazz progression III. _Are You All the Outlines_

4. Outline no.3 beginning in m.1:
#align(center)[#image("figures/fig_415.jpg", width: 80%)]

Applying Outlines to Standard jazz progression III. _Are You All the Outlines_

5. Outline no.3 beginning in m.2:
#align(center)[#image("figures/fig_416.jpg", width: 80%)]

== STANDARD JAZZ PROGRESSION IV: _Outlines by Starlight_

#set enum(numbering: n => [14.#n.])

1. Outline no.1:
#align(center)[#image("figures/fig_417.jpg", width: 80%)]

Applying Outlines to Standard jazz progression _IV.,Outlines by Starlight_

2. Outline no.2 beginning in m.1:
#align(center)[#image("figures/fig_418.jpg", width: 80%)]

Applying Outlines to Standard jazz progression IV. _Outlines by Starlight_

3. Outline no.2 beginning in m.2:
#align(center)[#image("figures/fig_419.jpg", width: 80%)]

Applying Outlines to Standard jazz progression IV. _Outlines by Starlight_

4. Outline no.3 beginning in m.1:
#align(center)[#image("figures/fig_420.jpg", width: 80%)]

Applying Outlines to Standard jazz progression IV. _Outlines by Starlight_

5. Outline no.3 beginning in m.2:
#align(center)[#image("figures/fig_421.jpg", width: 80%)]

== STANDARD JAZZ PROGRESSION V: BLUES WITH ii - V SUBSTITUTIONS

#set enum(numbering: n => [15.#n.])

1. Outline no.1:
#align(center)[#image("figures/fig_422.jpg", width: 80%)]

Applying Outlines to Standard jazz progression V. Blues with ii - V substitutions

2. Outline no.2 beginning in first half of measure:
#align(center)[#image("figures/fig_423.jpg", width: 80%)]

Applying Outlines to Standard jazz progression V. Blues with ii - V substitutions

3. Outline no.2 beginning in second half of measure:
#align(center)[#image("figures/fig_424.jpg", width: 80%)]

Applying Outlines to Standard jazz progression V. Blues with ii - V substitutions

4. Outline no.3 beginning in first half of measure:
#align(center)[#image("figures/fig_425.jpg", width: 80%)]

Applying Outlines to Standard jazz progression V. Blues with ii - V substitutions

5. Outline no.3 beginning in second half of measure:
#align(center)[#image("figures/fig_426.jpg", width: 80%)]

== STANDARD JAZZ PROGRESSION VI.: _BIG STRIDES WITH OUTLINES_

#set enum(numbering: n => [16.#n.])

1. Outline no.1:
#align(center)[#image("figures/fig_427.jpg", width: 80%)]

Applying Outlines to Standard jazz progression VI. _Big Strides with Outlines_

2. Outline no.2:
#align(center)[#image("figures/fig_428.jpg", width: 80%)]

Applying Outlines to Standard jazz progression VI, _Big Strides with Outlines_

3. Outline no.2:
#align(center)[#image("figures/fig_429.jpg", width: 80%)]

Applying Outlines to Standard jazz progression VI. _Big Strides with Outlines_

4. Outline no.3:
#align(center)[#image("figures/fig_430.jpg", width: 80%)]

Applying Outlines to Standard jazz progression VI. _Big Strides with Outlines_

5. Outline no.3:
#align(center)[#image("figures/fig_431.jpg", width: 80%)]

== IDENTIFYING OUTLINES

Learn to identify outlines and recognize the devices used to embellish them. Here are five examples from Cannonball Adderley. Identify which outline is shown, and what devices are used to make them interesting.

#set enum(numbering: n => [17.#n.])

1. Cannonball Adderley:
#align(center)[#image("figures/fig_432.jpg", width: 47%)]
2. Cannonball Adderley:
#align(center)[#image("figures/fig_433.jpg", width: 47%)]
3. Cannonball Adderley:
#align(center)[#image("figures/fig_434.jpg", width: 47%)]
4. Cannonball Adderley:
#align(center)[#image("figures/fig_435.jpg", width: 47%)]
5. Cannonball Adderley:
#align(center)[#image("figures/fig_436.jpg", width: 35%)]

Find other examples in jazz literature. Practice and learn them in all keys. Answers on page 145.

</body>
</html>

#chapter("What To Do Next?", l: "chap11")

== LISTEN

The examples in this book are a part of what goes into a great jazz solo. Listen to entire solos by these and other artists. Listen for developing ideas. Listen for exciting shapes and rhythms. Listen for balance and contrasts between harmonic clarity and generalization; motivic development and harmonic change running; rhythmic complexity and simplicity; space and heavy, thick texture; blues ideas and specificity.

Find musical excerpts you like. Try and find something in the excerpt that will help you remember and understand it. See if you can apply any devices from this book or your own experiences and further develop and personalize the excerpt. Practice being creative in your practice time.

== PRACTICE

I watched a high school baseball team practice the routine of throwing the ball from the outfield to the cut-off man who relayed to home plate. They practiced this routine for at least forty five minutes. Any one of them was intelligent enough to be told how to do it and remember; any one of them could have given it as an answer on a test the following week. They practiced it over and over so the routine became automatic; so there would be no thought, just reaction. To be prepared for a game a team will practice all of the parts of a game, individually tuning up each part: hitting, bunting, catching, throwing, base running, defensive plays. This is how to practice improvisation. The whole is learned by taking apart and drilling the components which are ultimately put together again.

One young student of mine was not playing his scales very well at a lesson. I asked him how often he practiced through them every day. He said at least once. I knew he played tennis. I asked him how many times he practiced his serve when he was at the courts. He said about eight hundred times. It was no mystery why he was (and still is) a better tennis player than piano player. This is how to practice improvisation: repeat drills until they can be played automatically.

== TRAIN YOUR EARS

Train your ears so that when you hear a line, you could instantly play it on your instrument; when you see a line written down, you instantly imagine what it sounds like. Sound, fingering on your instrument, and the written notes on the page should all be connected in your mind. These three areas form a triangle: the aural form, the written form (notes and chord symbols) and the physical experience of creating or recreating on your instrument. Integrate them all in your practice routine. Ear training is lifelong; it is not a class that one finishes and checks off the list.

#align(center)[#image("figures/fig_437.jpg", width: 64%)]

== PLAY

Play. That is what we do. Be playful in your approach to practice and performance. Listen to the other performers and be prepared to react. If you have practiced and spent considerable time thinking about what you should and can do musically, then you will trust your instincts.

