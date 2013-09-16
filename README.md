SoundLiteAS3
============

Add all sound related functionality within minutes to your game or application.

SoundLiteAS3 is the result of thinking why does a game developer need to code certain game sound related tasks again and again, even though they are simple.

### Why SoundLite?

For your game it allows very quick integration of features like
+ BG and SFX mute options.
+ Having a set of SFX sounds and playing them RANDOMLY or SEQUENTIALLY.
+ Allows setting volume levels for individual sounds
+ Fading In and Out of Background music when scene changes.

### Limitations
+ It can deal with Embedded Sound objects or the ones which are preloaded only, targeted at common flash games.
+ Doesn't bother with panning controls.

### How to use
- First preload your sounds in AS3 "Sound" objects either via embedding or other methods.
- Create MSound and MSoundGroup objects as needed for all your sounds
- Call MBG.init() and MSFX.init() always in the beginning
- Use MSFX.play() or MBG.play() methods and pass MSound objects.
- MSFX and MBG has methods to control muting of SFX and BG sounds

### Notes
- Alternatively you can use the MSound and MSoundGroup objects directly as well and call methods on their objects.
- MBG and MSFX has static methods, so no need to create objects
- Every class has "cleanUp()" method which sets all references it uses to null

### Example usage - Simple

//first declare the Embeds
[Embed(source="../res/loop.mp3")]
public static var bg_loop:Class;
 
[Embed(source="../res/sfx.mp3")]
public static var sfx_1:Class;

//create MSound objects
private var sfx1:MSound = new MSound(new sfx_1());
private var bgloop:MSound = new MSound(new bg_loop(), 1000, 0.4);

//init MBG and MSFX, preferably in AS3 main class constructor
MBG.init();
MSFX.init();

//use the methods on events as needed
MSFX.play(sfx1);
MBG.play(bgloop);	//fadesIn, when done through MBG
MBG.stop();			//fadesOut, when done through MBG
MBG.toggleMute();	//stop and starts last sound automatically when done on MBG
MSFX.setMute(true);

### Example usage - MSoundGroups

//gem0 to gem4 are MSound objects
private var allgems:Array = new Array(gem0, gem1, gem2, gem3, gem4);
private var gems_random:MSoundGroup = new MSoundGroup(allgems);
private var gems_sequential:MSoundGroup = new MSoundGroup(allgems, MSoundGroup.MODE_SEQUENTIAL);

//to play
MSFX.play(gems_random); //or
MSFX.play(gems_sequential);

### Important other notes
+ Explore the public methods in MSound and MSoundGroup classes and use them if needed