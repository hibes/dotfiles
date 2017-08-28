##### Sourced for ALL login shells
# Should:
# have content useful for GUI programs e.g. program specific environment variables
# configure variables used by all shells e.g. PATH environment variable

# Should not:
# use bash specific features e.g. umask or source
# contain configuration only necessasary for interactive cli programs e.g. the GIT_EDITOR environment variable used by git



##### Indicate this file was sourced
##################################################
export SOURCED_DOT_PROFILE=1



##### Setup basics
##################################################
if [ -f "/opt/scripts/setup/env.sh" ]; then
  . /opt/scripts/setup/env.sh
fi
export PATH="/opt/scripts:/opt/local/bin:/usr/local/bin:$PATH"



##### Setup basics
##################################################
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'



##### Setup rbenv
##################################################
# Use rbenv if existing
which rbenv
if [ $? -eq 0 ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Source RVM into a shell session *as a function*
fi



##### Setup boot
##################################################
export BOOT_JVM_OPTIONS=' -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xmx2g -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xverify:none'



##### Lein
#######################################################
export LEIN_ROOT=1 # disable warning when running lein commands as root



##### Alpha Centauri Quotes
##################################################
# Used to update /etc/motd  (message of the day)

#
# Sid Meier's ALPHA CENTAURI
#
# Background Story & Character Quotations
#
# Copyright (c) 1997, 1998 by Firaxis Games, Inc.
#

AC_QUOTES=()
AC_QUOTES+=("
##Opening Quotation
#OPENING
Therefore the Lord God sent him forth from the garden of Eden.
He drove out the man; and he placed at the east of the garden
of Eden Cherubim, and a flaming sword which turned every way, to
keep the way of the tree of life.
^
^        -- The Conclave Bible,
^           Datalinks
"
"##Biogenetics
#TECH0
We hold life to be sacred, but we also know the foundation of life
consists in a stream of codes not so different from the successive
frames of a watchvid. Why then cannot we cut one code short here, and
start another there? Is life so fragile that it can withstand no
tampering? Does the sacred brook no improvement?
^
^        -- Chairman Sheng-ji Yang,
^           \"Dynamics of Mind\"
"
"##Industrial Base
#TECH1
Resources exist to be consumed. And consumed they will be, if not by
this generation then by some future. By what right does this forgotten
future seek to deny us our birthright? None I say! Let us take what is
ours, chew and eat our fill.
^
^        -- CEO Nwabudike Morgan,
^           \"The Ethics of Greed\"
"
"##Information Networks
#TECH2
The righteous need not cower before the drumbeat of human progress.
Though the song of yesterday fades into the challenge of tomorrow,
God still watches and judges us. Evil lurks in the datalinks as it
lurked in the streets of yesteryear. But it was never the streets
that were evil.
^
^        -- Sister Miriam Godwinson,
^           \"The Blessed Struggle\"
"
"##Applied Physics
#TECH3
Scientific theories are judged by the coherence they lend to our
natural experience and the simplicity with which they do so. The
grand principle of the heavens balances on the razor's edge of truth.
^
^        -- Commissioner Pravin Lal,
^           \"A History of Science\"
"
"##Social Psych
#TECH4
If you can discover a better way of life than office-holding
for your future rulers, a well-governed city becomes a possibility.
For only in such a state will those rule who are truly rich, not
in gold, but in the wealth that makes happiness--a good and wise
life.
^        -- Plato,
^           \"The Republic\", Datalinks
"
"##Doctrine: Mobility
#TECH5
Once a man has changed the relationship between himself and his
environment, he cannot return to the blissful ignorance he left.
Motion, of necessity, involves a change in perspective.
^
^        -- Commissioner Pravin Lal,
^           \"A Social History of Planet\"
"
"##Centauri Ecology
#TECH6
Planet's atmosphere, though a gasping death to humans and most animals,
is paradise for Earth plants. The high nitrate content of the soil and
the rich yellow sunlight bring an abundant harvest wherever
adjustments can be made for the unusual soil conditions.
^
^        -- Lady Deirdre Skye,
^           \"A Comparative Biology of Planet\"
"
"##Superconductor
#TECH7
Important? Yes! Critical? Absolutely. I would go so far as to say
that Superconducting Fiber alone makes our present economy possible.
^
^        -- CEO Nwabudike Morgan,
^           MorganLink 3DVision Live Interview
"
"##Nonlinear Mathematics
#TECH8
There are two kinds of scientific progress: the methodical
experimentation and categorization which gradually extend the
boundaries of knowledge, and the revolutionary leap of genius
which redefines and transcends those boundaries. Acknowledging
our debt to the former, we yearn nonetheless for the latter.
^
^        -- Academician Prokhor Zakharov,
^           \"Address to the Faculty\"
"
"##Applied Relativity
#TECH9
You ivory tower intellectuals must not lose touch with the world
of industrial growth and hard currency. It is all very well and
good to pursue these high-minded scientific theories, but research
grants are expensive and you must justify your existence by providing
not only knowledge, but concrete and profitable applications as well.
^
^        -- CEO Nwabudike Morgan,
^           \"The Ethics of Greed\"
"
"##Fusion Power
#TECH10
Our ancestors harnessed the power of a sun, and so again shall we.
^
^        -- Commissioner Pravin Lal,
^           \"The Science of Our Fathers\"
"
"##Silksteel Alloys
#TECH11
Until quite recently, spider silk had the highest tensile strength
of any substance known to man, and the name Silksteel pays homage
to the arachnid for good reason.
^
^        -- Commissioner Pravin Lal,
^           \"U.N. Scientific Survey\"
"
"##Advanced Subatomic Theory
#TECH12
The substructure of the universe regresses infinitely towards
smaller and smaller components. Behind atoms we find electrons,
and behind electrons quarks. Each layer unraveled reveals new
secrets, but also new mysteries.
^
^        -- Academician Prokhor Zakharov,
^           \"For I Have Tasted The Fruit\"
"
"##High Energy Chemistry
#TECH13
At atrociously high energy states, the properties of matter
change subtly and new miracles become possible. The Plasma
Accretion process is now dangerous and difficult to control, but
its products will soon become commonplace in our society.
^
^        -- Sister Miriam Godwinson,
^           \"The Lord Works\"
"
"##Frictionless Surfaces
#TECH14
As I stepped onto the Magtube, a thought struck me:
Can there be friction where there is no substance?
And can substance be tricked into hiding from itself?
^
^        -- Dr. Gayle Nambala,
^           Morgan Industries Researcher
"
"##Nanometallurgy
#TECH15
Our scientists now use fractal theory to \"teach\" the molecules to
assume, or resume, a particular form. Substances of amazing
strength become simple once the formulae are properly computed.
^
^        -- Col. Corazon Santiago,
^           \"The Council of War\"
"
"##Superstring Theory
#TECH16
A brave little theory, and actually quite coherent for a system of
five or seven dimensions--if only we lived in one.
^
^        -- Academician Prokhor Zakharov,
^           \"Now We Are Alone\"
"
"##Advanced Military Algorithms
#TECH17
Man has killed man from the beginning of time, and each new frontier
has brought new ways and new places to die. Why should the future
be different?
^
^        -- Col. Corazon Santiago,
^           \"Planet: A Survivalist's Guide\"
"
"##Monopole Magnets
#TECH18
I maintain nonetheless that yin-yang dualism can be overcome.
With sufficient enlightenment we can give substance to any
distinction: mind without body, north without south, pleasure
without pain. Remember, enlightenment is a function of willpower,
not of physical strength.
^
^        -- Chairman Sheng-ji Yang,
^           \"Essays on Mind and Matter\"
"
"##Matter Compression
#TECH19
Preliminary analysis indicates that our rivals have developed
a safe and reliable method to simulate conditions existing on the
interior of a stellar mass. The fabrication and transmutation
of materials possible in such an environment guarantees significant
industrial and military applications.
^
^        -- Probe Team Operations Directorate,
^           Top Secret Report
"
"##Unified Field Theory
#TECH20
Beware, you who seek first and final principles, for you are
trampling the garden of an angry God and he awaits you just
beyond the last theorem.
^
^        -- Sister Miriam Godwinson,
^           \"But for the Grace of God\"
"
"##Graviton Theory
#TECH21
This unusual specimen is not so much a classic particle as a
connector--a kind of string attaching two particles. As distance
increases the connective power becomes attenuated, but if it is
cut the power vanishes: forever.
^
^        -- Academician Prokhor Zakharov,
^           \"For I Have Tasted The Fruit\"
"
"##Polymorphic Software
#TECH22
Technological advance is an inherently iterative process.
One does not simply take sand from the beach and produce a Dataprobe.
We use crude tools to fashion better tools, and then our better
tools to fashion more precise tools, and so on. Each minor refinement
is a step in the process, and all of the steps must be taken.
^
^        -- Chairman Sheng-ji Yang,
^           \"Looking God in the Eye\"
"
"##Applied Gravitonics
#TECH23
\"What goes up . . . better doggone well stay up!\"
^
^        -- Morgan Gravitonics,
^           Company Slogan
"
"##Inertial Damping
#TECH24
Until now the battle had been proceeding smoothly: the enemy
was outflanked and had been driven from the reactor housing. But
against the reactor itself the matter cannon were strangely
ineffective. Rounds simply . . . stopped. In mid-air.
^
^        -- Col. Corazon Santiago,
^           \"A Tactical History of Sparta\"
"
"##Quantum Power
#TECH25
^Heaven lasts long, and Earth abides
^What is the secret of their durability?
^Is it because they do not live for themselves
^That they endure so long?
^
^        -- Lao Tzu, Datalinks
" 
"##Singularity Mechanics
#TECH26
Yes, yes, we've all heard the philosophers babble about \"oneness\"
being \"beautiful\" and \"holy\". But let me tell you that {this} kind
of oneness certainly isn't pretty and if you're not careful it
will scare the bejeezus out of you.
^
^        -- Anonymous Lab Technician,
^           MorganLink 3DVision Live Interview
" 
"##Controlled Singularity
#TECH27
Some would ask, how could a perfect God create a universe filled
with so much that is evil. They have missed a greater conundrum:
why would a perfect God create a universe at all?
^
^        -- Sister Miriam Godwinson,
^           \"But for the Grace of God\"
"
"##Temporal Mechanics
#TECH28
Time travel in the classic sense has no place in rational theory,
but temporal distortion does exist on the quantum level, and more
importantly it can be controlled.
^
^        -- Academician Prokhor Zakharov
^           \"For I Have Tasted The Fruit\"
"
"##Probability Mechanics
#TECH29
Einstein would turn over in his grave. Not only does God play
dice, the dice are loaded.
^
^        -- Chairman Sheng-ji Yang,
^           \"Looking God in the Eye\"
"
"##Pre-Sentient Algorithms
#TECH30
Begin with a function of arbitrary complexity. Feed it values,
\"sense data\". Then, take your result, square it, and feed it back
into your original function, adding a new set of sense data.
Continue to feed your results back into the original function ad
infinitum. What do you have? The fundamental principle of human
consciousness.
^
^        -- Academician Prokhor Zakharov,
^           \"The Feedback Principle\"
"
"##Super Tensile Solids
#TECH31
Optical computers, genetic catalogs, nanorepair modules--forget
all of that. It's when you see a megaton of steel suspended over
your head by a thread the thickness of a human hair that you
really find God in technology.
^
^        -- Anonymous Metagenics Dockworker,
^           MorganLink 3DVision Live Interview
"
"##Planetary Networks
#TECH32
If our society seems more nihilistic than that of previous eras, perhaps
this is simply a sign of our maturity as a sentient species. As our
collective consciousness expands beyond a crucial point, we are
at last ready to accept life's fundamental truth: that life's only
purpose is life itself.
^
^       -- Chairman Sheng-ji Yang,
^          \"Looking God in the Eye\"
"
"##Digital Sentience
#TECH33
We are no longer particularly in the business of writing software
to perform specific tasks. We now teach the software how to learn,
and in the primary bonding process it molds itself around the task
to be performed. The feedback loop never really ends, so a tenth year
polysentience can be a priceless jewel or a psychotic wreck, but it
is the primary bonding--the childhood, if you will--that has the most
far-reaching repercussions.
^
^         -- Bad'l Ron, Wakener,
^            Morgan Polysoft
"
"##Self-Aware Machines
#TECH34
Without sensibility no object would be given to us, without
understanding no object would be thought. Thoughts without content
are empty, intuitions without concepts are blind.
^
^        -- Immanuel Kant,
^           \"Critique of Pure Reason\", Datalinks
^
^
^I swear sometimes they're watching me.
^
^        -- Bozon Pete, Shift Foreman,
^           Metagenics Biomachinery Division
"
"##Doctrine: Initiative
#TECH35
A ship at sea is its own world. To be the captain of a ship is
to be the unquestioned ruler of that world and requires all of
the leadership skills of a prince or minister.
^
^        -- Col. Corazon Santiago,
^           \"Leadership and the Sea\"
"
"##Doctrine: Flexibility
#TECH36
He held his arm too stiffly, and so was thrown back repeatedly,
until at last I seized his forearm and snapped it back against
itself. His training suffered while the arm healed, of course,
but I felt this was a lesson he must learn early, and well.
^
^        -- Spartan Kel,
^           \"Honing the Ki\"
"
"##Intellectual Integrity
#TECH37
Man's unfailing capacity to believe what he prefers to be true
rather than what the evidence shows to be likely and possible has
always astounded me. We long for a caring Universe which will save
us from our childish mistakes, and in the face of mountains of
evidence to the contrary we will pin all our hopes on the slimmest
of doubts. God has not been proven not to exist, therefore
he must exist.
^
^        -- Academician Prokhor Zakharov,
^           \"For I Have Tasted The Fruit\"
"
"##Synthetic Fossil Fuels
#TECH38
Fossil fuels in the last century reached their extreme prices
because of their inherent utility: they pack a great deal of
potential energy into an extremely efficient package. If we can
but sidestep the 100 million year production process, we can corner
this market once again.
^
^        -- CEO Nwabudike Morgan,
^           Strategy Session
"
"##Doctrine: Air Power
#TECH39
Air Power rests at the apex of the first triad of victory, for it
combines Mobility, Flexibility, and Initiative.
^
^        -- Spartan Battle Manual
"
"##Photon/Wave Mechanics
#TECH40
Time dilates as the speed of light approaches. To the extent that
light consists of particles, it is in its own way timeless. Through
simple perturbations of the temporal manifold, we can refract or
repel photons most efficiently.
^
^        -- Academician Prokhor Zakharov,
^           \"Now We Are Alone\"
"
"##Mind/Machine Interface
#TECH41
The Warrior's bland acronym, MMI, obscures the true horror of
this monstrosity. Its inventors promise a new era of genius, but
meanwhile unscrupulous power brokers use its forcible installation
to violate the sanctity of unwilling human minds. They are
creating their own private army of demons.
^
^        -- Commissioner Pravin Lal,
^           \"Report on Human Rights\"
"
"##Nanominiaturization
#TECH42
Objects once measured in meters have become so small that they cannot
be seen by the naked eye, with revolutionary applications across
the board. Gentlemen, forget what your courtesans have told you:
size does matter!
^
^        -- CEO Nwabudike Morgan,
^           Morgan Industries Annual Report
"
"##Doctrine: Loyalty
#TECH43
Therefore a wise prince will seek means by which his subjects
will always and in every possible condition of things have need
of his government, and then they will always be faithful to him.
^
^        -- Niccolo Machiavelli,
^           \"The Prince\", Datalinks
"
"##Ethical Calculus
#TECH44
Some vices miss what is right because they are deficient, others
because they are excessive, in feelings or in actions, while virtue
finds and chooses the mean.
^
^        -- Aristotle,
^           \"Nichomachean Ethics\", Datalinks
"
"##Industrial Economics
#TECH45
Our first challenge is to create an entire economic infrastructure, from
top to bottom, out of whole cloth. No gradual evolution from previous
economic systems is possible, because there IS no previous economic
system. Each interdependent piece must be materialized simultaneously
and in perfect working order; otherwise the system will crash out
before it ever gets off the ground.
^
^        -- CEO Nwabudike Morgan,
^           \"The Centauri Monopoly\"
"
"##Industrial Automation
#TECH46
In the borehole pressure mines 100km beneath Planetsurface,
at the Mohorovicic Discontinuity where crust gives way to mantle,
temperatures often reach levels well in excess of 1000 degrees Celsius.
Exploitation of Planet's resources under such brutal conditions has
required quantum advances in robotic and teleoperational technology.
^
^        -- Morgan Industries, Ltd.,
^           \"Annual Report\"
"
"##Centauri Meditation
#TECH47
The Isle of the Deep is really not a single creature but a colony
of thousands of individual tubules, an aquatic vector of the Mind Worm
which terrorizes Planet's continents. Over its lifetime certain tubules
secrete a tough, gluelike substance which hardens to form the
characteristic shell that floats the colony and creates the appearance
of a rogue island.
^
^        -- Lady Deirdre Skye,
^           \"A Comparative Biology of Planet\"
"
"##Secrets of the Human Brain
#TECH48
There are only two ways in which we can account for a necessary
agreement of experience with the concepts of its objects: either
experience makes these concepts possible or these concepts make
experience possible.
^
^        -- Immanuel Kant,
^           \"Critique of Pure Reason\", Datalinks
"
"##Gene Splicing
#TECH49
The genetic code does not, and cannot, specify the nature
and position of every capillary in the body or every neuron
in the brain. What it {can} do is describe the underlying
fractal pattern which creates them.
^
^        -- Academician Prokhor Zakharov,
^           \"Nonlinear Genetics\"
"
"##Bio-Engineering
#TECH50
Why do you insist that the human genetic code is "sacred" or "taboo"?
It is a chemical process and nothing more. For that matter -we- are
chemical processes and nothing more. If you deny yourself a useful
tool simply because it reminds you uncomfortably of your mortality,
you have uselessly and pointlessly crippled yourself.
^
^        -- Chairman Sheng-ji Yang,
^           \"Looking God in the Eye\"
"
"##Biomachinery
#TECH51
I loved my chosen. How then to face the day when she left me?
So I took from her body a single cell, perhaps to love her again.
^
^        -- Commissioner Pravin Lal,
^           \"Time of Bereavement\"
"
"##Neural Grafting
#TECH52
I think, and my thoughts cross the barrier into the synapses of the
machine, just as the good doctor intended. But what I cannot shake,
and what hints at things to come, is that thoughts cross back. In my
dreams, the sensibility of the machine invades the periphery of my
consciousness: dark, rigid, cold, alien. Evolution is at work here,
but just what is evolving remains to be seen.
^
^        -- Commissioner Pravin Lal,
^           \"Man and Machine\"
"
"##Cyberethics
#TECH53
The wicked have told me of things that delight them, but not
such things as your law has to tell.
^
^        -- Saint Augustine,
^           \"Confessions\", Datalinks
"
"##Eudaimonia
#TECH54
The happy life is thought to be one of excellence; now
an excellent life requires exertion, and does not consist
in amusement. If Eudaimonia, or happiness, is activity in
accordance with excellence, it is reasonable that it should
be in accordance with the highest excellence; and this will
be that of the best thing in us.
^
^        -- Aristotle,
^           \"Nichomachean Ethics\", Datalinks
"
"##The Will to Power
#TECH55
Man is a rope, tied between beast and overman--a rope
over an abyss. A dangerous across, a dangerous on-the-way,
a dangerous looking-back, a dangerous shuddering and
stopping. What is great in man is that he is a bridge and
not an end: what can be loved in man is that he is an overture
and a going under. I love those who do not know how to
live, for they are those who cross over.
^
^        -- Friedrich Nietzsche,
^           \"Thus Spoke Zarathustra\", Datalinks
"
"##Threshold of Transcendence
#TECH56
And when he has brought forth and reared this perfect virtue, he
shall be called the friend of god, and if ever it is given to man
to put on immortality, it shall be given to him.
^
^        -- Plato,
^           \"The Symposium\", Datalinks
"
"##Matter Transmission
#TECH57
The first living thing to go through the device was a small white
rat. I still have him, in fact. As you can see, the damage was
not so great as they say.
^
^        -- Academician Prokhor Zakharov,
^           \"See How They Run\"
"
"##Centauri Empathy
#TECH58
Observe the Razorbeak as it tends so carefully to the fungal blooms;
just the right bit from the yellow, then a swatch from the pink.
Follow the Glow Mites as they gather and organize the fallen spores.
What higher order guides their work? Mark my words: someone or something
is {managing} the ecology of this planet.
^
^        -- Lady Deirdre Skye,
^           \"Planet Dreams\"
"
"##Environmental Economics
#TECH59
^         We sit together,
^        the mountain and I,
^  until only the mountain remains
^
^        -- Li Po,
^           From the Yang Collection
"
"##Ecological Engineering
#TECH60
The prevalence of anoxic environments rich in organic material,
combined with the presence of nitrated compounds has
led to an astonishing variety of underground organisms which live in
the absence of oxygen and \"breathe\" nitrate. Likewise, the scarcity
of carbon in the environment has forced plants to economize on its use.
Thus, all our efforts to return carbon to the biosphere will encourage
the native life to proliferate. Conversely, the huge quantities
of nitrate in the soil will be heaven to human farmers.
^
^        -- Lady Deirdre Skye,
^           \"The Early Years\"
"
"##Planetary Economics
#TECH61
The Morgans fear what may not be purchased, for a trader cannot
comprehend a thing that is priceless.
^
^        -- Sister Miriam Godwinson,
^           \"The Collected Sermons\"
"
"##Adv. Ecological Engineering
#TECH62
^ You are the children of a dead planet, earthdeirdre, and
^   this death we do not comprehend. We shall take you in, but
^     may we ask this question--will we too catch the planetdeath
^       disease?
^
^        -- Lady Deirdre Skye,
^           \"Conversations with Planet\"
"
"##Centauri Psi
#TECH63
The Mind Worms are the natural defenses of the living Planet--the
white blood cells, if you will. In a world in which unassimilated
thought represents danger, the Mind Worm seeks out concentrations of
sentient mental energy and destroys them, ruthlessly and efficiently.
^
^        -- Commissioner Pravin Lal,
^           \"Mind Worm, Mind Worm\"
"
"##Secrets of Alpha Centauri
#TECH64
^ You waited so long to heed us, earthdeirdre,
^   Almost we pruned you, as we may yet prune your branches.
^
^        -- Lady Deirdre Skye,
^           \"Conversations with Planet\"
"
"##Secrets of Creation
#TECH65
And when the hourglass has run out, the hourglass of temporality,
when the noise of secular life has grown silent and its restless or
ineffectual activism has come to an end, when everything around you
is still, as it is in eternity, then eternity asks you and every
individual in these millions and millions about only one thing:
whether you have lived in despair or not.
^
^        -- Soren Kierkegaard,
^           \"The Sickness Unto Death\", Datalinks
"
"##Advanced Spaceflight
#TECH66
And so we return again to the holy void. Some say this is simply our
destiny, but I would have you remember always that the void EXISTS,
just as surely as you or I. Is nothingness any less a miracle than
substance?
^
^        -- Sister Miriam Godwinson,
^           \"We Must Dissent\"
"
"##Homo Superior
#TECH67
Companions the creator seeks, not corpses, not herds and
believers. Fellow creators the creator seeks--those who write
new values on new tablets. Companions the creator seeks, and
fellow harvesters; for everything about him is ripe for the
harvest.
^
^        -- Friedrich Nietzsche,
^           \"Thus Spoke Zarathustra\", Datalinks
"
"##Organic Superlubricant
#TECH68
Organic Superlube? Oh, it's great stuff, great stuff.
You really have to keep an eye on it, though--it'll try and slide
away from you the first chance it gets.
^
^        -- T. M. Morgan-Reilly,
^           Morgan Metagenics
"
"##Quantum Machinery
#TECH69
Men in their arrogance claim to understand the nature of creation,
and devise elaborate theories to describe its behavior. But always
they discover in the end that God was quite a bit more clever than
they thought.
^
^        -- Sister Miriam Godwinson,
^           \"We Must Dissent\"
"
"##Global Energy Theory
#TECH70
\"Energy is the currency of the future.\"
^
^        -- CEO Nwabudike Morgan,
^           \"The Centauri Monopoly\"
"
"##Nanomatter Editation
#TECH71
'Abort, Retry, Fail?' was the phrase some wormdog scrawled
next to the door of the Edit Universe project room. And when
the new dataspinners started working, fabricating their worlds
on the huge organic comp systems, we'd remind them: if you see
this message, {always} choose 'Retry.'
^
^        -- Bad'l Ron, Wakener,
^           Morgan Polysoft
"
"##Optical Computers
#TECH72
We have reached an informational threshold which can only be crossed
by harnessing the speed of light directly. The quickest computations
require the fastest possible particles moving along the shortest
paths. Since the capability now exists to take our information
directly from photons travelling molecular distances, the final
act of the information revolution will soon be upon us.
^
^        -- Academician Prokhor Zakharov,
^           \"For I Have Tasted The Fruit\"
"
"##Industrial Nanorobotics
#TECH73
Already we have turned all of our critical industries, all of our
material resources, over to these . . . things . . . these lumps
of silver and paste we call nanorobots. And now we propose to teach
them intelligence? What, pray tell, will we do when these little
homunculi awaken one day and announce that they have no further need
of us?
^
^        -- Sister Miriam Godwinson,
^           \"We Must Dissent\"
"
"##Centauri Genetics
#TECH74
Remember, genes are NOT blueprints. This means you can't, for example,
insert \"the genes for an elephant's trunk\" into a giraffe and get a
giraffe with a trunk. There -are- no genes for trunks. What you CAN do
with genes is chemistry, since DNA codes for chemicals. For instance,
we can in theory splice the native plants' talent for nitrogen fixation
into a terran plant.
^
^        -- Academician Prokhor Zakharov,
^           \"Nonlinear Genetics\"
"
"##Sentient Econometrics
#TECH75
The fungus has been Planet's dominant lifeform since about
the time of the Lower Paleozoic on Earth. But when, once every
hundred million years or so, the neural net at last achieves the
critical mass necessary to become sentient, the final metamorphosis
kills off most of the other life on the planet. It is possible that
we humans can help to break this tragic cycle.
^
^        -- Lady Deirdre Skye,
^           \"Planet Dreams\"
"
"##Retroviral Engineering
#TECH76
The Academician's private residences shall remain off-limits to
the Genetic Inspectors. We possess no retroviral capability,
we are not researching retroviral engineering, and we shall not
allow this Council to violate faction privileges in the name of this
ridiculous witch hunt!\"
^
^        -- Fedor Petrov,
^           Vice Provost for University Affairs
"
"##Satellite Reconnaissance
#TECH77
I have often been asked: if we have traveled between the stars,
why can we not launch the simplest of orbital probes? These fools
fail to understand the difficulty of finding the appropriate
materials on this Planet, of developing adequate power supplies,
and creating the infrastructure necessary to support such an
effort. In short, we have struggled under the limitations of a
colonial society on a virgin planet. Until now.
^
^        -- Col. Corazon Santiago,
^           \"Planet: A Survivalist's Guide\"
"
"##Progenitor Psych
#TECH78
And I stood before him, and I sang unto her, and it appeared to 
listen. His very countenance rippled like the sea, and the sound 
of my own voice came back to me, distorted. For a moment I thought 
she was mocking me, or it was nonsapient and mimicking me. Then I 
understood: the sounds were not important; it was how I affected 
his sounds and how she affected mine that transmitted the message.
^
^        -- Prime Function Aki Zeta-Five
^           \"One Future\"
"
"##Field Modulation
#TECH79
The Progenitor race appears to sense, and possibly even manipulate, 
local fields an untrained human cannot perceive without mechanical aid, 
including at the very least electricity and magnetism. This sensitivity 
creates entirely new worlds of artistic endeavors for the race-or it may 
be developed into a powerful combat awareness that can foil any attempt 
at surprise.
^
^        -- Prime Function Aki Zeta-Five
^           \"Alien Analysis\"
"
"##Adaptive Doctrine
#TECH80
War is war; destruction is destruction. You think this is obvious. 
But war is not destruction, it is victory. To achieve victory, simply 
appear to give the opponent what he wants and he will go away, or join 
you in your quest for additional power.
^
^        -- Datatech Sinder Roze
^           \"Information Burns\"
"
"##Adaptive Economics
#TECH81
Humans : correct in making the leap from wealth as currency to wealth as 
energy. But logic failure : wealth ultimately is extension of desire, fluctuating 
with emotions and state of mind. Desires : when all are supported in purely adaptable 
system, true wealth is achieved.
^
^        -- Usurper Judaa Marr
^           \"Human : Nature\"
"
"##Bioadaptive Resonance
#TECH82
I saw the alien phalanx coming toward us, and I calmed my mind as Kri'lan had taught 
me. And what I saw next to the phalanx was a shadow regiment, half-formed from the 
resonance around them. I cursed the aliens...with power like that, each one could fight 
as many, and I thanked Planet for sending us the betrayer.
^
^        -- Prophet Cha Dawn
^           \"The Betrayer and I\"
"
"##Sentient Resonance
#TECH83
And here we tinker with metal, to try to give it a kind of life, and suffer those who 
would scoff at our efforts. But who's to say that, if intelligence had evolved in some 
other form in past millennia, the ancestors of these beings would not now scoff at the 
idea of intelligence residing within meat?
^
^        -- Prime Function Aki Zeta-Five
^           \"The Fallacies of Self-Awareness\"
"
"##Secrets of the Manifolds
#TECH84
Kri'lan taught me of the resonance and how to feel it. After much training, I could 
see -- the very surface under our feet, Planet itself -- is a living, fluctuating nexus 
of energy, violent, beautiful and quite unstable. And I could also feel its 
cousins -- distant mirrors on the other side of the space-time continuum -- the 
far-flung Manifolds.
^
^        -- Prophet Cha Dawn
^           \"The Betrayer and I\"
"
"##N-Space Compression
#TECH85
Humans : there is no space inside rocket. Progenitor : space exists around all things 
with mass. Space : \"here\". Inside rocket : \"there\". Secret: bring here to there.
^
^        -- Caretaker Lular H'minee
^           \"Secret : Space\"
"
"##String Resonance
#TECH86
To understand a thing is to know the manner by which it might be destroyed. A fundamental 
understanding of the basic building-blocks of the Universe is essential, then, to the total 
destruction of everything.
^
^        -- Foreman Domai
^           \"One Tool, One Thought\"
"
"##Transcendent Thought
#TECH88
^  Eternity lies ahead of us, and behind.
^    Have you drunk your fill?
^
^        -- Lady Deirdre Skye,
^           \"Conversations with Planet\", Epilogue
"
"##The Human Genome Project
#PROJECT0
To map the very stuff of life; to look into the
genetic mirror and watch a million generations
march past. That, friends, is both our curse and
our proudest achievement. For it is in reaching to our
beginnings that we begin to learn who we truly are.
^
^        -- Academician Prokhor Zakharov,
^           \"Address to the Faculty\"
"
"##The Command Nexus
#PROJECT1
Information, the first principle of warfare, must form the
foundation of all your efforts. Know, of course, thine enemy.
But in knowing him do not forget above all to know thyself.
The commander who embraces this totality of battle shall win
even with the inferior force.
^
^        -- Spartan Battle Manual
"
"##The Weather Paradigm
#PROJECT2
I shall not confront Planet as an enemy, but shall accept
its mysteries as gifts to be cherished. Nor shall I crudely
seek to peel the layers away like the skin from an onion.
Instead I shall gather them together as the tree gathers the
breeze. The wind shall blow and I shall bend. The sky shall
open and I shall drink my fill.
^
^        -- Gaian Acolyte's Prayer
"
"##The Merchant Exchange
#PROJECT3
Human behavior is economic behavior. The particulars may vary,
but competition for limited resources remains a constant. Need
as well as greed have followed us to the stars, and the rewards
of wealth still await those wise enough to recognize this deep
thrumming of our common pulse.
^
^        -- CEO Nwabudike Morgan,
^           \"The Centauri Monopoly\"
"
"##The Empath Guild
#PROJECT4
Symbols are the key to telepathy. The mind wraps its
secrets in symbols; when we discover the symbols that shape
our enemy's thought, we can penetrate the vault of his mind.
^
^        -- Lady Deirdre Skye,
^           \"Our Secret War\"
"
"##The Citizens' Defense Force
#PROJECT5
As the writhing, teeming mass of Mind Worms swarmed over the outer
perimeter, we saw the defenders recoil in horror. \"Stay calm! Use
your flame guns!\" shouted the commander, but to no avail. It is well
known that the Mind Worm Boil uses psychic terror to paralyze its
prey, and then carefully implants ravenous larvae in the brains of
its still-conscious victims. Even with the best weapons, only the
most disciplined troops can resist this horrific attack.
^
^        -- Lady Deirdre Skye,
^           \"Our Secret War\"
"
"##The Virtual World
#PROJECT6
What do I care for your suffering? Pain, even agony, is no
more than information before the senses, data fed to the
computer of the mind. The lesson is simple: you have received
the information, now act on it. Take control of the input and
you shall become master of the output.
^
^        -- Chairman Sheng-ji Yang,
^           \"Essays on Mind and Matter\"
"
"##The Planetary Transit System
#PROJECT7
As distances vanish and the people can flow freely from place
to place, society will cross a psychological specific heat
boundary and enter a new state. No longer a solid or liquid,
we have become as a vapor and will expand to fill all available
space. And like a gas, we shall not be easily contained.
^
^        -- Sister Miriam Godwinson,
^           \"But for the Grace of God\"
"
"##The Xenoempathy Dome
#PROJECT8
I believe Planet will talk to us if we are willing
to listen. These fungal stalks behave as multistate relays:
taken together, the neural net connectivity must be staggering.
Can a planet be said to have achieved sentience?
^
^        -- Lady Deirdre Skye,
^           Arguments in Council
"
"##The Neural Amplifier
#PROJECT9
Against such abominations, we organize our defenses on the
principle that one strong and able mind can shield the many.
^
^        -- Spartan Battle Manual
"
"##Maritime Control Center
#PROJECT10
It is altogether fitting that we who have sailed the deeps of
space now return again to the sea. This is in many ways a water
planet, and it can be ruled from the waves. With sea power, rugged
terrain can be bypassed and enemy strongholds isolated. Once
naval superiority is achieved, Planet is ours for the taking.
^
^        -- Col. Corazon Santiago,
^           \"Planet: A Survivalist's Guide\"
"
"##The Planetary Datalinks
#PROJECT11
As the Americans learned so painfully in Earth's final century,
free flow of information is the only safeguard against tyranny.
The once-chained people whose leaders at last lose their grip on
information flow will soon burst with freedom and vitality, but
the free nation gradually constricting its grip on public discourse
has begun its rapid slide into despotism. Beware of he who would
deny you access to information, for in his heart he dreams himself
your master.
^
^        -- Commissioner Pravin Lal,
^           \"U.N. Declaration of Rights\"
"
"##The Supercollider
#PROJECT12
^  God does not play dice.
^
^        -- Albert Einstein, Datalinks
"
"##The Ascetic Virtues
#PROJECT13
Learn to overcome the crass demands of flesh and bone, for they
warp the matrix through which we perceive the world. Extend your
awareness outward, beyond the self of body, to embrace the self
of group and the self of humanity. The goals of the group and the
greater race are transcendent, and to embrace them is to achieve
enlightenment.
^
^        -- Chairman Sheng-ji Yang,
^           \"Essays on Mind and Matter\"
"
"##The Longevity Vaccine
#PROJECT14
I plan to live forever, of course, but barring that I'd
settle for a couple thousand years. Even five hundred would be
pretty nice.
^
^        -- CEO Nwabudike Morgan,
^           MorganLink 3DVision Interview
"
"##The Hunter-Seeker Algorithm
#PROJECT15
If I determine the enemy's disposition of forces while I have
no perceptible form, I can concentrate my forces while the enemy
is fragmented. The pinnacle of military deployment approaches the
formless: if it is formless, then even the deepest spy cannot
discern it nor the wise make plans against it.
^
^        -- Sun Tzu,
^           \"The Art of War\", Datalinks
"
"##The Pholus Mutagen
#PROJECT16
^ We welcome you, earthdeirdre and earthwheat and earthtree as
^   honored guests, for you add great power to our ancient song--
^     planetfungus and planetworm and planetmind sing and play
^       here, and you are welcome among us.
^
^        -- Lady Deirdre Skye,
^           \"Conversations with Planet\"
"
"##The Cyborg Factory
#PROJECT17
^  A handsome young Cyborg named Ace,
^  Wooed women at every base,
^    But once ladies glanced at
^    His special enhancement
^  They vanished with nary a trace.
^
^        -- Barracks Graffiti,
^           Sparta Command
"
"##The Theory of Everything
#PROJECT18
The Earth is the cradle of the mind, but one cannot stay in the
cradle forever.
^
^        -- Konstantin Tsiolkovsky,
^           The Father of Rocketry, Datalinks
"
"##The Dream Twister
#PROJECT19
^  Mary had a little lamb,
^  Little lamb little lamb,
^  Mary had a little lamb,
^  whose fleece was white as snow.
^
^        -- Assassins' Redoubt,
^           Final Transmission
"
"##The Universal Translator
#PROJECT20
And the Lord said, \"Behold, the people is one, and
they have all one language; and this they begin to do:
and now nothing will be restrained from them, which
they have imagined to do. Go to, let us go down, and
there confound their language, that they may not
understand one another's speech.\"
^
^        -- The Conclave Bible,
^           Datalinks
"
"##The Network Backbone
#PROJECT21
Of course we'll bundle our MorganNet software with the new
network nodes; our customers expect no less of us. We have never
sought to become a monopoly. Our products are simply so good that
no one feels the need to compete with us.
^
^        -- CEO Nwabudike Morgan,
^           Morgan Data Systems press release
"
"##The Nano Factory
#PROJECT22
Industrial Grade Nano-Paste, Planet's most valuable commodity, can also
be one of its most dangerous. Simply pour out several canisters, slide
in a programming transponder, and step well away while the stuff cooks.
In under an hour the nano will use available materials to assemble a
small factory, a hovertank, or enough impact rifles to equip a regiment.
^
^        -- Col. Corazon Santiago,
^           \"Planet: A Survivalist's Guide\"
"
"##The Living Refinery
#PROJECT23
We estimate that during the next mission century most of
Planet's industries will be moved off-planet to Nessus Prime and
other orbital facilities. Many of our industries will benefit
greatly from the low gravity environments available in space,
particularly those involving genetically engineered microbes.
^
^        -- CEO Nwabudike Morgan,
^           \"The Centauri Monopoly\"
"
"##The Cloning Vats
#PROJECT24
We shall take only the greatest minds, the finest soldiers,
the most faithful servants. We shall multiply them a thousandfold
and release them to usher in a new era of glory.
^
^        -- Col. Corazon Santiago,
^           \"The Council of War\"
"
"##The Self-Aware Colony
#PROJECT25
Will we next create false gods to rule over us? How proud
we have become, and how blind.
^
^        -- Sister Miriam Godwinson,
^           \"We Must Dissent\"
"
"##Clinical Immortality
#PROJECT26
And the Lord God said, \"Behold, the man is become as
one of us, to know good and evil: and now, lest he put forth
his hand, and take also of the tree of life, and eat, and
live forever, we must send him forth.\" Therefore the
Lord God sent him forth from the garden of Eden, to till
the ground from whence he was taken.
^
^        -- The Conclave Bible,
^           Datalinks
"
"##The Space Elevator
#PROJECT27
In one moment, Earth; in the next, Heaven.
^
^        -- Academician Prokhor Zakharov,
^           \"For I Have Tasted The Fruit\"
"
"##The Singularity Inductor
#PROJECT28
What actually transpires beneath the veil of an event horizon?
Decent people shouldn't think too much about that.
^
^        -- Academician Prokhor Zakharov,
^           \"For I Have Tasted The Fruit\"
"
"##The Bulk Matter Transmitter
#PROJECT29
And what of the immortal soul in such transactions? Can this
machine transmit and reattach it as well? Or is it lost forever,
leaving a soulless body to wander the world in despair?
^
^        -- Sister Miriam Godwinson,
^           \"We Must Dissent\"
"
"##The Telepathic Matrix
#PROJECT30
^  From the delicate strands,
^    between minds we weave our mesh:
^      a blanket to warm the soul.
^
^        -- Lady Deirdre Skye,
^           \"The Collected Poems\"
"
"##The Voice of Planet
#PROJECT31
Imagine the entire contents of the planetary datalinks, the sum total
of human knowledge, blasted into the Planetmind's fragile neural
network with the full power of every reactor on the planet. Thousands
of years of civilization compressed into a single searing burst of
revelation. That is our last-ditch attempt to win humanity a reprieve
from extinction at the hands of an awakening alien god.
^
^        -- Academician Prokhor Zakharov,
^           \"Planet Speaks\"
"
"##Ascent to Transcendence
#PROJECT32
No longer mere earthbeings and planetbeings are we, but bright
children of the stars! And together we shall dance in and out
of ten billion years, celebrating the gift of consciousness until
the stars themselves grow cold and weary, and our thoughts turn
again to the beginning.
^
^        -- Lady Deirdre Skye,
^           \"Conversations with Planet\"
"
"##Manifold Harmonics
#PROJECT33
Manifold harmonic fields : within, the true nature of the universe becomes 
apparent. Layers : within layers. Worlds : within worlds. Inside : the heart 
of everything opens, and everything opens to it.
^
^        -- Caretaker Lular H'minee,
^           \"Resonance : Power\"
"
"##Nethack Terminus
#PROJECT34
By creating a planetary network, mankind on Planet now has the ability 
to share information at light-speed. But by creating a single such network, 
each faction has brought themselves closer to discovery as well. At the speed 
of light, we will catch your information, tag it like an animal in the wild, 
and release it unharmed-if such should serve our purposes.
^
^        -- Datatech Sinder Roze,
^           \"The Alpha Codex\"
"
"##Cloudbase Academy
#PROJECT35
In one dimension I find existence, in two I find life, but in three, I find freedom.
^
^        -- Foreman Domai,
^           Cadet Induction Ceremony, Mission Year 2216
"
"##Planetary Energy Grid
#PROJECT36
\"The ancient Chinese had a name for it: Feng Shui. We call it energy flow. It is the 
same thing, the same thought: energy is everywhere, but only a fraction of it is tapped 
by humans for their purposes. Now the Progenitors have taught us that we can tap not only 
our own latent abilities, but the latent abilities of the Universe itself.\"
^
^        -- Prophet Cha Dawn,
^           \"Planet Rising\"
"
"##Headquarters
#FAC1
As we approached we were confronted by the ruined splendor of
Sparta Command. The true immensity of the place became instantly
apparent as our Quantum Tank crunched over the rubble and parked next
to a shattered bunker, but the extent of the destruction
took weeks to assess. The shielded datacore had sustained several
massive breaches and smoke still billowed from the numerous cannon
ports. There were few signs of human life.
^
^        -- Lady Deirdre Skye,
^           \"Our Secret War\"
"
"##Children's Creche
#FAC2
Proper care and education for our children remains a cornerstone of
our entire colonization effort. Children not only shape our future;
they determine in many ways our present. Men and women work harder
knowing their children are safe and close at hand. And never forget that,
with children present, parents will defend their home to the death.
^
^        -- Col. Corazon Santiago,
^           \"Planet: A Survivalist's Guide\"
"
"##Recycling Tanks
#FAC3
It is every citizen's final duty to go into the tanks and
become one with all the people.
^
^        -- Chairman Sheng-ji Yang,
^           \"Ethics for Tomorrow\"
"
"##Perimeter Defense
#FAC4
Having now established a secure perimeter, we have made ourselves
relatively safe from enemy incursions. But against the seemingly
random attacks by Planet's native life only our array of warning
sensors can help us, for the Mind Worms infiltrate through every crevice
and chew through anything softer than plasmasteel.
^
^        -- Lady Deirdre Skye,
^           \"The Early Years\"
"
"##Tachyon Field
#FAC5
The klaxon began to wail, but we felt the reassuring tingle of
the Tachyon Field crackling to life around us, encasing the
entire base in its impenetrable glow.
^
^        -- Spartan Kel,
^           \"The Fall of Sparta\"
"
"##Recreation Commons
#FAC6
The entire character of a base and its inhabitants can be
absorbed in a quick trip to the Rec Commons. The sweaty
arenas of Fort Legion, the glittering gambling halls of
Morgan Bank, the sunny lovers' trysts in Gaia's High Garden,
or the somber reading rooms of U.N. Headquarters. Even the
feeding bay at the Hive gives stark insight into the sleeping
demons of Yang's communal utopia.
^
^        -- Commissioner Pravin Lal,
^           \"A Social History of Planet\"
"
"##Energy Bank
#FAC7
Life is merely an orderly decay of energy states, and survival
requires the continual discovery of new energy to pump into the
system. He who controls the sources of energy controls the means
of survival.
^
^        -- CEO Nwabudike Morgan,
^           \"The Centauri Monopoly\"
"
"##Network Node
#FAC8
^I don't know but I've been told,
^  Deirdre's got a Network Node.
^Likes to press the on-off switch,
^  Dig that crazy Gaian witch!
^
^        -- Spartan Barracks March
"
"##Biology Lab
#FAC9
Although Planet's native life is based, like Earth's, on right-handed
DNA, and codes for all the same amino acids, the inevitable chemical
and structural differences from a billion years of evolution in an
alien environment render the native plant life highly poisonous
to humans. Juicy, ripe grenade fruits may look appealing, but a
mouthful of organonitrates will certainly change your mind in a hurry.
^
^        -- Lady Deirdre Skye,
^           \"A Comparative Biology of Planet\"
"
"##Skunkworks
#FAC10
The popular stereotype of the researcher is that of a skeptic and a
pessimist. Nothing could be further from the truth! Scientists
must be optimists at heart, in order to block out the incessant
chorus of those who say \"It cannot be done.\"
^
^        -- Academician Prokhor Zakharov,
^           University Commencement
"
"##Hologram Theatre
#FAC11
^  Richard Baxton piloted his Recon Rover into a fungal vortex and
held off four waves of mind worms, saving an entire colony.
^  We immediately purchased his identity manifests and repackaged him
into the Recon Rover Rick character with a multi-tiered media campaign:
televids, touchbooks, holos, psi-tours--the works.
^  People need heroes. They don't need to know how he died clawing his
eyes out, screaming for mercy. The real story would just hurt sales,
and dampen the spirits of our customers.
^
^        -- \"Mythology for Profit\"
^           Morgan Stellartots Keynote Speech
"
"##Paradise Garden
#FAC12
^That sunny dome! Those caves of ice!
^And all who heard should see them there,
^And all should cry, Beware! Beware!
^His flashing eyes, his floating hair!
^Weave a circle round him thrice,
^And close your eyes with holy dread,
^For he on honey-dew hath fed,
^And drunk the milk of Paradise.
^
^        -- Samuel Taylor Coleridge,
^           Datalinks
"
"##Tree Farm
#FAC13
In the great commons at Gaia's Landing we have a tall and particularly
beautiful stand of white pine, planted at the time of the first
colonies. It represents our promise to the people, and to Planet
itself, never to repeat the tragedy of Earth.
^
^        -- Lady Deirdre Skye,
^           \"Planet Dreams\"
"
"##Hybrid Forest
#FAC14
You see in this dome the intermingling of native and earth plants.
Outside, they are competitors, struggling over the trace
elements required for life. Often, one destroys the other. Here,
they are tended with care and kept well nourished. They thrive
together, and the native fungus does not unleash its terrible
defenses. As you can see, competition is unnecessary when resources
are plentiful and population growth is controlled.
^
^        -- Lady Deirdre Skye,
^           \"Planet Dreams\"
"
"##Fusion Lab
#FAC15
It will happen, and it will happen in our lifetimes. Fusion
Power isn't just the future. Fusion Power is now.
^
^        -- T. M. Morgan-Reilly,
^           Morgan Metagenics
"
"##Quantum Lab
#FAC16
Have you ever wondered why clouds behave in such familiar ways when
each specimen is so unique? Or why the energy exchange market is so
unpredictable? In the coming age we must develop and apply
nonlinear mathematical models to real world phenomena. We shall
seek, and find, the hidden fractal keys which can unravel the chaos
around us.
^
^        -- Academician Prokhor Zakharov,
^           University Commencement
"
"##Research Hospital
#FAC17
Some civilian workers got in among the research patients today and
became so hysterical I felt compelled to have them nerve stapled.
The consequence, of course, will be another public relations nightmare,
but I was severely shaken by the extent of their revulsion towards a
project so vital to our survival.
^
^        -- CEO Nwabudike Morgan,
^           The Personal Diaries
"
"##Nanohospital
#FAC18
It is a medical commonplace that the tissues of the human body
replace themselves regularly, essentially creating an entirely
new body every seven years. From whence then come cancer and the
slow degeneration of age? They exist as faults in the patterns of
intelligence within the genes themselves; by reprogramming these
smallest parts, the whole becomes well.
^
^        -- Academician Prokhor Zakharov,
^           \"Nonlinear Genetics\"
"
"##Robotic Assembly Plant
#FAC19
^Captain said to big old John Henry,
^  That old drill keeps a-coming around.
^  Take that steam drill out and start it on that job
^    Let it whop, let it whop that steel on down
^    Let it whop, let it whop that steel on down.
^
^        -- Traditional, Datalinks
"
"##Nanoreplicator
#FAC20
Look at any photograph or work of art. If you could duplicate
exactly the first tiny dot of color, and then the next and the
next, you would end with a perfect copy of the whole,
indistinguishable from the original in every way, including
the so-called \"moral value\" of the art itself. Nothing can
transcend its smallest elements.
^
^        -- CEO Nwabudike Morgan,
^           \"The Ethics of Greed\"
"
"##Quantum Converter
#FAC21
And when at last it is time for the transition from megacorporation to
planetary government, from entrepreneur to emperor, it is then that the
true genius of our strategy shall become apparent, for energy is the
lifeblood of this society and when the chips are down he who controls
the energy supply controls Planet. In former times the energy monopoly
was called \"The Power Company\"; we intend to give this name an entirely
new meaning.
^
^        -- CEO Nwabudike Morgan,
^           \"The Centauri Monopoly\"
"
"##Genejack Factory
#FAC22
My gift to industry is the genetically engineered worker, or
Genejack. Specially designed for labor, the Genejack's muscles and
nerves are ideal for his task, and the cerebral cortex has been
atrophied so that he can desire nothing except to perform his
duties. Tyranny, you say? How can you tyrannize someone who cannot
feel pain?
^
^        -- Chairman Sheng-ji Yang,
^           \"Essays on Mind and Matter\"
"
"##Punishment Sphere
#FAC23
It is not uncommon to see patients undergo permanent psychological
trauma in the presence of the Sphere, before the nerve stapler has
even been strapped into position. Its effect on the general
consciousness of the culture is profound: husbands have seen
wives go inside, and mothers their children. Dr. Xynan left the
surface of the sphere semitranslucent for a reason. You can hear
them in there; you can see them. It is a thing of terrible beauty.
^
^        -- Baron Klim,
^           \"The Music of the Spheres\"
"
"##Hab Complex
#FAC24
The chief aim of their constitution and government is that,
whenever public needs permit, all citizens should be free, so far
as possible, to withdraw their time and energy from the service of
the body, and devote themselves to the freedom and culture of the
mind. For that, they think, is the real happiness of life.
^
^        -- Sir Thomas More,
^           \"Utopia\", Datalinks
"
"##Habitation Dome
#FAC25
^ I sit in my cubicle, here on the motherworld.
^ When I die, they will put my body in a box and
^   dispose of it in the cold ground.
^ And in all the million ages to come, I will never
^   breathe or laugh or twitch again.
^ So won't you run and play with me here among the
^   teeming mass of humanity?
^ The universe has spared us this moment.
^
^        -- Anonymous, Datalinks
"
"##Pressure Dome
#FAC26
When beholding the tranquil beauty and brilliancy of the ocean's
skin, one forgets the tiger heart that pants beneath it; and would
not willingly remember that this velvet paw but conceals a
remorseless fang.
^
^        -- Herman Melville,
^           \"Moby Dick\", Datalinks
"
"##Command Center
#FAC27
Superior training and superior weaponry have, when taken together,
a geometric effect on overall military strength. Well-trained,
well-equipped troops can stand up to many more times their lesser
brethren than linear arithmetic would seem to indicate.
^
^        -- Spartan Battle Manual
"
"##Naval Yard
#FAC28
The sea is everything. It covers seven-tenths of the globe. Its breath
is pure and healthy. It is an immense desert where a man is never
alone, for he can feel life quivering all about him. The sea is only
a receptacle for all the prodigious, supernatural things that exist
inside it; it is only movement and love; it is the living infinite.
^
^        -- Jules Verne,
^           \"20,000 Leagues Under The Sea\", Datalinks
"
"##Aerospace Complex
#FAC29
You are orphans, earthdeirdre, your homeworld already buried
so young among the aeons. Yet now you fill the skies where
we watched a million sunsets with flame and contrails, paying
no heed to the hard lessons the universe has tried to teach you.
Are you a breath of life to invigorate a complacent world,
you earthhumans, or an insidious cancer which must be excised?
^
^        -- Lady Deirdre Skye,
^           \"Conversations With Planet\"
"
"##Bioenhancement Center
#FAC30
We are all aware that the senses can be deceived, the eyes fooled.
But how can we be sure our senses are not being deceived at any
particular time, or even all the time? Might I just be a brain in
a tank somewhere, tricked all my life into believing in the events
of this world by some insane computer? And does my life gain or lose
meaning based on my reaction to such solipsism?
^
^        -- Project PYRRHO, Specimen 46, Vat 7
^           Activity Recorded M.Y. 2302.22467
^           TERMINATION OF SPECIMEN ADVISED
"
"##Centauri Preserve
#FAC31
In the years since our arrival, we have foolishly disrupted so
many of Planet's ecosystems that entire species may vanish
without our ever having understood, or even known them. We must halt
this plunder, and halt it immediately, for our own survival as a
species depends on our ability to strike a balance on this world.
^
^       -- Commissioner Pravin Lal,
^          \"Mind Worm, Mind Worm\"
"
"##Temple of Planet
#FAC32
Let the Gaians preach their silly religion, but one way or the other
I shall see this compound burned, seared, and sterilized until every
hiding place is found and until every last Mind Worm egg, every last
slimy one, has been cooked to a smoking husk. That species shall be
exterminated, I tell you! Exterminated!
^
^       -- Academician Prokhor Zakharov,
^          Lab Three aftermath
"
"##Psi Gate
#FAC33
Go through, my children! The time of miracles is upon us. Let
us cast off sin and walk together to the Garden of the Lord.
With God's mercy we shall meet again on the other side.
^
^        -- Sister Miriam Godwinson,
^           \"Last Testament\"
"
"##Sky Hydroponics Lab
#FAC34
Sky farms are fantastically beautiful, with their kilometer long
networks of glass framed in grids of metal, and the sunlight
shining through jungles of vegetation inside. When one of them
catches the light, you can see the refracted beauty for miles;
they are life-giving stars on a desolate planet...gardens on
the wing.
^
^        -- Lady Deidre Skye,
^           \"Planet Dreams\"
"
"##Nessus Mining Station
#FAC35
Red-hot iron, white-hot iron, cold-black iron; an iron taste,
and iron smell, and a Babel of iron sounds.
^
^        -- Charles Dickens,
^           Bleak House, Datalinks
"
"##Orbital Power Transmitter
#FAC36
Planet's Primary, Alpha Centauri A, blasts unimaginable quantities
of energy into space each instant, and virtually every joule of it
is wasted entirely. Incomprehensible riches can be ours if we can but
stretch our arms wide enough to dip from this eternal river of wealth.
^
^       -- CEO Nwabudike Morgan,
^          \"The Centauri Monopoly\"
"
"##Orbital Defense Pod
#FAC37
God, from the mount of Sinai, whose gray top
Shall tremble, he descending, will himself,
In thunder, lightning, and loud trumpets' sound,
Ordain them laws.
^
^        -- John Milton,
^           Paradise Lost, Datalinks
"
"##Mass to Energy
#FAC38
I hold a scrap of paper in the darkness and
light it. I watch it burn bright and curl, disappearing
into nothingness, and the heat burns my fingers.
Where has it gone? What has it become? I cannot shake
the feeling that I have witnessed a form of transcendence.
^
^        -- Commissioner Pravin Lal,
^           \"The Convergence\"
"
           )

# Seed random generator
RANDOM=$$$(printf '%(%s)T\n' -1)


quote=${AC_QUOTES[$RANDOM % ${#AC_QUOTES[@]}]}

#create message of the day file and write a quote for next login
touch /etc/motd 2>/dev/null && echo "$quote" > /etc/motd
