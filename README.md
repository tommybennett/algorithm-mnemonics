# Algorithm Mnemonics: Increase Productivity with STL Algorithms

## Begin

For the impatient, a picture is worth 764 words, here is a video demonstrating algorithm mnemonics:

[Video Demonstration of Algorithm Mnemonics](https://www.youtube.com/watch?v=uzc2OWVZPnM)

Are you tired of typing begin and end?  Do you keep looking up the STL algorithms in a reference?  Would you like to use STL algorithms more?  

Introducing algorithm mnemonics.

Algorithm mnemonics is a way to operate at a higher level while constructing code.  Similar to mnemonics in assembly language, there is a mnemonic for every STL algorithm.  I call this the STL Instruction Set.  The entire STL Instruction Set is listed in the word document called STLInstructionSet.docx.

Many editors include a capability called abbreviations, aliases, template expansion, surround text, or simply code snippets.  This feature allows you to expand a code template into the editor by typing an abbreviated form of the expanded text.  Algorithm mnemonics is a method of maximizing the use of these facilities in your editor.  

If your editor doesn’t have this capability, it can most likely be implemented using the language of the editor.  I provide examples of how I have implemented it in [SlickEdit](http://www.slickedit.com) and vim below.  You can use these examples to foster an idea of how you could implement it in your editor of choice.

## How does it work?

There are different ways algorithm mnemonics can be implemented in an editor.  It depends on which editing facility you use or if you implement the facility yourself.  I will describe how it works in general and then show specific examples in [SlickEdit](http://www.slickedit.com) and vim.

In this example, let’s use the STL algorithm **std::count_if**.  The algorithm mnemonic is **cni**.  In the following code, you would type the container **v**:


```
  std::vector<int> v;
  v<cursor-here>
```

followed by **cni**:

```
  std::vector<int> v;
  vcni<cursor-here>
```

the editor would then recognize this sequence and expand to:


```
  std::vector<int> v;
  auto n = std::count_if( begin( v ), end( v ), []( <placeholder> ) {
    <placeholder>
  } ); 
```

You would then tab through each _placeholder_ to fill out the algorithm.

This is just one style, there are many different ways it could be implemented and invoked by the editor. The style you use will probably be dictated by the facility of the editor, unless of course you implement it yourself.

## SlickEdit

I use [SlickEdit](http://www.slickedit.com) in vim emulation mode as my primary editor.  In [SlickEdit](http://www.slickedit.com), there is a command called _surround_text_.  When _surround_text_ is invoked with _Command-S_ key binding, a dialog is displayed, you type the letters of the mnemonic, hit enter, and it surrounds the previous word at the cursor with the expanded text.  If you type the container before invoking _surround_text_, the _surround_text_ command will surround the container with the expanded text.  _Voilà!_

![SlickEdit Demonstration](https://github.com/tommybennett/algorithm-mnemonics/blob/master/SlickEdit/SlickEdit.png)

You can then step through the _placeholders_ to fill out the algorithm.

The video I used in the presentation was made using [SlickEdit](http://www.slickedit.com).  Here is a link to the video demonstrating algorithm mnemonics:

[Video Demonstration of Algorithm Mnemonics](https://www.youtube.com/watch?v=uzc2OWVZPnM)

## vim 

I couldn’t find a facility in vim to implement algorithm mnemonics.  I had to implement a suitable facility myself.  It doesn’t support tabbing through the _placeholders_.  It only expands the algorithm.  You have to use your vim nimbleness to navigate and fill out the algorithm.

In vim, you type the container, _Control-K_, followed by the mnemonic and it expands.  There are currently some issues with the implementation, it works, just not 100%.

## Emacs

Someone is currently implementing a version for Emacs.  Watch here for updates.

## End

Once you have added this to your editor, I suggest you go through each algorithm, use it in a real working example, or unit test.  Going through each algorithm will _tattoo_ the mnemonics and STL algorithms on your brain.  You will then be able to _summon_ them at will. 

You might be asking yourself if it is worth taking the time to implement this in your editor.  I can only tell you this.  There is no better feeling than when I am down in the trenches, wired in, cranking out code, and I notice a place where I can use a STL algorithm.  I deploy the mnemonic and it is almost like code exploding on my screen.  I often call the mnemonics small code generators or code grenades.  They detonate with a key press and blast on the screen.  

You will begin to actively seek places to use an algorithm.  What can be better than that? Eliminating raw loops with the mere thought of _three letters_ and you keep on moving.

It is pure joy.

