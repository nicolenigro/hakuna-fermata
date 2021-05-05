# Mission 8: Hakuna Fermata
# Nicole Nigro
# 5/4/21


# uses a relatively low beats per minute
use_bpm 60

count = 0

# guitar background, grows in amplitude
define :background do
  in_thread do
    loop do
      if count < 3
        sample :guit_em9, attack: 5, release: 3, amp: 0.05
        sleep 5
        count += 1
      elsif 3 <= count and count < 6
        sample :guit_em9, attack: 5, release: 3, amp: 0.075
        sleep 5
        count += 1
      else
        sample :guit_em9, attack: 5, release: 3, amp: 0.1
        sleep 5
        count += 1
      end
    end
  end
end

# musical idea: B4-G4-A4-E4-G4
# augmentation - lengthening the 1st, 3rd, and 5th notes
define :musical_idea_original do
  use_synth :dark_ambience
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

# transposition and playing together
define :musical_idea_transposition do
  use_synth :dark_ambience
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
  use_synth :dark_ambience
  play_pattern chord(:b, :min, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:a, :maj, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:g, :maj, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:e, :min, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:g, :maj, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:a, :maj, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:b, :min, attack: 6, release: 10, amp: 0.7)
end

# symmetry - uses notes from my musical idea to play chords from E -> B then back down to E again
define :chords_2 do
  use_synth :dark_ambience
  play_pattern chord(:e, :min, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:g, :maj, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:a, :maj, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:b, :min, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:a, :maj, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:g, :maj, attack: 6, release: 10, amp: 0.7)
  play_pattern chord(:e, :min, attack: 6, release: 10, amp: 0.7)
end


background

sleep 30

3.times do #54 seconds
  musical_idea_original
end

3.times do #54 seconds
  musical_idea_transposition
end

2.times do #84 seconds
  chords_1
  chords_2
end

#get to 300 seconds
#do i keep ambient noise
  #add more layers/change samples of background
  
  #first 30 and last 30 are fade out with just background
  #play_pattern chord
  #invert chords - play invert_chord
  
  
  #hollow
  #:growl
  #fm
  #:dtri
  
  #:guit_e_fifths
  # amp: 0.2, attack: 5, release: 6
  #bd_808
  #ambi_piano
  
  #Meditation music may also incorporate nature sounds. If we hear a
  #constant, consistent flow of pleasant-sounding rain or birdsong, for
  #instance, our brain concludes that we are in a soothing environment
  #without danger.
  
  #Some musical pieces (like Marconi Union's Weightless) are intentionally
  #designed to start around 60BPM and slow down to around 50BPM. As we
  #listen, our heartbeat gradually slows to match the beat. This is a
  #process called entrainment, which takes about five minutes.
  
  #Often, relaxing songs have a dreamy or fantasy feel. The seventh and
  #ninth notes in our sequence (wherever we start) can be very powerful
  #in this way.
  
  #One way to provide a sense of flow from one chord to another is to not
  #change the chord very much at all (familiarity + tiny novelty = magic!).
  #Like we saw in class, a sus chord is often used in this way to transition
  #to the next chord in a sequence.
  
  #Another possible means of doing this is by simply inverting the chord.
  #The first inversion of a triad moves the bottom note up an octave
  #(i.e., up by 12). The middle note then becomes the root of the chord.
  #For example, the first inversion of a C major chord (CEG) becomes EGC.
  
  
  
  ##|sample :ambi_choir, rate: -1
  
  #sample :drum_heavy_kick, amp: (ring 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0).look