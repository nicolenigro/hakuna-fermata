# Mission 8: Hakuna Fermata
# Nicole Nigro
# 5/5/21


# uses a relatively low beats per minute
use_bpm 60

count = 0
bmin = chord(:b, :min)
amaj = chord(:a, :maj)
gmaj = chord(:g, :maj)
emin = chord(:e, :min)

# ambient background, grows in amplitude
define :background do
  in_thread do
    loop do
      if count < 3
        sample :ambi_glass_hum, attack: 5, release: 3, amp: 0.3
        sleep 5
        count += 1
      elsif 3 <= count and count < 6
        sample :ambi_glass_hum, attack: 5, release: 3, amp: 0.5
        sleep 5
        count += 1
      else
        sample :ambi_glass_hum, attack: 5, release: 3, amp: 0.7
        sleep 5
        count += 1
      end
    end
  end
end

# musical idea: B4-G4-A4-E4-G4
# augmentation - lengthening the 1st, 3rd, and 5th notes of my musical idea
define :musical_idea_original do
  use_synth :growl
  play :B4, attack: 3, release: 4, amp: 0.7
  sleep 4
  play :G4, attack: 2, release: 3, amp: 0.7
  sleep 3
  play :A4, attack: 3, release: 4, amp: 0.7
  sleep 4
  play :E4, attack: 2, release: 3, amp: 0.7
  sleep 3
  play :G4, attack: 3, release: 4, amp: 0.7
  sleep 4
end

# transposition - moving my musical idea up an octave - and playing together
define :musical_idea_transposition do
  use_synth :growl
  play :B4, attack: 3, release: 4, amp: 0.7
  play :B5, attack: 3, release: 4, amp: 0.7
  sleep 4
  play :G4, attack: 2, release: 3, amp: 0.7
  play :G5, attack: 2, release: 3, amp: 0.7
  sleep 3
  play :A4, attack: 3, release: 4, amp: 0.7
  play :A5, attack: 3, release: 4, amp: 0.7
  sleep 4
  play :E4, attack: 2, release: 3, amp: 0.7
  play :E5, attack: 2, release: 3, amp: 0.7
  sleep 3
  play :G4, attack: 3, release: 4, amp: 0.7
  play :G5, attack: 3, release: 4, amp: 0.7
  sleep 4
end

# uses notes from my musical idea to play chords from B -> E then back up to B again
define :chords_1 do
  use_synth :growl
  play_pattern bmin, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern amaj, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern gmaj, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern emin, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern gmaj, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern amaj, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern bmin, attack: 4, release: 10, amp: 0.6
  sleep 6
end

# playing chords from E -> B then back down to E again (reverse order of chords_1)
define :chords_2 do
  use_synth :growl
  play_pattern emin, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern gmaj, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern amaj, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern bmin, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern amaj, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern gmaj, attack: 4, release: 10, amp: 0.6
  sleep 6
  play_pattern emin, attack: 4, release: 10, amp: 0.6
  sleep 6
end

# inverting - inverts the chords from my musical idea
define :musical_idea_inverted do
  use_synth :growl
  play invert_chord(bmin, 1), attack: 3, release: 4, amp: 0.7
  sleep 4
  play invert_chord(gmaj, 1), attack: 3, release: 4, amp: 0.7
  sleep 4
  play invert_chord(amaj, 1), attack: 3, release: 4, amp: 0.7
  sleep 4
  play invert_chord(emin, 1), attack: 3, release: 4, amp: 0.7
  sleep 4
  play invert_chord(gmaj, 1), attack: 3, release: 4, amp: 0.7
  sleep 4
end

#calling my functions to play the song
background

sleep 30

3.times do
  musical_idea_original
end

2.times do
  musical_idea_transposition
end

1.times do
  chords_1
  chords_2
end

1.times do
  musical_idea_original
end

2.times do
  musical_idea_inverted
end